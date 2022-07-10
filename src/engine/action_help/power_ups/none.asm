NoPowerUpActionHelp: ; 1f8285 (7e:4285)
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
	ld hl, wMenuObj5
	farcall AddActionHelpSprite_Far

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
	dw Func_1f8395
	dw Func_1f83ba
	dw Func_1f83d5
	dw Func_1f842e
	dw Func_1f847a
	dw ActionHelp_FlashBInput
	dw Func_1f848c
	dw Func_1f84d7
	dw Func_1f8522
	dw Func_1f853a
	dw Func_1f8588
	dw Func_1f85c3
	dw Func_1f85d3
	dw Func_1f85eb
	dw Func_1f8638
	dw Func_1f8673
	dw Func_1f8683
	dw Func_1f86b5
	dw Func_1f86ee
	dw Func_1f8708
	dw Func_1f8730
	dw Func_1f8778
	dw Func_1f8788
	dw ActionHelp_FlashDDownInput
	dw Func_1f87a1
	dw Func_1f87bd
	dw Func_1f87d6
	dw Func_1f87fb
	dw Func_1f883c
	dw Func_1f884c
	dw Func_1f886b
	dw Func_1f88a4
; 0x1f8362

Func_1f8362: ; 1f8362 (7e:4362)
	ld a, [wPowerUpLevel]
	bit ACTION_HELP_UNK_F, a
	jr nz, .asm_1f8370
	bit ACTION_HELP_TITLE_SCREEN_F, a
	jr z, .restart_action_help
	jp InitWithoutDemoPowerUpReset

.asm_1f8370
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
	jr Func_1f839a
; 0x1f8395

Func_1f8395: ; 1f8395 (7e:4395)
	ld hl, wTimer
	dec [hl]
	ret nz
Func_1f839a: ; 1f839a (7e:439a)
	call ActionHelp_ShowInitialWarioWalk
	call ActionHelp_ShowDRightInput
	call ActionHelp_ShowParaGoomWalk
	call ActionHelp_HideObj5BlockDebris
	farcall LoadActionHelpPalsWithoutWater

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f83ba

Func_1f83ba: ; 1f83ba (7e:43ba)
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
; 0x1f83d5

Func_1f83d5: ; 1f83d5 (7e:43d5)
	ld hl, wActionHelpWarioVar
	inc [hl]

	; set jumping y coordinate
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
	jr c, .move_paragoom
	ld a, [wActionHelpWarioYCoord]
	cp $34
	jr c, .move_paragoom
	jr .step_on_paragoom
.move_paragoom
	; don't move Para-Goom if it's already at Wario's x pos
	ld hl, wMenuObj4XCoord
	ld a, [wActionHelpWarioXCoord]
	cp [hl]
	ret z
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [wActionHelpWarioXCoord]
	cp [hl]
	ret c
	ld a, [wActionHelpWarioXCoord]
	ld [hl], a
	call ActionHelp_ClearButtonsInput
	call ActionHelp_ClearDPadInput
	ret

.step_on_paragoom
	play_sfx SFX_014
	ld a, $0a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowParaGoomStun

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f842e

Func_1f842e: ; 1f842e (7e:442e)
	ld hl, wActionHelpWarioVar
	inc [hl]

	; set jumping y coordinate
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wActionHelpWarioYCoord]
	add [hl]
	ld [wActionHelpWarioYCoord], a
	ld a, [wMenuObj4YCoord]
	add [hl]
	ld [wMenuObj4YCoord], a
	cp $40
	jr nc, .land_wario

	ld hl, wMenuObj4XCoord
	inc [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_inc
	inc [hl]
.skip_inc
	ret

.land_wario
	ld a, $40
	ld [wMenuObj4YCoord], a
	ld a, [wActionHelpWarioYCoord]
	cp $40
	ret c
	ld a, $40
	ld [wActionHelpWarioYCoord], a
	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioIdle
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f847a

Func_1f847a: ; 1f847a (7e:447a)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioAttack
	ld a, $30
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f848c

Func_1f848c: ; 1f848c (7e:448c)
	play_sfx_rept 6, SFX_ATTACK

	ld hl, wActionHelpWarioVar
	dec [hl]
	ld a, [hl]
	cp $2b
	ret nc
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [hl]
	cp $4c
	ret nc

	play_sfx SFX_017
	call ActionHelp_ClearButtonsInput
	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioIdle
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f84d7

Func_1f84d7: ; 1f84d7 (7e:44d7)
	ld hl, wMenuObj4XCoord
	inc [hl]
	inc [hl]

	ld hl, wActionHelpWarioVar
	inc [hl]
	ld a, [hl]
	cp $28
	jr c, .asm_1f84e8
	ld a, $27
	ld [hl], a
.asm_1f84e8
	ld e, a
	ld d, $00
	ld hl, JumpVelTable_Normal
	add hl, de
	ld a, [wMenuObj4YCoord]
	add [hl]
	ld [wMenuObj4YCoord], a
	cp $80
	ret c

	; load cracked and solid blocks
	ld hl, wMenuObj4
	ld a, $40
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6ba5)
	ld [hli], a
	ld a, LOW(Frameset_1e6ba5)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a

	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8522

Func_1f8522: ; 1f8522 (7e:4522)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $78
	ret nc

	call ActionHelp_ShowBInput
	call ActionHelp_ShowWarioAttack
	ld a, $30
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f853a

Func_1f853a: ; 1f853a (7e:453a)
	play_sfx_rept 6, SFX_ATTACK

	ld hl, wActionHelpWarioVar
	dec [hl]
	ld a, [hl]
	cp $2b
	ret nc
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

	ld hl, wMenuObj5
	lb bc, $0, $10
	call ActionHelp_ShowBlockDebris
	call ActionHelp_ShowSingleSolidBlock
	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput
	call ActionHelp_ShowWarioAttack
	ld a, $0e
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8588

Func_1f8588: ; 1f8588 (7e:4588)
	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
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

	xor a
	ld [wActionHelpWarioVar], a
	ld a, $40
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_HideObj5BlockDebris
	call ActionHelp_ShowWarioIdle
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f85c3

Func_1f85c3: ; 1f85c3 (7e:45c3)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f85d3

Func_1f85d3: ; 1f85d3 (7e:45d3)
	ld hl, wActionHelpWarioXCoord
	inc [hl]
	ld a, [hl]
	cp $40
	ret c

	call ActionHelp_ShowBInput
	call ActionHelp_ShowWarioAttack
	ld a, $30
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f85eb

Func_1f85eb: ; 1f85eb (7e:45eb)
	play_sfx_rept 6, SFX_ATTACK

	ld hl, wActionHelpWarioVar
	dec [hl]
	ld a, [hl]
	cp $2b
	ret nc
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec_x
	ld hl, wMenuObj4XCoord
	dec [hl]
.skip_dec_x
	ld a, [hl]
	cp $50
	ret nc

	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput
	call ActionHelp_ShowWarioAttack

	play_sfx SFX_BUMP
	ld a, $0e
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8638

Func_1f8638: ; 1f8638 (7e:4638)
	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
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

	xor a
	ld [wActionHelpWarioVar], a
	ld a, $40
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_HideObj5BlockDebris
	call ActionHelp_ShowWarioIdle
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8673

Func_1f8673: ; 1f8673 (7e:4673)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8683

Func_1f8683: ; 1f8683 (7e:4683)
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $40
	jr z, .asm_1f8690
	inc [hl]
	ld a, [hl]
	cp $40
	ret c
.asm_1f8690
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [hl]
	cp $58
	ret nc
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	sub $40
	cp $1c
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f86b5

Func_1f86b5: ; 1f86b5 (7e:46b5)
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $40
	jr z, .asm_1f86be
	inc [hl]
.asm_1f86be
	ld hl, wActionHelpWarioEnd
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
	jr nc, .asm_1f86da
	ld hl, wMenuObj4XCoord
	dec [hl]
	ret

.asm_1f86da
	xor a
	ld [wActionHelpWarioEnd], a
	ld a, $40
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_ShowWarioWalk
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f86ee

Func_1f86ee: ; 1f86ee (7e:46ee)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $e8
	ret c

	call ActionHelp_ShowSlide
	xor a
	ld [wActionHelpWarioVar], a
	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8708

Func_1f8708: ; 1f8708 (7e:4708)
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $40
	jr z, .asm_1f8715
	inc [hl]
	ld a, [hl]
	cp $40
	ret c
.asm_1f8715
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .asm_1f8721
	dec [hl]
.asm_1f8721
	ld a, [hl]
	cp $60
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8730

Func_1f8730: ; 1f8730 (7e:4730)
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
	jr z, .skip_dex
	dec [hl]
.skip_dex
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
; 0x1f8778

Func_1f8778: ; 1f8778 (7e:4778)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f8788

Func_1f8788: ; 1f8788 (7e:4788)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $39
	ret nc
	cp $30
	jr c, .slide
	ld hl, wActionHelpWarioYCoord
	inc [hl]
	ret
.slide
	call ActionHelp_ShowWarioSlide

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f87a1

Func_1f87a1: ; 1f87a1 (7e:47a1)
	ld hl, wActionHelpWarioYCoord
	ld a, [hl]
	cp $40
	jr nc, .skip_inc
	inc [hl]
.skip_inc
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $18
	ret nc

	call ActionHelp_ClearDPadInput
	call ActionHelp_ShowWarioRoll

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f87bd

Func_1f87bd: ; 1f87bd (7e:47bd)
	ld hl, wActionHelpWarioYCoord
	ld a, [hl]
	cp $40
	jr nc, .skip_inc
	inc [hl]
.skip_inc
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $d8
	ret nz
	call ActionHelp_ShowSingleSolidBlock

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f87d6

Func_1f87d6: ; 1f87d6 (7e:47d6)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [hl]
	cp $50
	ret nc

	call ActionHelp_ShowWarioBump
	play_sfx SFX_BUMP ; unnecessary
	ld a, $0e
	ld [wActionHelpWarioVar], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f87fb

Func_1f87fb: ; 1f87fb (7e:47fb)
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

	ld hl, wActionHelpWarioXCoord
	dec [hl]
	ld a, [wActionHelpCounter]
	and %1
	jr z, .skip_dec
	dec [hl]
.skip_dec
	ld a, [wActionHelpWarioVar]
	cp $18
	ret c
	ld a, [wActionHelpWarioYCoord]
	cp $40
	ret c

	ld a, $40
	ld [wActionHelpWarioYCoord], a
	call ActionHelp_ShowWarioIdle
	xor a
	ld [wActionHelpWarioVar], a
	ld a, $30
	ld [wTimer], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f883c

Func_1f883c: ; 1f883c (7e:483c)
	ld hl, wTimer
	dec [hl]
	ret nz

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ShowDRightInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f884c

Func_1f884c: ; 1f884c (7e:484c)
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $40
	jr z, .asm_1f8856
	inc [hl]
	ld a, [hl]
.asm_1f8856
	ld b, a
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	sub b
	cp $1c
	ret nc

	call ActionHelp_ShowAInput
	call ActionHelp_ShowWarioJump

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f886b

Func_1f886b: ; 1f886b (7e:486b)
	ld hl, wActionHelpWarioXCoord
	ld a, [hl]
	cp $40
	jr z, .skip_inc
	inc [hl]
.skip_inc
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
	jr nc, .asm_1f8890
	ld hl, wMenuObj4XCoord
	dec [hl]
	ret

.asm_1f8890
	xor a
	ld [wActionHelpWarioVar], a
	ld a, $40
	ld [wActionHelpWarioYCoord], a

	call ActionHelp_ShowWarioWalk
	call ActionHelp_ClearButtonsInput

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1f88a4

Func_1f88a4: ; 1f88a4 (7e:48a4)
	ld hl, wMenuObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $e8
	ret c
	jp Func_1f8362
; 0x1f88af
