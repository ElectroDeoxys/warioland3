GrabGloveActionHelp:
	call .StateTable

	ld a, [wActionHelpBlackedOut]
	and a
	jp nz, .done

	ld hl, wMenuObj5FramesetPtr + 1
	ld a, [wMenuObj5FramesetBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld a, [wObjAnimWasReset]
	ld [wMenuObj5AnimationEnded], a
	ld hl, wMenuObj5YCoord
	farcall LoadActionHelpSprite_Far

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
	ld hl, wMenuObj4
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
	dw Func_1f959c
	dw Func_1f95de
	dw Func_1f95f9
	dw Func_1f963f
	dw Func_1f9685
	dw Func_1f9695
	dw Func_1f96bf
	dw Func_1f96fb
	dw ActionHelp_FlashBInput
	dw Func_1f9708
	dw Func_1f9720
	dw Func_1f97a2
	dw Func_1f97b2
	dw Func_1f97dc
	dw Func_1f981a
	dw ActionHelp_FlashDUpInput
	dw Func_1f9824
	dw Func_1f9847
	dw Func_1f98db
	dw Func_1f98eb
	dw Func_1f9915
	dw Func_1f9953
	dw Func_1f9963
	dw Func_1f9981
	dw Func_1f9999
	dw Func_1f9a3a
	dw Func_1f9a53
	dw Func_1f9a7d
	dw Func_1f9abb
	dw Func_1f9acb
	dw Func_1f9aee
	dw Func_1f9afb
	dw Func_1f9b2c
	dw Func_1f9b56
	dw Func_1f9b7a
	dw Func_1f9b8f

Func_1f9569:
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_LEVEL_CLEAR_F, a
	jr nz, .asm_1f9577
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1f9577
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
	jr Func_1f95a1

Func_1f959c:
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1f95a1:
	call ActionHelp_ShowInitialWarioWalk
	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowParaGoomWalk
	call ActionHelp_HideObj5BlockDebris

	ld hl, wMenuObj6
	ld a, $40
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b6a)
	ld [hli], a
	ld a, LOW(Frameset_1e6b6a)
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

Func_1f95de:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f95ea
	dec [hl]
.asm_1f95ea
	ld a, [hl]
	cp $70
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f95f9:
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
	jr z, .asm_1f9618
	dec [hl]
.asm_1f9618
	ld a, [wActionHelpWarioVar]
	cp $18
	ret c
	ld a, [wActionHelpWarioYCoord]
	cp $36
	ret c

	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput
	play_sfx SFX_014
	ld a, $0a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowParaGoomStun

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f963f:
	ld hl, wMenuObj4XCoord
	inc [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f964b
	inc [hl]
.asm_1f964b
	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wMenuObj4YCoord]
	add [hl]
	cp $40
	jr nc, .asm_1f9662
	ld [wMenuObj4YCoord], a

.asm_1f9662
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	cp $40
	ret c
	ld a, $40
	ld [wActionHelpWarioYCoord], a
	ld [wMenuObj4YCoord], a
	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioIdle
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9685:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9695:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f96a1
	dec [hl]
.asm_1f96a1
	ld a, [hl]
	cp $48
	ret nc

	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $05
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	call ActionHelp_ShowWarioGrab
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f96bf:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $03
	jr z, .asm_1f96db
	cp $06
	jr z, .asm_1f96eb
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z
	ld [hl], $30
	call ActionHelp_ShowWarioBeginGrab

	ld hl, wActionHelpState
	inc [hl]
	ret

.asm_1f96db
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $0c
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1f96eb
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $1c
	ld [de], a
	inc de
	ld a, [hl]
	add $06
	ld [de], a
	ret

Func_1f96fb:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioBeginThrow

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9708:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $30
	ret c
	ld [hl], $00

	call ActionHelp_ShowWarioThrow
	call ActionHelp_ShowParaGoomThrown
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9720:
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr z, .asm_1f9729
	call ActionHelp_ShowWarioIdle
.asm_1f9729
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $10
	jr nc, .asm_1f975d
	ld a, [wMenuObj4XCoord]
	add $02
	ld [wMenuObj4XCoord], a
	ld a, [hl]
	cp $03
	ret c
	ld hl, wMenuObj4YCoord
	cp $06
	jr c, .asm_1f974c
	cp $0a
	jr c, .asm_1f974b
	jr .asm_1f974e
.asm_1f974b
	inc [hl]
.asm_1f974c
	inc [hl]
	ret

.asm_1f974e
	ld a, [hl]
	add $03
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40
	ld a, $10
	ld [wTimer], a
	ret

.asm_1f975d
	ld a, [wMenuObj4XCoord]
	add $01
	ld [wMenuObj4XCoord], a
	ld a, [hl]
	ld hl, wMenuObj4YCoord
	cp $12
	jr c, .asm_1f977f
	cp $14
	jr c, .asm_1f9780
	cp $15
	jr c, .asm_1f9781
	cp $16
	jr c, .asm_1f9783
	cp $27
	jr c, .asm_1f974c
	jr .asm_1f9789
.asm_1f977f
	dec [hl]
.asm_1f9780
	dec [hl]
.asm_1f9781
	dec [hl]
	ret
.asm_1f9783
	ld a, $20
	ld [wTimer], a
	ret

.asm_1f9789
	ld a, [hl]
	add $02
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowParaGoomStun
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f97a2:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f97b2:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f97be
	dec [hl]
.asm_1f97be
	ld a, [hl]
	cp $48
	ret nc

	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $05
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	call ActionHelp_ShowWarioGrab
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f97dc:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $03
	jr z, .asm_1f97eb
	cp $06
	jr z, .asm_1f97fb
	jr .asm_1f980b
.asm_1f97eb
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $0c
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1f97fb
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $1c
	ld [de], a
	inc de
	ld a, [hl]
	add $06
	ld [de], a
	ret

.asm_1f980b
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z
	ld [hl], $30
	call ActionHelp_ShowWarioBeginGrab

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f981a:
	ld hl, wTimer
	dec [hl]
	ret nz
	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9824:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, .asm_1f9840
	cp $30
	ret c
	ld [hl], $00

	call ActionHelp_ShowWarioThrow
	call ActionHelp_ShowParaGoomThrown
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

.asm_1f9840
	call ActionHelp_ShowWarioBeginThrow
	call ActionHelp_ShowBInput
	ret

Func_1f9847:
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr z, .asm_1f9850
	call ActionHelp_ShowWarioIdle
.asm_1f9850
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $30
	jr nc, .asm_1f989e
	ld a, [wMenuObj4XCoord]
	add $01
	ld [wMenuObj4XCoord], a
	ld a, [hl]
	ld hl, wMenuObj4YCoord
	cp $07
	jr c, .asm_1f9886
	cp $0d
	jr c, .asm_1f9887
	cp $0f
	jr c, .asm_1f9888
	cp $11
	jr c, .asm_1f9889
	cp $14
	ret c
	cp $17
	jr c, .asm_1f988d
	cp $1a
	jr c, .asm_1f988c
	cp $1d
	jr c, .asm_1f988b
	jr .asm_1f988f
.asm_1f9886
	dec [hl]
.asm_1f9887
	dec [hl]
.asm_1f9888
	dec [hl]
.asm_1f9889
	dec [hl]
	ret
.asm_1f988b
	inc [hl]
.asm_1f988c
	inc [hl]
.asm_1f988d
	inc [hl]
	ret

.asm_1f988f
	ld a, [hl]
	add $04
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40
	ld a, $30
	ld [wTimer], a
	ret

.asm_1f989e
	ld a, [hl]
	ld hl, wMenuObj4YCoord
	cp $32
	jr c, .asm_1f98b8
	cp $34
	jr c, .asm_1f98b9
	cp $35
	jr c, .asm_1f98ba
	cp $36
	jr c, .asm_1f98bc
	cp $47
	jr c, .asm_1f988d
	jr .asm_1f98c2
.asm_1f98b8
	dec [hl]
.asm_1f98b9
	dec [hl]
.asm_1f98ba
	dec [hl]
	ret

.asm_1f98bc
	ld a, $40
	ld [wTimer], a
	ret

.asm_1f98c2
	ld a, [hl]
	add $02
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowParaGoomStun
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f98db:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f98eb:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f98f7
	dec [hl]
.asm_1f98f7
	ld a, [hl]
	cp $48
	ret nc

	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $05
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	call ActionHelp_ShowWarioGrab
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9915:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $03
	jr z, .asm_1f9924
	cp $06
	jr z, .asm_1f9934
	jr .asm_1f9944
.asm_1f9924
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $0c
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1f9934
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $1c
	ld [de], a
	inc de
	ld a, [hl]
	add $06
	ld [de], a
	ret

.asm_1f9944
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z
	ld [hl], $30

	call ActionHelp_ShowWarioBeginGrab

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9953:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioGrabWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9963:
	ld hl, wMenuObj6XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f996f
	dec [hl]
.asm_1f996f
	ld a, [hl]
	cp $5c
	ret nc

	call ActionHelp_ShowWarioBeginThrow
	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowBInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9981:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $30
	ret c
	ld [hl], $00

	call ActionHelp_ShowWarioThrow
	call ActionHelp_ShowParaGoomThrown
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9999:
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr z, .asm_1f99a2
	call ActionHelp_ShowWarioIdle
.asm_1f99a2
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $10
	jr nc, .asm_1f99e0
	ld a, [wMenuObj6XCoord]
	ld b, a
	ld a, [wMenuObj4XCoord]
	add $02
	ld [wMenuObj4XCoord], a
	cp b
	push hl
	call nc, .Func_1f9a25
	pop hl
	ld a, [hl]
	cp $03
	ret c
	ld hl, wMenuObj4YCoord
	cp $06
	jr c, .asm_1f99cf
	cp $0a
	jr c, .asm_1f99ce
	jr .asm_1f99d1
.asm_1f99ce
	inc [hl]
.asm_1f99cf
	inc [hl]
	ret

.asm_1f99d1
	ld a, [hl]
	add $03
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40
	ld a, $10
	ld [wTimer], a
	ret

.asm_1f99e0
	ld a, [wMenuObj4XCoord]
	add $01
	ld [wMenuObj4XCoord], a
	ld a, [hl]
	ld hl, wMenuObj4YCoord
	cp $12
	jr c, .asm_1f9a02
	cp $14
	jr c, .asm_1f9a03
	cp $15
	jr c, .asm_1f9a04
	cp $16
	jr c, .asm_1f9a06
	cp $27
	jr c, .asm_1f99cf
	jr .asm_1f9a0c
.asm_1f9a02
	dec [hl]
.asm_1f9a03
	dec [hl]
.asm_1f9a04
	dec [hl]
	ret
.asm_1f9a06
	ld a, $20
	ld [wTimer], a
	ret

.asm_1f9a0c
	ld a, [hl]
	add $02
	ld [hl], a
	cp $40
	ret c
	ld [hl], $40
	call ActionHelp_ShowWarioIdle
	call ActionHelp_ShowParaGoomStun
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret

.Func_1f9a25
	ld b, $00
	call ActionHelp_ShowBlockDebrisWithYOffset
	ld a, [wMenuObj6]
	ld [wMenuObj5YCoord], a
	ld a, [wMenuObj6XCoord]
	ld [wMenuObj5XCoord], a
	call ActionHelp_ShowOverheadPillar
	ret

Func_1f9a3a:
	ld a, [wMenuObj5AnimationEnded]
	and a
	jr z, .asm_1f9a43
	call ActionHelp_HideObj5BlockDebris
.asm_1f9a43
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9a53:
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f9a5f
	dec [hl]
.asm_1f9a5f
	ld a, [hl]
	cp $48
	ret nc

	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $05
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	call ActionHelp_ShowWarioGrab
	call ActionHelp_ClearDPadInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9a7d:
	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp $03
	jr z, .asm_1f9a8c
	cp $06
	jr z, .asm_1f9a9c
	jr .asm_1f9aac
.asm_1f9a8c
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $0c
	ld [de], a
	inc de
	ld a, [hl]
	add $10
	ld [de], a
	ret

.asm_1f9a9c
	ld hl, wActionHelpWario
	ld de, wMenuObj4YCoord
	ld a, [hli]
	sub $1c
	ld [de], a
	inc de
	ld a, [hl]
	add $06
	ld [de], a
	ret

.asm_1f9aac
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	ret z
	ld [hl], $30
	call ActionHelp_ShowWarioBeginGrab

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9abb:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioGrabWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9acb:
	ld hl, wMenuObj6XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f9ad7
	dec [hl]
.asm_1f9ad7
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

Func_1f9aee:
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioChargeThrow

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9afb:
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

Func_1f9b2c:
	play_sfx_rept 30, SFX_FULLY_CHARGED_THROW

	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioFullyChargedThrow
	call ActionHelp_ShowParaGoomThrown
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret

Func_1f9b56:
	ld a, [wActionHelpWarioAnimationEnded]
	and a
	jr z, .asm_1f9b5f
	call ActionHelp_ShowWarioIdle
.asm_1f9b5f
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

Func_1f9b7a:
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

Func_1f9b8f:
	ld hl, wMenuObj6XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f9b9b
	dec [hl]
.asm_1f9b9b
	ld a, [hl]
	cp $e8
	ret c
	jp Func_1f9569
