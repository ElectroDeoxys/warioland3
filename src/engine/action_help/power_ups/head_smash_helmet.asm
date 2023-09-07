HeadSmashHelmetActionHelp: ; 1f91c5 (7e:51c5)
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
	farcall AddActionHelpSprite_Far

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
	farcall $05, UpdateObjAnim

.action_help_frozen
	ld hl, wMenuObj4YCoord
	farcall AddActionHelpSprite_Far
	ld hl, wActionHelpWario
	farcall AddActionHelpWarioSprite
.done
	ret

.StateTable:
	ld a, [wActionHelpState]
	jumptable

	dw ActionHelp_Init
	dw Func_1f92ad
	dw Func_1f92ee
	dw Func_1f9306
	dw ActionHelp_FlashAInput
	dw Func_1f9313
	dw Func_1f935b
	dw Func_1f938a
	dw Func_1f93a3
	dw Func_1f93bb
	dw Func_1f93cb
	dw Func_1f9413
	dw Func_1f9442
; 0x1f927a

Func_1f927a: ; 1f927a (7e:527a)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_LEVEL_CLEAR_F, a
	jr nz, .asm_1f9288
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1f9288
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
	jr Func_1f92b2
; 0x1f92ad

Func_1f92ad: ; 1f92ad (7e:52ad)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1f92b2: ; 1f92b2 (7e:52b2)
	call ActionHelp_ShowInitialWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wMenuObj4
	ld a, $20
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b64)
	ld [hli], a
	ld a, LOW(Frameset_1e6b64)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hli], a
	xor a
	ld [hl], a

	call ActionHelp_HideObj5BlockDebris
	farcall LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f92ee

Func_1f92ee: ; 1f92ee (7e:52ee)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $40
	ret nc

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearDPadInput
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f9306

Func_1f9306: ; 1f9306 (7e:5306)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f9313

Func_1f9313: ; 1f9313 (7e:5313)
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
	sub $18
	ld hl, wMenuObj4YCoord
	cp [hl]
	ret nc
	ld a, $18
	ld [wActionHelpWarioVar], a
	ld b, $00
	call ActionHelp_ShowBlockDebrisWithYOffset

	ld hl, wMenuObj4YCoord
	ld a, $20
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b67)
	ld [hli], a
	ld a, LOW(Frameset_1e6b67)
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
; 0x1f935b

Func_1f935b: ; 1f935b (7e:535b)
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
	call ActionHelp_ClearButtonsInput
	call ActionHelp_ShowWarioIdle
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f938a

Func_1f938a: ; 1f938a (7e:538a)
	ld a, [wMenuObj5AnimationEnded]
	and a
	jr z, .skip_hide
	call ActionHelp_HideObj5BlockDebris
.skip_hide
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f93a3

Func_1f93a3: ; 1f93a3 (7e:53a3)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $40
	ret nc

	call ActionHelp_ShowWarioIdle
	call ActionHelp_ClearDPadInput
	ld a, $10
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f93bb

Func_1f93bb: ; 1f93bb (7e:53bb)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioJump
	call ActionHelp_ShowAInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f93cb

Func_1f93cb: ; 1f93cb (7e:53cb)
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
	sub $18
	ld hl, wMenuObj4YCoord
	cp [hl]
	ret nc
	ld a, $18
	ld [wActionHelpWarioVar], a
	ld b, $00
	call ActionHelp_ShowBlockDebrisWithYOffset

	ld hl, wMenuObj4YCoord
	ld a, $20
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
	xor a
	ld [hl], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f9413

Func_1f9413: ; 1f9413 (7e:5413)
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
	call ActionHelp_ClearButtonsInput
	call ActionHelp_ShowWarioIdle
	ld a, $20
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f9442

Func_1f9442: ; 1f9442 (7e:5442)
	ld a, [wMenuObj5AnimationEnded]
	and a
	jr z, .skip_hide
	call ActionHelp_HideObj5BlockDebris
.skip_hide
	ld hl, wTimer
	dec [hl]
	ret nz

	jp Func_1f927a
; 0x1f9453
