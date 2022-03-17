ActionHelp_FlashDDownInput: ; 1fb5a1 (7e:75a1)
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_d_down
	call ActionHelp_ClearDPadInput
	ret
.show_d_down
	play_sfx SFX_0EC
	call ActionHelp_ShowDDownInput
	ld a, [wTimer]
	cp $07
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1fb5d5

ActionHelp_FlashDUpInput: ; 1fb5d5 (7e:75d5)
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_d_up
	call ActionHelp_ClearDPadInput
	ret
.show_d_up
	play_sfx SFX_0EC
	call ActionHelp_ShowDUpInput
	ld a, [wTimer]
	cp $7
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1fb609

ActionHelp_FlashBInput: ; 1fb609 (7e:7609)
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_b_button
	call ActionHelp_ClearButtonsInput
	ret
.show_b_button
	play_sfx SFX_0EC
	call ActionHelp_ShowBInput
	ld a, [wTimer]
	cp $7
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1fb63d

ActionHelp_FlashAInput: ; 1fb63d (7e:763d)
	ld a, TRUE
	ld [wActionHelpFrozen], a

	ld a, [wActionHelpCounter]
	and %11
	ret nz
	ld hl, wTimer
	inc [hl]
	bit 0, [hl]
	jr nz, .show_a_button
	call ActionHelp_ClearButtonsInput
	ret
.show_a_button
	play_sfx SFX_0EC
	call ActionHelp_ShowAInput
	ld a, [wTimer]
	cp $7
	ret c

	xor a
	ld [wTimer], a
	ld [wActionHelpFrozen], a

	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1fb671

ActionHelp_Init: ; 1fb671 (7e:7671)
	xor a
	ld [wAnimatedTilesFrameDuration], a
	ld [wAnimatedTilesGfx], a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld [wActionHelpFrozen], a
	ld [wRoomAnimatedTilesEnabled], a

	ld a, $04
	ld [wSCY], a

	farcall Func_1e48bc
	farcall Func_1e4a47
	call ActionHelp_ClearDPadInput
	call ActionHelp_ClearButtonsInput

	ld a, $60
	ld [wTimer], a
	ld hl, wActionHelpState
	inc [hl]
	ret
; 0x1fb6b7

VBlank_1fb6b7: ; 1fb6b7 (7e:76b7)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wIsDMATransferPending]
	and a
	jr z, .not_pending
	ld hl, wPendingDMASourceBank
	ld a, [hli]
	ld [MBC5RomBank], a
	ld c, LOW(rHDMA1)
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ldh [rVBK], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hl]
	ld [$ff00+c], a
	xor a
	ld [wIsDMATransferPending], a
.not_pending
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x1fb6f7

Func_1fb6f7: ; 1fb6f7 (7e:76f7)
	ld hl, wActionHelpPowerUp
	ld a, [wJoypadPressed]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.d_right
	ld a, [hl]
	cp NUM_MAIN_POWER_UPS - 1
	ret z
	ld e, a
	inc [hl] ; next Power-Up
	xor a
	ld [wActionHelpState], a
	ld a, [wMenuObj1XCoord]
	add $10
	ld [wMenuObj1XCoord], a
	jr .asm_1fb72b

.d_left
	ld a, [hl]
	and a
	ret z
	ld e, a
	dec [hl] ; prev Power-Up
	xor a
	ld [wActionHelpState], a
	ld a, [wMenuObj1XCoord]
	sub $10
	ld [wMenuObj1XCoord], a

.asm_1fb72b
	ld a, TRUE
	ld [wActionHelpBlackedOut], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	cp e
	jr c, .asm_1fb750
	ld hl, v1BGMap1 + $200
	sla e
	ld d, $00
	add hl, de
	ld e, BG_MAP_WIDTH
	call WaitVBlank
	ld a, $03
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a
.asm_1fb750
	ld a, [wActionHelpPowerUp]
	ld e, a
	ld a, [wPowerUpLevel]
	and POWER_UP_MASK
	cp e
	jr c, .finish
	ld hl, PowerUpOBPals
	ld d, $00
	add hl, de
	ld b, [hl]
	ld hl, v1BGMap1 + $200
	sla e
	add hl, de
	ld e, BG_MAP_WIDTH
	call WaitVBlank
	ld a, b
	ld [hli], a
	ld [hld], a
	add hl, de
	ld [hli], a
	ld [hl], a

.finish
	xor a
	ldh [rVBK], a
	play_sfx SFX_0E2
	ret
; 0x1fb780

PowerUpOBPals: ; 1fb780 (7e:7780)
	db OBPAL_POWER_UP_RED
	db OBPAL_POWER_UP_BLUE
	db OBPAL_POWER_UP_GREEN
	db OBPAL_POWER_UP_GREEN
	db OBPAL_POWER_UP_RED
	db OBPAL_POWER_UP_YELLOW
	db OBPAL_POWER_UP_RED
	db OBPAL_POWER_UP_BLUE
	db OBPAL_POWER_UP_GREEN
	db OBPAL_POWER_UP_YELLOW
; 0x1fb78a

ActionHelp_ClearDPadInput: ; 1fb78a (7e:778a)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b76)
	ld [hli], a
	ld a, LOW(Frameset_1e6b76)
	ld [hl], a
	ret
; 0x1fb797

ActionHelp_ShowDRightInput: ; 1fb797 (7e:7797)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b7c)
	ld [hli], a
	ld a, LOW(Frameset_1e6b7c)
	ld [hl], a
	ret
; 0x1fb7a4

ActionHelp_ShowDLeftInput: ; 1fb7a4 (7e:77a4)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b82)
	ld [hli], a
	ld a, LOW(Frameset_1e6b82)
	ld [hl], a
	ret
; 0x1fb7b1

ActionHelp_ShowDDownInput: ; 1fb7b1 (7e:77b1)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b7f)
	ld [hli], a
	ld a, LOW(Frameset_1e6b7f)
	ld [hl], a
	ret
; 0x1fb7be

ActionHelp_ShowDUpInput: ; 1fb7be (7e:77be)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b79)
	ld [hli], a
	ld a, LOW(Frameset_1e6b79)
	ld [hl], a
	ret
; 0x1fb7cb

ActionHelp_ShowDRightAndDDownInput: ; 1fb7cb (7e:77cb)
	xor a
	ld hl, wMenuObj2FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6ba8)
	ld [hli], a
	ld a, LOW(Frameset_1e6ba8)
	ld [hl], a
	ret
; 0x1fb7d8

ActionHelp_ClearButtonsInput: ; 1fb7d8 (7e:77d8)
	ld hl, wMenuObj3FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b6d)
	ld [hli], a
	ld a, LOW(Frameset_1e6b6d)
	ld [hl], a
	ret
; 0x1fb7e5

ActionHelp_ShowAInput: ; 1fb7e5 (7e:77e5)
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b70)
	ld [hli], a
	ld a, LOW(Frameset_1e6b70)
	ld [hl], a
	ret
; 0x1fb7f2

ActionHelp_ShowBInput: ; 1fb7f2 (7e:77f2)
	xor a
	ld hl, wMenuObj3FramesetOffset
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b73)
	ld [hli], a
	ld a, LOW(Frameset_1e6b73)
	ld [hl], a
	ret
; 0x1fb7ff

ActionHelp_HideObj5BlockDebris: ; 1fb7ff (7e:77ff)
	ld hl, wMenuObj5
ActionHelp_HideBlockDebris: ; 1fb802 (7e:7802)
	ld a, $a0
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
	ret
; 0x1fb81f

; b = y offset of debris
ActionHelp_ShowBlockDebrisWithYOffset: ; 1fb81f (7e:781f)
	ld hl, wMenuObj5YCoord
	ld c, $00
;	fallthrough

; b = y offset of debris
; c = x offset of debris
ActionHelp_ShowBlockDebris: ; 1fb824 (7e:7824)
	play_sfx SFX_BLOCK_BREAK

	ld a, [wMenuObj4YCoord]
	sub b
	ld [hli], a
	ld a, [wMenuObj4XCoord]
	sub c
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d49a)
	ld [hli], a
	ld a, LOW(Frameset_d49a)
	ld [hli], a
	ld a, HIGH(OAM_d20e)
	ld [hli], a
	ld a, LOW(OAM_d20e)
	ld [hli], a
	ld a, BANK(OAM_d20e)
	ld [hli], a
	xor a
	ld [hl], a
	ret
; 0x1fb84d

ActionHelp_ShowInitialWarioWalk: ; 1fb84d (7e:784d)
	ld a, BANK(WarioWalkGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
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
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_149c5)
	ld [hli], a
	ld a, LOW(Frameset_149c5)
	ld [hli], a
	xor a
	ld [hl], a ; wActionHelpWarioJumpVelIndex
	ld [wSFXTimer], a
	ld a, HIGH(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fb899

ActionHelp_ShowWarioJump: ; 1fb899 (7e:7899)
	play_sfx SFX_JUMP

	ld a, BANK(WarioAirborneGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15f97)
	ld [hli], a
	ld a, LOW(Frameset_15f97)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fb8e2

ActionHelp_ShowWarioJumpLeft: ; 1fb8e2 (7e:78e2)
	play_sfx SFX_JUMP

	ld a, BANK(WarioAirborneGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15f94)
	ld [hli], a
	ld a, LOW(Frameset_15f94)
	ld [hli], a
	xor a
	ld [hl], a
	ld a, HIGH(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fb92b

ActionHelp_ShowWarioSmashAttack: ; 1fb92b (7e:792b)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wActionHelpPowerUp]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr nc, .got_super_jump_slam
	ld a, HIGH(Frameset_15f91)
	ld [hli], a
	ld a, LOW(Frameset_15f91)
	ld [hli], a
	ld a, $18
	ld [hl], a ; wActionHelpWarioJumpVelIndex
	ret

.got_super_jump_slam
	ld a, HIGH(Frameset_16055)
	ld [hli], a
	ld a, LOW(Frameset_16055)
	ld [hli], a
	ld a, $18
	ld [hl], a ; wActionHelpWarioJumpVelIndex
	ret
; 0x1fb94c

ActionHelp_ShowWarioGroundPound: ; 1fb94c (7e:794c)
	play_sfx SFX_GROUND_POUND
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16009)
	ld [hli], a
	ld a, LOW(Frameset_16009)
	ld [hl], a
	ret
; 0x1fb961

ActionHelp_ShowWarioGroundShake: ; 1fb961 (7e:7961)
	play_sfx SFX_002

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15fc5)
	ld [hli], a
	ld a, LOW(Frameset_15fc5)
	ld [hl], a
	ret
; 0x1fb976

ActionHelp_ShowWarioLand: ; 1fb976 (7e:7976)
	play_sfx SFX_LAND

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15fa1)
	ld [hli], a
	ld a, LOW(Frameset_15fa1)
	ld [hl], a
	ret
; 0x1fb98b

ActionHelp_ShowWarioIdle: ; 1fb98b (7e:798b)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1425f)
	ld [hli], a
	ld a, LOW(Frameset_1425f)
	ld [hl], a
	ld a, HIGH(OAM_14000)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_14000)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fb9ca

ActionHelp_ShowWarioWalk: ; 1fb9ca (7e:79ca)
	ld a, BANK(WarioWalkGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_149c5)
	ld [hli], a
	ld a, LOW(Frameset_149c5)
	ld [hli], a
	ld a, HIGH(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fba09

ActionHelp_ShowWarioSwim: ; 1fba09 (7e:7a09)
	play_sfx SFX_SLIDE

	ld a, BANK(WarioSwimGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioSwimGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioSwimGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1555b)
	ld [hli], a
	ld a, LOW(Frameset_1555b)
	ld [hli], a
	ld a, HIGH(OAM_15254)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15254)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fba50

ActionHelp_ShowWarioSwimLeft: ; 1fba50 (7e:7a50)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15554)
	ld [hli], a
	ld a, LOW(Frameset_15554)
	ld [hli], a
	ret
; 0x1fba5d

ActionHelp_ShowWarioSubmerge: ; 1fba5d (7e:7a5d)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1558b)
	ld [hli], a
	ld a, LOW(Frameset_1558b)
	ld [hli], a

	xor a
	ld [wSFXTimer], a
	ret
; 0x1fba6e

ActionHelp_ShowWarioUnderwaterThrust: ; 1fba6e (7e:7a6e)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_155c5)
	ld [hli], a
	ld a, LOW(Frameset_155c5)
	ld [hli], a

	xor a
	ld [wSFXTimer], a
	ret
; 0x1fba7f

ActionHelp_ShowWarioUnderwaterStopped: ; 1fba7f (7e:7a7f)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1556c)
	ld [hli], a
	ld a, LOW(Frameset_1556c)
	ld [hli], a
	ret
; 0x1fba8c

ActionHelp_ShowWarioGrab: ; 1fba8c (7e:7a8c)
	play_sfx SFX_GRAB

	ld a, BANK(WarioThrowGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1640c)
	ld [hli], a
	ld a, LOW(Frameset_1640c)
	ld [hli], a
	ld a, HIGH(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fbad3

ActionHelp_ShowWarioSlowGrab: ; 1fbad3 (7e:7ad3)
	play_sfx SFX_GRAB

	ld a, BANK(WarioThrowGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16415)
	ld [hli], a
	ld a, LOW(Frameset_16415)
	ld [hli], a
	ld a, HIGH(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fbb1a

ActionHelp_ShowWarioBeginGrab: ; 1fbb1a (7e:7b1a)
	ld a, BANK(WarioWalkGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_14a23)
	ld [hli], a
	ld a, LOW(Frameset_14a23)
	ld [hli], a
	ld a, HIGH(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fbb59

ActionHelp_ShowWarioGrabWalk: ; 1fbb59 (7e:7b59)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_14a0f)
	ld [hli], a
	ld a, LOW(Frameset_14a0f)
	ld [hli], a
	ret
; 0x1fbb66

ActionHelp_ShowWarioBeginThrow: ; 1fbb66 (7e:7b66)
	play_sfx SFX_02C

	ld a, BANK(WarioThrowGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1642f)
	ld [hli], a
	ld a, LOW(Frameset_1642f)
	ld [hli], a
	ld a, HIGH(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fbbad

ActionHelp_ShowWarioThrow: ; 1fbbad (7e:7bad)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1641e)
	ld [hli], a
	ld a, LOW(Frameset_1641e)
	ld [hli], a
	ret
; 0x1fbbba

ActionHelp_ShowWarioChargeThrow: ; 1fbbba (7e:7bba)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16435)
	ld [hli], a
	ld a, LOW(Frameset_16435)
	ld [hli], a
	xor a
	ld [wSFXTimer], a
	ret
; 0x1fbbcb

ActionHelp_ShowWarioFullyChargedGrab: ; 1fbbcb (7e:7bcb)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16441)
	ld [hli], a
	ld a, LOW(Frameset_16441)
	ld [hli], a
	ret
; 0x1fbbd8

ActionHelp_ShowWarioFullyChargedThrow: ; 1fbbd8 (7e:7bd8)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_16423)
	ld [hli], a
	ld a, LOW(Frameset_16423)
	ld [hli], a
	ret
; 0x1fbbe5

ActionHelp_ShowWarioAttack: ; 1fbbe5 (7e:7be5)
	ld a, BANK(WarioAttackGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioAttackGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioAttackGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [wSFXTimer], a
	ld [hli], a
	ld [hli], a
	ld a, [wActionHelpPowerUp]
	cp POWER_UP_GARLIC
	jr nc, .has_garlic_power_up
	ld a, HIGH(Frameset_151fd)
	ld [hli], a
	ld a, LOW(Frameset_151fd)
	ld [hli], a
	ld a, HIGH(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret

.has_garlic_power_up
	ld a, HIGH(Frameset_1522d)
	ld [hli], a
	ld a, LOW(Frameset_1522d)
	ld [hli], a
	ld a, HIGH(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_14d1b)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fbc3f

ActionHelp_ShowWarioRoll: ; 1fbc3f (7e:7c3f)
	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_166f7)
	ld [hli], a
	ld a, LOW(Frameset_166f7)
	ld [hli], a
	ret
; 0x1fbc4c

ActionHelp_ShowWarioBump: ; 1fbc4c (7e:7c4c)
	play_sfx SFX_BUMP

	ld a, BANK(WarioAirborneGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_15f7f)
	ld [hli], a
	ld a, LOW(Frameset_15f7f)
	ld [hli], a
	ld a, HIGH(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fbc93

ActionHelp_ShowWarioSlide: ; 1fbc93 (7e:7c93)
	ld a, BANK(WarioSlideGfx)
	ld [wPendingDMASourceBank], a
	ld a, HIGH(WarioSlideGfx)
	ld [wPendingDMASourcePtr + 0], a
	ld a, LOW(WarioSlideGfx)
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

	ld hl, wActionHelpWarioObjFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1671d)
	ld [hli], a
	ld a, LOW(Frameset_1671d)
	ld [hli], a
	ld a, HIGH(OAM_1644a)
	ld [wActionHelpWarioOAMPtr + 0], a
	ld a, LOW(OAM_1644a)
	ld [wActionHelpWarioOAMPtr + 1], a
	ret
; 0x1fbcd2

ActionHelp_ShowParaGoomWalk: ; 1fbcd2 (7e:7cd2)
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
	ld a, HIGH(Frameset_1e6f36)
	ld [hli], a
	ld a, LOW(Frameset_1e6f36)
	ld [hli], a
	ld a, HIGH(OAM_1e6bab)
	ld [hli], a
	ld a, LOW(OAM_1e6bab)
	ld [hli], a
	ld a, BANK(OAM_1e6bab)
	ld [hli], a
	xor a
	ld [hl], a
	ret
; 0x1fbcf2

ActionHelp_ShowParaGoomStun: ; 1fbcf2 (7e:7cf2)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f48)
	ld [hli], a
	ld a, LOW(Frameset_1e6f48)
	ld [hli], a
	ret
; 0x1fbcff

ActionHelp_ShowParaGoomThrown: ; 1fbcff (7e:7cff)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f3f)
	ld [hli], a
	ld a, LOW(Frameset_1e6f3f)
	ld [hli], a
	ret
; 0x1fbd0c

ActionHelp_ShowObj4EnemyVanish: ; 1fbd0c (7e:7d0c)
	ld hl, wMenuObj4FramesetOffset
ActionHelp_ShowEnemyVanish: ; 1fbd0f (7e:7d0f)
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d4a5)
	ld [hli], a
	ld a, LOW(Frameset_d4a5)
	ld [hli], a
	ld a, HIGH(OAM_d20e)
	ld [hli], a
	ld a, LOW(OAM_d20e)
	ld [hli], a
	ld a, BANK(OAM_d20e)
	ld [hl], a

	play_sfx SFX_018
	ret
; 0x1fbd2a

ActionHelp_ShowFutamoguAngry: ; 1fbd2a (7e:7d2a)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f78)
	ld [hli], a
	ld a, LOW(Frameset_1e6f78)
	ld [hli], a
	ret
; 0x1fbd37

ActionHelp_ShowFutamoguHappy: ; 1fbd37 (7e:7d37)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f66)
	ld [hli], a
	ld a, LOW(Frameset_1e6f66)
	ld [hli], a
	ret
; 0x1fbd44

ActionHelp_ShowCountRichtertoffIdle: ; 1fbd44 (7e:7d44)
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
	ret
; 0x1fbd62

ActionHelp_ShowCountRichtertoffStun: ; 1fbd62 (7e:7d62)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f5e)
	ld [hli], a
	ld a, LOW(Frameset_1e6f5e)
	ld [hli], a
	ret
; 0x1fbd6f

ActionHelp_ShowCountRichtertoffThrown: ; 1fbd6f (7e:7d6f)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6f55)
	ld [hli], a
	ld a, LOW(Frameset_1e6f55)
	ld [hli], a
	ret
; 0x1fbd7c

ActionHelp_ShowSingleSolidBlock: ; 1fbd7c (7e:7d7c)
	ld hl, wMenuObj4FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b67)
	ld [hli], a
	ld a, LOW(Frameset_1e6b67)
	ld [hli], a
	ret
; 0x1fbd89

ActionHelp_ShowVerticalBlockPair: ; 1fbd89 (7e:7d89)
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
	ld a, HIGH(Frameset_1e6b93)
	ld [hli], a
	ld a, LOW(Frameset_1e6b93)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hl], a
	ret
; 0x1fbda7

ActionHelp_ShowSlide: ; 1fbda7 (7e:7da7)
	ld hl, wMenuObj4
	ld a, $40
	ld [hli], a
	ld a, $d8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b88)
	ld [hli], a
	ld a, LOW(Frameset_1e6b88)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hl], a
	ret
; 0x1fbdc5

ActionHelp_ShowOverheadPillar: ; 1fbdc5 (7e:7dc5)
	ld hl, wMenuObj6
	ld a, $20
	ld [hli], a
	ld a, $e8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1e6b85)
	ld [hli], a
	ld a, LOW(Frameset_1e6b85)
	ld [hli], a
	ld a, HIGH(OAM_1e697c)
	ld [hli], a
	ld a, LOW(OAM_1e697c)
	ld [hli], a
	ld a, BANK(OAM_1e697c)
	ld [hli], a
	ret
; 0x1fbde3
