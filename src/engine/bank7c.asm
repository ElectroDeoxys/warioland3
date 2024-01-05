_PauseMenuStateTable:
	ld a, [wSubState]
	jumptable

	dw SlowFadeBGToWhite
	dw InitPauseMenu
	dw DarkenBGToPal_Fast
	dw UpdatePauseMenu

	dw SlowFadeBGToWhite
	dw ReturnFromPauseMenu
	dw DarkenBGToPal_Fast
	dw ReturnToPendingLevelState

	dw SlowFadeBGToWhite ; SST_PAUSE_MENU_SAVE
	dw InitSaveScreen
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw SaveLevel
	dw DarkenBGToPal_Fast
	dw HandleSaveCompleteBox
	dw ResetAfterSave

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset

	dw SlowFadeBGToWhite ; SST_PAUSE_18
	dw InitSaveScreenAndBackupVRAM
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw Save
	dw DarkenBGToPal_Fast
	dw HandleSaveCompleteBox
	dw SlowFadeBGToWhite
	dw Func_1f08af

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset

	dw SlowFadeBGToWhite
	dw InitSaveScreenAndBackupVRAM
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw Save
	dw DarkenBGToPal_Fast
	dw HandleSaveCompleteBox
	dw SlowFadeBGToWhite
	dw Func_1f08f4

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset

_ReturnToPauseMenuFromActionHelp::
	call DisableLCD
	ld hl, wState
	ld a, ST_PAUSE_MENU
	ld [hli], a
	ld [hl], SST_PAUSE_INIT_MENU
	jr InitPauseMenu_SkipBackupVRAM

InitPauseMenu:
	call DisableLCD
	call SaveBackupVRAM
	ld a, [wAnimatedTilesFrameDuration]
	ld [wTempAnimatedTilesFrameDuration], a
	ld a, [wAnimatedTilesGfx]
	ld [wTempAnimatedTilesGroup], a
;	fallthrough

InitPauseMenu_SkipBackupVRAM:
	stop_sfx
	play_music MUSIC_PAUSE_MENU
	xor a
	ld [wPauseMenuSelection], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a
	call ClearBGMap0
	call ClearVirtualOAM

	farcall LoadPauseMenuPals
	farcall LoadPauseMenuGfx
	farcall Func_1f403f

	call PrintNumberMusicCoins
	hlbgcoord 14, 15, v0BGMap1
	farcall PrintNumberCoins
	call VBlank_354

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a

	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cb8)
	ld [hli], a
	ld a, LOW(Frameset_1f1cb8)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj2
	call AddPauseMenuSprite

	ld hl, wMenuObj3
	ld a, $8c
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cd4)
	ld [hli], a
	ld a, LOW(Frameset_1f1cd4)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj3
	call AddPauseMenuSprite

	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4
	ld a, $54
	ld [hli], a
	ld a, $38
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4a)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4a)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj4
	call AddPauseMenuSprite

.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5
	ld a, $54
	ld [hli], a
	ld a, $48
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4d)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4d)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj5
	call AddPauseMenuSprite

.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6
	ld a, $54
	ld [hli], a
	ld a, $58
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4a)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4a)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj6
	call AddPauseMenuSprite

.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .collected_treasures
	ld hl, wMenuObj7
	ld a, $54
	ld [hli], a
	ld a, $68
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4d)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4d)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj7
	call AddPauseMenuSprite

.collected_treasures
	ld hl, wMenuObj8
	ld a, $64
	ld [hli], a
	ld a, $38
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit GREY_TREASURE_F, a
	jr z, .no_grey_treasure
	ld a, HIGH(Frameset_1f1cf0)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf0)
	ld [hl], a
	jr .set_grey_treasure_sprite
.no_grey_treasure
	ld a, HIGH(Frameset_1f1ced)
	ld [hli], a
	ld a, LOW(Frameset_1f1ced)
	ld [hl], a
.set_grey_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj8
	call AddPauseMenuSprite

	ld hl, wMenuObj9
	ld a, $64
	ld [hli], a
	ld a, $48
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit RED_TREASURE_F, a
	jr z, .no_red_treasure
	ld a, HIGH(Frameset_1f1cf6)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf6)
	ld [hl], a
	jr .set_red_treasure_sprite
.no_red_treasure
	ld a, HIGH(Frameset_1f1cf3)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf3)
	ld [hl], a
.set_red_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj9
	call AddPauseMenuSprite

	ld hl, wMenuObj10
	ld a, $64
	ld [hli], a
	ld a, $58
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_TREASURE_F, a
	jr z, .no_green_treasure
	ld a, HIGH(Frameset_1f1cf0)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf0)
	ld [hl], a
	jr .set_green_treasure_sprite
.no_green_treasure
	ld a, HIGH(Frameset_1f1ced)
	ld [hli], a
	ld a, LOW(Frameset_1f1ced)
	ld [hl], a
.set_green_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj10
	call AddPauseMenuSprite

	ld hl, wMenuObj11
	ld a, $64
	ld [hli], a
	ld a, $68
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_TREASURE_F, a
	jr z, .no_blue_treasure
	ld a, HIGH(Frameset_1f1cf6)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf6)
	ld [hl], a
	jr .set_blue_treasure_sprite
.no_blue_treasure
	ld a, HIGH(Frameset_1f1cf3)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf3)
	ld [hl], a
.set_blue_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj11
	call AddPauseMenuSprite

	ld a, LCDCF_ON | LCDCF_BG9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret

UpdatePauseMenu:
	call HandlePauseMenuInput
	ld hl, wMenuObj3FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj3
	call AddPauseMenuSprite
	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4
	call AddPauseMenuSprite
.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5
	call AddPauseMenuSprite
.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6
	call AddPauseMenuSprite
.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .asm_1f02e5
	ld hl, wMenuObj7
	call AddPauseMenuSprite

.asm_1f02e5
	ld hl, wMenuObj8
	call AddPauseMenuSprite
	ld hl, wMenuObj8End
	call AddPauseMenuSprite
	ld hl, wMenuObj10
	call AddPauseMenuSprite
	ld hl, wMenuObj11
	call AddPauseMenuSprite
	ld hl, wMenuObj2FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj2
	call AddPauseMenuSprite

	call ClearUnusedVirtualOAM

	ld a, [wPauseMenuSelection]
	bit 7, a
	ret z
	ld a, [wObjAnimWasReset]
	and a
	ret z
	ld a, [wPauseMenuSelection]
	and $0f
	cp $03
	jr z, .ToMap
	cp $01
	jr z, .Save
	cp $02
	jp z, OpenActionHelp

; Return
	ld hl, wSubState
	inc [hl]
	ret

.ToMap
	jp ReturnToMapFromLevel

.Save
	ld a, TRUE
	ld [wResetDisabled], a
	ld a, SST_PAUSE_MENU_SAVE
	ld [wSubState], a
	ret

ReturnFromPauseMenu:
	call DisableLCD
	call ClearVirtualOAM
	call Func_1f0969
	call LoadBackupVRAM

	xor a
	ld [wced6], a
	ld a, [wTempAnimatedTilesFrameDuration]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [wTempAnimatedTilesGroup]
	ld [wAnimatedTilesGfx], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a

	call UpdateLevelMusic
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

InitSaveScreen:
	ld a, TRUE
	ld [wResetDisabled], a
	call DisableLCD
	call ClearVirtualOAM

	farcall LoadSaveScreenPals
	farcall LoadSaveScreenGfx
	farcall PrintNowSavingBox
	call VBlank_1f0c7e

	xor a
	ld [wSCY], a
	ldh [rSCY], a
	ld [wSCX], a
	ldh [rSCX], a
	xor a
	ld [wPalFadeCounter], a
	ld [wcee4], a
	ld [wTimer], a

	ld hl, wce01
	ld a, HIGH(v0BGMap0 + $164)
	ld [hli], a
	ld [hl], LOW(v0BGMap0 + $164)
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

; every 4 frames fill another tile
; in the save screen bar
; when done, advance to next substate
FillSaveScreenBar:
	ld a, [wTimer]
	inc a
	ld [wTimer], a
	cp $04
	ret c
	xor a
	ld [wTimer], a
	ld a, [wcee4]
	inc a
	cp $0a
	jr z, .bar_finished
	or $1 << 7
	ld [wcee4], a
	ld hl, wce01 + 1
	inc [hl]
	ret
.bar_finished
	xor a
	ld [wcee4], a
	ld hl, wSubState
	inc [hl]
	ret

SaveLevel:
	call DisableLCD
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld hl, w3d280 palette 12
	ld de, wcaa1
	ld b, 4 palettes
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	call IncrementSaveCounter

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM0")
	sramswitch
	ld a, $30
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld de, s0a000
	ld a, $57
	ld [de], a
	inc e
	ld a, $41
	ld [de], a
	inc e
	ld a, $52
	ld [de], a
	inc e
	ld a, $33
	ld [de], a
	inc e
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM") + SIZEOF("Level WRAM")
	call CopyHLToDE

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld hl, wObjects
	ld bc, (wNumWarioGoals - wObjects) + 5
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ld a, $31
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateWRAMDataChecksum
	ld a, d
	ld [sChecksum + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [sChecksum + 1], a
	ld [wChecksum + 1], a

	ld a, $32
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7e5 + 0], a
	ld a, e
	ld [s0a7e5 + 1], a

	ld a, $33
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afa5 + 0], a
	ld a, e
	ld [s0afa5 + 1], a

	ld a, $41
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateBackupSRAMChecksum1
	ld a, d
	ld [s0a79d + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [s0a79d + 1], a
	ld [wChecksum + 1], a

	ld a, $42
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7ed + 0], a
	ld a, e
	ld [s0a7ed + 1], a

	ld a, $43
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afad + 0], a
	ld a, e
	ld [s0afad + 1], a

	ld a, $50
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld de, s0a800
	ld a, $57
	ld [de], a
	inc e
	ld a, $41
	ld [de], a
	inc e
	ld a, $52
	ld [de], a
	inc e
	ld a, $33
	ld [de], a
	inc e
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM") + SIZEOF("Level WRAM")
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld hl, wObjects
	ld bc, (wNumWarioGoals - wObjects) + 5
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ld a, $51
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateWRAMDataChecksum
	ld a, d
	ld [s0a797 + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [s0a797 + 1], a
	ld [wChecksum + 1], a
	ld a, $52
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7e7 + 0], a
	ld a, e
	ld [s0a7e7 + 1], a
	ld a, $53
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afa7 + 0], a
	ld a, e
	ld [s0afa7 + 1], a
	ld a, $60
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld de, s0a400
	ld a, $57
	ld [de], a
	inc e
	ld a, $41
	ld [de], a
	inc e
	ld a, $52
	ld [de], a
	inc e
	ld a, $33
	ld [de], a
	inc e
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM") + SIZEOF("Level WRAM")
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld hl, wObjects
	ld bc, (wNumWarioGoals - wObjects) + 5
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ld a, $61
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateWRAMDataChecksum
	ld a, d
	ld [s0a799 + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [s0a799 + 1], a
	ld [wChecksum + 1], a
	ld a, $62
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7e9 + 0], a
	ld a, e
	ld [s0a7e9 + 1], a
	ld a, $63
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afa9 + 0], a
	ld a, e
	ld [s0afa9 + 1], a

	call Func_1f14c6
	ld a, $80
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld de, s0ac00
	ld a, $57
	ld [de], a
	inc e
	ld a, $41
	ld [de], a
	inc e
	ld a, $52
	ld [de], a
	inc e
	ld a, $33
	ld [de], a
	inc e
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM") + SIZEOF("Level WRAM")
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld hl, wObjects
	ld bc, (wNumWarioGoals - wObjects) + 5
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ld a, $81
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateWRAMDataChecksum
	ld a, d
	ld [s0a79b + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [s0a79b + 1], a
	ld [wChecksum + 1], a
	ld a, $82
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7eb + 0], a
	ld a, e
	ld [s0a7eb + 1], a
	ld a, $83
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afab + 0], a
	ld a, e
	ld [s0afab + 1], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld [wResetDisabled], a
	pop af
	sramswitch

	call VBlank_1f0c6c
	farcall LoadSaveScreenPals
	farcall PrintSaveCompleteBox
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	xor a
	ld [wTimer + 0], a
	ld a, 2
	ld [wTimer + 1], a
	ld hl, wSubState
	inc [hl]
	ret

; advances substate if A button is pressed
; or when wTimer has elapsed
HandleSaveCompleteBox:
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .close
	ld hl, wTimer
	dec [hl]
	ret nz
	ld hl, wTimer + 1
	dec [hl]
	ret nz
.close
	xor a
	ld [wTimer + 0], a
	ld [wTimer + 1], a
	ld hl, wSubState
	inc [hl]
	ret

ResetAfterSave:
	jp Init

InitSaveScreenAndBackupVRAM:
	ld a, TRUE
	ld [wResetDisabled], a
	call DisableLCD
	call SaveBackupVRAM
	call ClearBGMap1
	call ClearVirtualOAM

	farcall LoadSaveScreenPals
	farcall LoadSaveScreenGfx
	farcall PrintNowSavingBox
	call VBlank_1f0c7e

	xor a
	ld [wSCY], a
	ldh [rSCY], a
	ld [wSCX], a
	ldh [rSCX], a
	xor a
	ld [wPalFadeCounter], a
	ld [wTimer], a
	ld [wcee4], a

	ld hl, wce01
	ld a, HIGH(v0BGMap0 + $164)
	ld [hli], a
	ld [hl], LOW(v0BGMap0 + $164)
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

Save:
	call DisableLCD
	call IncrementSaveCounter

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM0")
	sramswitch

	ld a, $10
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld de, sCheckVals
	ld a, SAVE_CHECK_VAL_1
	ld [de], a
	inc e
	ld a, SAVE_CHECK_VAL_2
	ld [de], a
	inc e
	ld a, SAVE_CHECK_VAL_3
	ld [de], a
	inc e
	ld a, SAVE_CHECK_VAL_4
	ld [de], a
	inc e

	; de = sGameData
	; save game data
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM")
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	ld a, $11
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	call CalculateGameDataChecksum
	ld a, d
	ld [s0a791 + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [s0a791 + 1], a
	ld [wChecksum + 1], a

	ld a, $12
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0a7e1 + 0], a
	ld a, e
	ld [s0a7e1 + 1], a

	ld a, $13
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0afa1 + 0], a
	ld a, e
	ld [s0afa1 + 1], a

	ld a, $20
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	; de = sBackupGameData
	; save backup game data
	ld de, sBackupCheckVals
	ld a, SAVE_CHECK_VAL_1
	ld [de], a
	inc e
	ld a, SAVE_CHECK_VAL_2
	ld [de], a
	inc e
	ld a, SAVE_CHECK_VAL_3
	ld [de], a
	inc e
	ld a, SAVE_CHECK_VAL_4
	ld [de], a
	inc e

	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM")
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	ld a, $21
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, [wChecksum + 0]
	ld d, a
	ld [s0a793 + 0], a
	ld a, [wChecksum  + 0+ 1]
	ld e, a
	ld [s0a793 + 1], a

	ld a, $22
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0a7e3 + 0], a
	ld a, e
	ld [s0a7e3 + 1], a

	ld a, $23
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0afa3 + 0], a
	ld a, e
	ld [s0afa3 + 1], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	pop af
	sramswitch

	call VBlank_1f0c6c
	farcall LoadSaveScreenPals
	farcall PrintSaveCompleteBox

	xor a
	ld [wTimer + 0], a
	ld a, $02
	ld [wTimer + 1], a
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

Func_1f08af:
	ld a, [wTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .after_epilogue
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .after_epilogue
	cp TRANSITION_GAME_OVER
	jr z, .game_over

	call DisableLCD
	call LoadBackupVRAM
	xor a
	ld [wResetDisabled], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld a, ST_OVERWORLD
	ld [wState], a
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret

.after_epilogue
	xor a
	ld [wResetDisabled], a
	ld hl, wState
	ld [hl], ST_CREDITS
	xor a
	ld [wSubState], a
	ret

.game_over
	xor a
	ld [wResetDisabled], a
	ld hl, wState
	ld [hl], ST_GAME_OVER
	xor a
	ld [wSubState], a
	ret

Func_1f08f4:
	jp Init

LoadFontTiles:
	ld hl, FontGfx
	ld bc, v0Tiles0
	call Decompress
	ret

LoadGBIncompatibleScreenGfx:
	ld hl, GBIncompatibleGfx
	ld bc, v0Tiles0
	call Decompress
	ret

LoadGBIncompatibleScreenMap:
	ld hl, BGMap_1f34d6
	ld bc, v0BGMap0
	call Decompress
	ld a, %11100100
	ldh [rBGP], a
	ret

LoadFontPals:
	ld hl, Pals_1f3610
	call LoadPalsToTempPals1
	ld hl, Pals_1f3610
	call LoadPalsToTempPals2
	ret

LoadLanguageSelectionText:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, LanguageSelection2TextMap
	ld bc, v1BGMap0
	call Decompress

	xor a
	ldh [rVBK], a
	ld hl, LanguageSelection1TextMap
	ld bc, v0BGMap0
	call Decompress
	ret

AddPauseMenuSprite:
	ld a, [hli]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_1f156c
	call TryAddSprite
	ret

PrintNumberMusicCoins:
	ld a, [wNumMusicalCoins]
	add a ; *2
	add $a0
	ldbgcoord 7, 15, v0BGMap1
	inc a
	ldbgcoord 7, 16, v0BGMap1
	ret

Func_1f0969::
	farcall VBlank_b672
	farcall Func_b681
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a
	call DrawWario
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a
	ret

HandlePauseMenuInput:
	ld a, [wPauseMenuSelection]
	bit 7, a
	ret nz
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, .Return

	ld a, [wPauseMenuSelection]
	cp $01
	jr z, .asm_1f09f0
	cp $02
	jr z, .asm_1f0a02
	cp $03
	jr z, .asm_1f0a1d

	ld a, [wJoypadPressed]
	bit D_RIGHT_F, a
	jr nz, .asm_1f09e7
	bit A_BUTTON_F, a
	ret z
	jp .Return
.asm_1f09e7
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_1f0a45
	jr .asm_1f0a2a

.asm_1f09f0
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jp nz, .asm_1f0aa1
	bit D_RIGHT_F, a
	jr nz, .asm_1f0a45
	bit A_BUTTON_F, a
	ret z
	jp .Save

.asm_1f0a02
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .asm_1f0a13
	bit D_RIGHT_F, a
	jr nz, .asm_1f0a7f
	bit A_BUTTON_F, a
	ret z
	jp .ActionHelp
.asm_1f0a13
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jp nz, .asm_1f0aa1
	jr .asm_1f0a2a

.asm_1f0a1d
	ld a, [wJoypadPressed]
	bit D_LEFT_F, a
	jr nz, .asm_1f0a45
	bit A_BUTTON_F, a
	ret z
	jp .ToMap

.asm_1f0a2a
	ld a, $01
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $40
	ld [hli], a
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c9c)
	ld [hli], a
	ld a, LOW(Frameset_1f1c9c)
	ld [hl], a
	jr .play_sfx

.asm_1f0a45
	ld a, $02
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	jr z, .owl_1
	cp TRANSFORMATION_RAIL
	jr z, .rail_1
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	jr z, .vampire_1
	ld bc, Frameset_1f1c50
	jr .asm_1f0a79
.owl_1
	ld bc, Frameset_1f1cf9
	jr .asm_1f0a79
.rail_1
	ld bc, Frameset_1f1d1b
	jr .asm_1f0a79
.vampire_1
	ld bc, Frameset_1f1d41
.asm_1f0a79
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	jr .play_sfx

.asm_1f0a7f
	ld a, $03
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $40
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c74)
	ld [hli], a
	ld a, LOW(Frameset_1f1c74)
	ld [hl], a

.play_sfx
	play_sfx SFX_0E2
	ret

.asm_1f0aa1
	ld a, $00
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cb8)
	ld [hli], a
	ld a, LOW(Frameset_1f1cb8)
	ld [hl], a
	jr .play_sfx

.Return
	ld a, $00
	ld [wPauseMenuSelection], a
	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cbb)
	ld [hli], a
	ld a, LOW(Frameset_1f1cbb)
	ld [hl], a

	ld hl, wPauseMenuSelection
	set 7, [hl]
	play_sfx SFX_0E7
	ret

.Save
	ld hl, wMenuObj2FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c9f)
	ld [hli], a
	ld a, LOW(Frameset_1f1c9f)
	ld [hl], a
	jr .do_selection

.ActionHelp
	ld hl, wMenuObj2FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	jr z, .owl_2
	cp TRANSFORMATION_RAIL
	jr z, .rail_2
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	jr z, .vampire_2
	ld bc, Frameset_1f1c69
	jr .asm_1f0b18
.owl_2
	ld bc, Frameset_1f1d0a
	jr .asm_1f0b18
.rail_2
	ld bc, Frameset_1f1d20
	jr .asm_1f0b18
.vampire_2
	ld bc, Frameset_1f1d4c
.asm_1f0b18
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	jr .do_selection

.ToMap
	ld hl, wMenuObj2FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c77)
	ld [hli], a
	ld a, LOW(Frameset_1f1c77)
	ld [hl], a
	jr .do_selection
.do_selection
	ld hl, wPauseMenuSelection
	set 7, [hl]
	play_sfx SFX_SELECTION
	ret

; increments counter in wSaveCounter
IncrementSaveCounter:
	ld a, [wSaveCounter + 3]
	add 1
	ld [wSaveCounter + 3], a
	ld a, [wSaveCounter + 2]
	adc 0
	ld [wSaveCounter + 2], a
	ld a, [wSaveCounter + 1]
	adc 0
	ld [wSaveCounter + 1], a
	ld a, [wSaveCounter + 0]
	adc 0
	ld [wSaveCounter + 0], a
	ret

Func_1f0b5b:
	ld de, $0
	ld b, $ca
	call CalculateChecksum
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld b, $11
	call CalculateChecksum
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld bc, $14a
	call CalculateChecksumLong
	pop af
	ldh [rSVBK], a
	ret

; sums b bytes starting at hl
; result is added in de
CalculateChecksum:
.start
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec b
	jr nz, .start
	ret

; same as CalculateChecksum but
; does checksum for bc bytes instead
; buggy, doesn't loop properly
CalculateChecksumLong:
.start
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, CalculateChecksum ; should be .start
	ret

CalculateWRAMDataChecksum:
	ld de, 0
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM") + SIZEOF("Level WRAM")
	call CalculateChecksum

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CalculateChecksum
	pop af

	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld hl, wObjects
	ld bc, (wNumWarioGoals - wObjects) + 5
	call CalculateChecksumLong
	pop af
	ldh [rSVBK], a
	ret

; calculates checksum for SRAM1 and first half of SRAM2
; outputs result in de
CalculateBackupSRAMChecksum1:
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld hl, s1a000
	ld de, $0
	ld bc, $2000
.loop_sram_1
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .loop_sram_1
	dec b
	jr nz, .loop_sram_1
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af

	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2a000
	ld bc, $1000
.loop_sram_2
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .loop_sram_2
	dec b
	jr nz, .loop_sram_2
	pop af
	sramswitch
	ret

; calculates checksum for SRAM3 and second half of SRAM2
; outputs result in de
CalculateBackupSRAMChecksum2:
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM3")
	sramswitch
	ld hl, s0a000
	ld de, $0
	ld bc, $2000
.loop_sram_3
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .loop_sram_3
	dec b
	jr nz, .loop_sram_3
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af

	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2b000
	ld bc, $1000
.loop_sram_2
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	dec c
	jr nz, .loop_sram_2
	dec b
	jr nz, .loop_sram_2
	pop af
	sramswitch
	ret

VBlank_1f0c6c:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

VBlank_1f0c7e:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wcee4]
	bit 7, a
	jr z, .transfer
	ld hl, wce01
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld [hl], $05
	xor a
	ldh [rVBK], a
	ld [hl], $02
	ld hl, wcee4
	res 7, [hl]
.transfer
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

Func_1f0cad::
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM0")
	sramswitch

	ld hl, sCheckVals
	call CheckSaveVals
	jr nc, .asm_1f0cec
	ld hl, s0a000
	call Func_1f0d47
	jr nc, .asm_1f0cec
	ld hl, s0a400
	call Func_1f0d47
	jr nc, .asm_1f0cec

	ld hl, sBackupCheckVals
	call CheckSaveVals
	jr nc, .asm_1f0cec
	ld hl, s0a800
	call Func_1f0d47
	jr nc, .asm_1f0cec
	ld hl, s0ac00
	call Func_1f0d47
	jr nc, .asm_1f0cec
	jp .asm_1f0d0f

.asm_1f0cec
	ld a, [s0a790]
	ld b, a
	ld a, [s0a7e0]
	ld c, a
	ld a, [s0afa0]
	ld d, a
	cp b
	jr nz, .asm_1f0d08
	cp c
	jr z, .asm_1f0d03 ; both branches are the same
	ld [wcef1], a
	jr .asm_1f0d20
.asm_1f0d03
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d08
	; s0a790 != s0afa0
	cp c
	jr z, .asm_1f0d16
	ld a, b
	cp c
	jr z, .asm_1f0d1b

.asm_1f0d0f
	ld a, $ff
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d16
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d1b
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d20
	call Func_1f0d60
	call Func_1f1246
	pop af
	sramswitch
	ret

; returns carry if bytes in [hl] is not:
; $77 $61 $72 $33
CheckSaveVals:
	ld a, [hli]
	cp SAVE_CHECK_VAL_1
	jr nz, .set_carry
	ld a, [hli]
	cp SAVE_CHECK_VAL_2
	jr nz, .set_carry
	ld a, [hli]
	cp SAVE_CHECK_VAL_3
	jr nz, .set_carry
	ld a, [hli]
	cp SAVE_CHECK_VAL_4
	jr nz, .set_carry
	scf
	ccf
	ret
.set_carry
	scf
	ret

Func_1f0d47:
	ld a, [hli]
	cp $57
	jr nz, .set_carry
	ld a, [hli]
	cp $41
	jr nz, .set_carry
	ld a, [hli]
	cp $52
	jr nz, .set_carry
	ld a, [hli]
	cp $33
	jr nz, .set_carry
	scf
	ccf
	ret
.set_carry
	scf
	ret

Func_1f0d60:
	xor a
	ld [wceee], a
	ld hl, sCheckVals
	call CheckSaveVals
	jr c, .clear_check_vals

	ld a, [s0a791 + 0]
	ld b, a
	ld a, [s0a791 + 1]
	ld c, a
	ld a, [s0a7e1 + 0]
	ld d, a
	ld a, [s0a7e1 + 1]
	ld e, a
	ld a, [s0afa1 + 0]
	ld h, a
	ld a, [s0afa1 + 1]
	ld l, a
	call Func_1f1153
	ld hl, sGameData
	call Func_1f1210
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0d9b
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0d9b
	jr .asm_1f0dc2

.asm_1f0d9b
	ld a, [wcef0]
	and a
	jr z, .clear_check_vals
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0daf
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0daf
	jr .asm_1f0dc2

.asm_1f0daf
	ld a, [wcef0]
	cp $07
	jr nz, .clear_check_vals
	ld a, [wceeb]
	cp d
	jr nz, .clear_check_vals
	ld a, [wceec]
	cp e
	jr nz, .clear_check_vals

.asm_1f0dc2
	ld hl, sGameData ; useless
	ld hl, wceee
	set 0, [hl]
	jr .check_backup_check_vals

.clear_check_vals
	ld a, $10
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, sCheckVals
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.check_backup_check_vals
	ld hl, sBackupCheckVals
	call CheckSaveVals
	jr c, .clear_backup_check_vals
	ld a, [s0a793 + 0]
	ld b, a
	ld a, [s0a793 + 1]
	ld c, a
	ld a, [s0a7e3 + 0]
	ld d, a
	ld a, [s0a7e3 + 1]
	ld e, a
	ld a, [s0afa3 + 0]
	ld h, a
	ld a, [s0afa3 + 1]
	ld l, a
	call Func_1f1153
	ld hl, sBackupGameData
	call Func_1f1210
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0e20
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0e20
	jr .asm_1f0e47

.asm_1f0e20
	ld a, [wcef0]
	and a
	jr z, .clear_backup_check_vals
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0e34
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0e34
	jr .asm_1f0e47

.asm_1f0e34
	ld a, [wcef0]
	cp $07
	jr nz, .clear_backup_check_vals
	ld a, [wceeb]
	cp d
	jr nz, .clear_backup_check_vals
	ld a, [wceec]
	cp e
	jr nz, .clear_backup_check_vals
.asm_1f0e47
	ld hl, sBackupGameData ; useless
	ld hl, wceee
	set 1, [hl]
	jr .asm_1f0e6e

.clear_backup_check_vals
	ld a, $20
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, sBackupCheckVals
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0e6e
	ld a, [s0a79d + 0]
	ld b, a
	ld a, [s0a79d + 1]
	ld c, a
	ld a, [s0a7ed + 0]
	ld d, a
	ld a, [s0a7ed + 1]
	ld e, a
	ld a, [s0afad + 0]
	ld h, a
	ld a, [s0afad + 1]
	ld l, a
	call Func_1f1153
	call CalculateBackupSRAMChecksum1
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0e9a
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0e9a
	jr .asm_1f0ec1

.asm_1f0e9a
	ld a, [wcef0]
	and a
	jr z, .asm_1f0efd
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0eae
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0eae
	jr .asm_1f0ec1

.asm_1f0eae
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0efd
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0efd
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0efd
.asm_1f0ec1
	ld hl, wceee
	set 6, [hl]
	ld hl, s0a000
	call Func_1f0d47
	jr c, .asm_1f0f2f
	ld a, [sChecksum + 0]
	ld b, a
	ld a, [sChecksum + 1]
	ld c, a
	ld a, [s0a7e5 + 0]
	ld d, a
	ld a, [s0a7e5 + 1]
	ld e, a
	ld a, [s0afa5 + 0]
	ld h, a
	ld a, [s0afa5 + 1]
	ld l, a
	call Func_1f1153
	ld hl, sSaveCounter
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0f00
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0f00
	jr .asm_1f0f27

.asm_1f0efd
	jp .asm_1f0fb2

.asm_1f0f00
	ld a, [wcef0]
	and a
	jr z, .asm_1f0f2f
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0f14
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0f14
	jr .asm_1f0f27
.asm_1f0f14
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0f2f
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0f2f
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0f2f
.asm_1f0f27
	ld hl, wceee
	set 2, [hl]
	jp .asm_1f0fe2
.asm_1f0f2f
	ld a, $30
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld hl, s0a800
	call Func_1f0d47
	jr c, .asm_1f0fb2
	ld a, [s0a797 + 0]
	ld b, a
	ld a, [s0a797 + 1]
	ld c, a
	ld a, [s0a7e7 + 0]
	ld d, a
	ld a, [s0a7e7 + 1]
	ld e, a
	ld a, [s0afa7 + 0]
	ld h, a
	ld a, [s0afa7 + 1]
	ld l, a
	call Func_1f1153
	ld hl, s0a804
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0f83
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0f83
	jr .asm_1f0faa
.asm_1f0f83
	ld a, [wcef0]
	and a
	jr z, .asm_1f0fb2
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f0f97
	ld a, [wceea]
	cp e
	jr nz, .asm_1f0f97
	jr .asm_1f0faa
.asm_1f0f97
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f0fb2
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0fb2
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0fb2
.asm_1f0faa
	ld hl, wceee
	set 3, [hl]
	jp .asm_1f0fe2
.asm_1f0fb2
	ld a, $30
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	ld a, $50
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a800
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0fe2
	ld a, [s0a79f + 0]
	ld b, a
	ld a, [s0a79f + 1]
	ld c, a
	ld a, [s0a7ef + 0]
	ld d, a
	ld a, [s0a7ef + 1]
	ld e, a
	ld a, [s0afaf + 0]
	ld h, a
	ld a, [s0afaf + 1]
	ld l, a
	call Func_1f1153
	call CalculateBackupSRAMChecksum2
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f100e
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f100e
	jr .asm_1f1035
.asm_1f100e
	ld a, [wcef0]
	and a
	jr z, .asm_1f1071
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f1022
	ld a, [wceea]
	cp e
	jr nz, .asm_1f1022
	jr .asm_1f1035
.asm_1f1022
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f1071
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f1071
	ld a, [wceec]
	cp e
	jr nz, .asm_1f1071
.asm_1f1035
	ld hl, wceee
	set 7, [hl]
	ld hl, s0a400
	call Func_1f0d47
	jr c, .asm_1f10a1
	ld a, [s0a799 + 0]
	ld b, a
	ld a, [s0a799 + 1]
	ld c, a
	ld a, [s0a7e9 + 0]
	ld d, a
	ld a, [s0a7e9 + 1]
	ld e, a
	ld a, [s0afa9 + 0]
	ld h, a
	ld a, [s0afa9 + 1]
	ld l, a
	call Func_1f1153
	ld hl, s0a404
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f1074
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f1074
	jr .asm_1f109b
.asm_1f1071
	jp .asm_1f1122
.asm_1f1074
	ld a, [wcef0]
	and a
	jr z, .asm_1f10a1
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f1088
	ld a, [wceea]
	cp e
	jr nz, .asm_1f1088
	jr .asm_1f109b
.asm_1f1088
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f10a1
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f10a1
	ld a, [wceec]
	cp e
	jr nz, .asm_1f10a1
.asm_1f109b
	ld hl, wceee
	set 4, [hl]
	ret

.asm_1f10a1
	ld a, $60
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a400
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld hl, s0ac00
	call Func_1f0d47
	jr c, .asm_1f1122
	ld a, [s0a79b + 0]
	ld b, a
	ld a, [s0a79b + 1]
	ld c, a
	ld a, [s0a7eb + 0]
	ld d, a
	ld a, [s0a7eb + 1]
	ld e, a
	ld a, [s0afab + 0]
	ld h, a
	ld a, [s0afab + 1]
	ld l, a
	call Func_1f1153
	ld hl, s0ac04
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f10f5
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f10f5
	jr .asm_1f111c
.asm_1f10f5
	ld a, [wcef0]
	and a
	jr z, .asm_1f1122
	ld a, [wcee9]
	cp d
	jr nz, .asm_1f1109
	ld a, [wceea]
	cp e
	jr nz, .asm_1f1109
	jr .asm_1f111c
.asm_1f1109
	ld a, [wcef0]
	cp $07
	jr nz, .asm_1f1122
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f1122
	ld a, [wceec]
	cp e
	jr nz, .asm_1f1122
.asm_1f111c
	ld hl, wceee
	set 5, [hl]
	ret

.asm_1f1122
	ld a, $60
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a400
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	ld a, $80
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0ac00
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret

Func_1f1153:
	ld a, h
	cp b
	jr nz, .asm_1f1160
	cp d
	jr z, .asm_1f1175
	ld a, c
	cp l
	jr nz, .asm_1f1185
	jr .asm_1f11bf

.asm_1f1160
	cp d
	jr z, .asm_1f1169
	ld a, b
	cp d
	jr z, .asm_1f116f
	jr .asm_1f1185

.asm_1f1169
	ld a, e
	cp l
	jr nz, .asm_1f1185
	jr .asm_1f11db

.asm_1f116f
	ld a, c
	cp e
	jr nz, .asm_1f1185
	jr .asm_1f11a3

.asm_1f1175
	ld a, l
	cp c
	jr nz, .asm_1f117e
	cp e
	jr z, .asm_1f11f7
	jr .asm_1f11bf

.asm_1f117e
	cp e
	jr z, .asm_1f11db
	ld a, c
	cp e
	jr z, .asm_1f11a3
.asm_1f1185
	ld a, $07
	ld [wcef0], a
	ld a, b
	ld [wChecksum + 0], a
	ld a, d
	ld [wcee9], a
	ld a, h
	ld [wceeb], a
	ld a, c
	ld [wChecksum + 1], a
	ld a, e
	ld [wceea], a
	ld a, l
	ld [wceec], a
	ret

.asm_1f11a3
	ld a, $04
	ld [wcef0], a
	ld a, b
	ld [wChecksum + 0], a
	ld [wceeb], a
	ld a, h
	ld [wcee9], a
	ld a, c
	ld [wChecksum + 1], a
	ld [wceec], a
	ld a, l
	ld [wceea], a
	ret

.asm_1f11bf
	ld a, $02
	ld [wcef0], a
	ld a, b
	ld [wChecksum + 0], a
	ld [wceeb], a
	ld a, d
	ld [wcee9], a
	ld a, c
	ld [wChecksum + 1], a
	ld [wceec], a
	ld a, e
	ld [wceea], a
	ret

.asm_1f11db
	ld a, $01
	ld [wcef0], a
	ld a, d
	ld [wChecksum + 0], a
	ld [wceeb], a
	ld a, b
	ld [wcee9], a
	ld a, e
	ld [wChecksum + 1], a
	ld [wceec], a
	ld a, c
	ld [wceea], a
	ret

.asm_1f11f7
	xor a
	ld [wcef0], a
	ld a, b
	ld [wChecksum + 0], a
	ld [wcee9], a
	ld [wceeb], a
	ld a, c
	ld [wChecksum + 1], a
	ld [wceea], a
	ld [wceec], a
	ret

; calculates checksum of data
; starting at [hl], with length $5b + $11 = $6c
Func_1f1210:
	ld de, 0 ; accumulator
	ld b, SIZEOF("Progress WRAM")
	call CalculateChecksum
	; this changes WRAM bank,
	; but this routine is never called
	; to calculate Checksums of WRAM data
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld b, $11
	call CalculateChecksum
	pop af
	ldh [rSVBK], a
	ret

CalculateGameDataChecksum:
	ld de, 0 ; accumulator
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM")
	call CalculateChecksum
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CalculateChecksum
	pop af
	ldh [rSVBK], a
	ret

Func_1f1246:
	xor a
	ld [wceef], a
	ld a, [wceee]
	and $3f
	jr nz, .asm_1f1266
.asm_1f1251
	ld hl, wLevelTimeAttackScores
	ld b, 2 * NUM_LEVELS
	ld a, (10 << $4) | 10
	call WriteAToHL_BTimes
	ld hl, wGolfBestScores
	ld b, $4
	ld a, (10 << $4) | 10
	call WriteAToHL_BTimes
	ret

.asm_1f1266
	ld b, a
	ld a, $3f
	and b
	ld [wceef], a
	ld bc, $600
.asm_1f1270
	rrca
	jr nc, .asm_1f1274
	inc c
.asm_1f1274
	dec b
	jr nz, .asm_1f1270
	ld a, c
	dec a
	jp z, .asm_1f1389

	ld hl, sGameData
	ld de, s0afe0
	ld b, $4
	call CopyHLToDE

	ld hl, sBackupGameData
	ld de, s0afe4
	ld b, $4
	call CopyHLToDE

	ld hl, sSaveCounter
	ld de, s0afe8
	ld b, $4
	call CopyHLToDE

	ld hl, s0a804
	ld de, s0afec
	ld b, $4
	call CopyHLToDE

	ld hl, s0a404
	ld de, s0aff0
	ld b, $4
	call CopyHLToDE

	ld hl, s0ac04
	ld de, s0aff4
	ld b, $4
	call CopyHLToDE

	ld e, $21
.asm_1f12c0
	dec e
	jp z, .asm_1f1389
	xor a
	ld [s0aff8], a
	ld a, [wceef]
	bit 0, a
	jr z, .asm_1f12e4
	ld hl, s0afe0 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f12e4
	ld hl, s0aff8
	set 0, [hl]
.asm_1f12e4
	ld a, [wceef]
	bit 1, a
	jr z, .asm_1f1300
	ld hl, s0afe4 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1300
	ld hl, s0aff8
	set 1, [hl]
.asm_1f1300
	ld a, [wceef]
	bit 2, a
	jr z, .asm_1f131c
	ld hl, s0afe8 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f131c
	ld hl, s0aff8
	set 2, [hl]
.asm_1f131c
	ld a, [wceef]
	bit 3, a
	jr z, .asm_1f1338
	ld hl, s0afec + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1338
	ld hl, s0aff8
	set 3, [hl]
.asm_1f1338
	ld a, [wceef]
	bit 4, a
	jr z, .asm_1f1354
	ld hl, s0aff0 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1354
	ld hl, s0aff8
	set 4, [hl]
.asm_1f1354
	ld a, [wceef]
	bit 5, a
	jr z, .asm_1f1370
	ld hl, s0aff4 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1370
	ld hl, s0aff8
	set 5, [hl]

.asm_1f1370
	ld a, [s0aff8]
	and a
	jp z, .asm_1f12c0
	ld [wceef], a
	ld bc, $600
.asm_1f137d
	rrca
	jr nc, .asm_1f1381
	inc c
.asm_1f1381
	dec b
	jr nz, .asm_1f137d
	ld a, c
	dec a
	jp nz, .asm_1f12c0
.asm_1f1389
	ld a, [wceef]
	bit 0, a
	jr nz, .asm_1f13a7
	bit 1, a
	jr nz, .asm_1f13ae
	bit 2, a
	jr nz, .asm_1f13b5
	bit 3, a
	jr nz, .asm_1f13bc
	bit 4, a
	jr nz, .asm_1f13c3
	bit 5, a
	jr nz, .asm_1f13cd
	jp .asm_1f1251
.asm_1f13a7
	ld hl, sGameData
	call Func_1f13d7
	ret
.asm_1f13ae
	ld hl, sBackupGameData
	call Func_1f13d7
	ret
.asm_1f13b5
	ld hl, sSaveCounter
	call Func_1f13f2
	ret
.asm_1f13bc
	ld hl, s0a804
	call Func_1f13f2
	ret
.asm_1f13c3
	ld hl, s0a404
	call Func_1f13f2
	call Func_1f1420
	ret
.asm_1f13cd
	ld hl, s0ac04
	call Func_1f13f2
	call Func_1f1420
	ret

Func_1f13d7:
	ld de, STARTOF("Progress WRAM")
	ld b, $5b
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld de, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ret

Func_1f13f2:
	ld de, wSaveCounter
	ld b, $ca
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld de, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld de, $d000
	ld bc, $14a
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ret

Func_1f1420:
	ld a, $40
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2b000
	ld de, s2a000
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	sramswitch

; copy whole SRAM3 to SRAM1
	ld hl, s3a000
	ld bc, $2000
.loop
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM3")
	sramswitch
	ld d, [hl]
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld a, d
	ld [hli], a
	pop af
	sramswitch
	pop af
	sramswitch
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	ld a, $41
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	call CalculateBackupSRAMChecksum1
	ld a, d
	ld [s0a79d + 0], a
	ld a, e
	ld [s0a79d + 1], a

	ld a, $42
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0a7ed + 0], a
	ld a, e
	ld [s0a7ed + 1], a

	ld a, $43
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0afad + 0], a
	ld a, e
	ld [s0afad + 1], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret

Func_1f14c6:
	ld a, $70
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, [wSRAMBank]
	push af
	ld a, $02
	sramswitch
	ld hl, s2a000
	ld de, s2b000
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	sramswitch

	ld hl, s0a000
	ld bc, $2000
.loop
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld d, [hl]
	ld a, [wSRAMBank]
	push af
	ld a, $03
	sramswitch
	ld a, d
	ld [hli], a
	pop af
	sramswitch
	pop af
	sramswitch
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	ld a, $71
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateBackupSRAMChecksum2
	ld a, d
	ld [s0a79f + 0], a
	ld a, e
	ld [s0a79f + 1], a
	ld a, $72
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7ef + 0], a
	ld a, e
	ld [s0a7ef + 1], a
	ld a, $73
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afaf + 0], a
	ld a, e
	ld [s0afaf + 1], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret

OAM_1f156c:
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw EmptyOAMFrame
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52

.frame_0
	frame_oam -16,  -8, $c0, 0
	frame_oam -16,   0, $c2, 0
	db $80

.frame_1
	frame_oam -16,  -8, $c6, 0
	frame_oam -16,   0, $c8, 0
	db $80

.frame_2
	frame_oam -16,  -8, $d6, 0
	frame_oam -16,   0, $d6, 0 | OAMF_XFLIP
	db $80

.frame_3
	frame_oam -16,  -8, $d8, 0
	frame_oam -16,   0, $d8, 0 | OAMF_XFLIP
	db $80

.frame_4
	frame_oam -16,  -8, $da, 0
	frame_oam -16,   0, $da, 0 | OAMF_XFLIP
	db $80

.frame_5
	frame_oam -16,  -8, $dc, 0
	frame_oam -16,   0, $dc, 0 | OAMF_XFLIP
	db $80

.frame_6
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAMF_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16, -12, $00, 5
	frame_oam -16,  -4, $02, 5
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,   4, $00, 5 | OAMF_XFLIP
	db $80

.frame_7
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAMF_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $04, 5
	frame_oam -16,   4, $04, 5 | OAMF_XFLIP
	frame_oam -16,  -4, $06, 5
	db $80

.frame_8
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAMF_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $08, 5
	frame_oam -16,  -4, $0a, 5
	frame_oam -16,   4, $08, 5 | OAMF_XFLIP
	db $80

.frame_9
	frame_oam -27,  -8, $10, 7
	frame_oam -11,  -4, $12, 1
	frame_oam -27,   0, $10, 7 | OAMF_XFLIP
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $0c, 5
	frame_oam -16,  -4, $0e, 5
	frame_oam -16,   4, $0c, 5 | OAMF_XFLIP
	frame_oam -14,  -4, $3c, 5
	db $80

.frame_10
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_11
	frame_oam -18, -16, $6a, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_12
	frame_oam -18, -11, $70, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_13
	frame_oam -18,  -3, $50, 7
	frame_oam -18,   5, $52, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_14
	frame_oam -18,   3, $62, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_15
	frame_oam -18,   8, $72, 7
	frame_oam -16, -16, $28, 1
	frame_oam -16,  -8, $2a, 1
	frame_oam -16,   0, $2c, 1
	frame_oam -16,   8, $2e, 1
	db $80

.frame_17
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_18
	frame_oam -18, -13, $60, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_19
	frame_oam -18,  -7, $62, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_20
	frame_oam -18,  -1, $64, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_21
	frame_oam -18,   5, $66, 7
	frame_oam -16, -16, $48, 1
	frame_oam -16,  -8, $4a, 1
	frame_oam -16,   0, $4c, 1
	frame_oam -16,   8, $4e, 1
	db $80

.frame_22
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_23
	frame_oam -18, -15, $68, 7
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	frame_oam -16, -16, $40, 1
	db $80

.frame_24
	frame_oam -18, -11, $66, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_25
	frame_oam -18,  -6, $6a, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_26
	frame_oam -18,  -1, $6c, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_27
	frame_oam -18,   3, $68, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_28
	frame_oam -18,   7, $6e, 7
	frame_oam -16, -16, $40, 1
	frame_oam -16,  -8, $42, 1
	frame_oam -16,   0, $44, 1
	frame_oam -16,   8, $46, 1
	db $80

.frame_29
	frame_oam -32, -16, $e0, 2
	frame_oam -32,  -8, $e2, 2
	frame_oam -32,   0, $e4, 2
	frame_oam -16,  -8, $e6, 2
	frame_oam -16,   0, $e8, 2
	frame_oam -32,   8, $e0, 2 | OAMF_XFLIP
	frame_oam -16, -16, $e0, 2 | OAMF_YFLIP
	frame_oam -16,   8, $e0, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -48,   8, $c4, 2
	db $80

.frame_30
	frame_oam -32, -12, $ea, 2
	frame_oam -16, -12, $ea, 2 | OAMF_YFLIP
	frame_oam -40,  -4, $ec, 2
	frame_oam -24,  -4, $ee, 2
	frame_oam  -8,  -4, $ec, 2 | OAMF_YFLIP
	frame_oam -32,   4, $ea, 2 | OAMF_XFLIP
	frame_oam -16,   4, $ea, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -48,   8, $cc, 2
	db $80

.frame_31
	frame_oam -32, -12, $f0, 2
	frame_oam -16, -12, $f0, 2 | OAMF_YFLIP
	frame_oam -40,  -4, $f2, 2
	frame_oam  -8,  -4, $f2, 2 | OAMF_YFLIP
	frame_oam -24,  -4, $f4, 2
	frame_oam -32,   4, $f0, 2 | OAMF_XFLIP
	frame_oam -16,   4, $f0, 2 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_32
	frame_oam -32,  -4, $f6, 2
	frame_oam -16,  -4, $f6, 2 | OAMF_YFLIP
	db $80

.frame_33
	frame_oam -32, -12, $f0, 2
	frame_oam -16, -12, $f0, 2 | OAMF_YFLIP
	frame_oam -40,  -4, $f2, 2
	frame_oam  -8,  -4, $f2, 2 | OAMF_YFLIP
	frame_oam -24,  -4, $f4, 2 | OAMF_XFLIP
	frame_oam -32,   4, $f0, 2 | OAMF_XFLIP
	frame_oam -16,   4, $f0, 2 | OAMF_XFLIP | OAMF_YFLIP
	db $80

.frame_34
	frame_oam -32, -12, $ea, 2
	frame_oam -16, -12, $ea, 2 | OAMF_YFLIP
	frame_oam -40,  -4, $ec, 2
	frame_oam -24,  -4, $ee, 2 | OAMF_XFLIP
	frame_oam  -8,  -4, $ec, 2 | OAMF_YFLIP
	frame_oam -32,   4, $ea, 2 | OAMF_XFLIP
	frame_oam -16,   4, $ea, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -48, -16, $cc, 2
	db $80

.frame_35
	frame_oam -32, -16, $e0, 2
	frame_oam -32,   0, $e2, 2 | OAMF_XFLIP
	frame_oam -32,  -8, $e4, 2 | OAMF_XFLIP
	frame_oam -16,   0, $e6, 2 | OAMF_XFLIP
	frame_oam -16,  -8, $e8, 2 | OAMF_XFLIP
	frame_oam -32,   8, $e0, 2 | OAMF_XFLIP
	frame_oam -16, -16, $e0, 2 | OAMF_YFLIP
	frame_oam -16,   8, $e0, 2 | OAMF_XFLIP | OAMF_YFLIP
	frame_oam -48, -16, $c4, 2
	db $80

.frame_36
	frame_oam -16,  -4, $7c, 7
	frame_oam -16, -16, $24, 6
	frame_oam -16,   8, $26, 6
	frame_oam -16,  -8, $58, 5
	frame_oam -16,   0, $58, 5 | OAMF_XFLIP
	db $80

.frame_37
	frame_oam -16,  -4, $7e, 7
	frame_oam -16, -16, $24, 6
	frame_oam -16,   8, $26, 6
	frame_oam -16,  -8, $58, 5
	frame_oam -16,   0, $58, 5 | OAMF_XFLIP
	db $80

.frame_38
	frame_oam -16,  -4, $98, 7
	frame_oam -16, -16, $24, 6
	frame_oam -16,   8, $26, 6
	frame_oam -16,  -8, $58, 5
	frame_oam -16,   0, $58, 5 | OAMF_XFLIP
	db $80

.frame_39
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -5,  -4, $04, 7
	frame_oam -16, -12, $00, 5
	frame_oam -16,  -4, $02, 5
	frame_oam -16,   4, $00, 5 | OAMF_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_40
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -6,  -4, $0a, 7
	frame_oam -16, -12, $06, 5
	frame_oam -16,  -4, $08, 5
	frame_oam -16,   4, $06, 5 | OAMF_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_41
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32, -12, $12, 0
	frame_oam -32,   4, $12, 0 | OAMF_XFLIP
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -7,  -4, $10, 7
	frame_oam -16, -12, $0c, 5
	frame_oam -16,  -4, $0e, 5
	frame_oam -16,   4, $0c, 5 | OAMF_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_42
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32, -12, $12, 0
	frame_oam -32,   4, $12, 0 | OAMF_XFLIP
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -7,  -4, $1a, 7
	frame_oam -16, -12, $14, 5
	frame_oam -16,  -4, $16, 5
	frame_oam -16,   4, $18, 5
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_43
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32, -12, $12, 0
	frame_oam -32,   4, $12, 0 | OAMF_XFLIP
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam  -7,  -4, $1a, 7
	frame_oam -16,   4, $14, 5 | OAMF_XFLIP
	frame_oam -16,  -4, $16, 5 | OAMF_XFLIP
	frame_oam -16, -12, $18, 5 | OAMF_XFLIP
	frame_oam -16, -12, $1c, 6
	frame_oam -16,  -4, $1c, 6
	frame_oam -16,   4, $1c, 6
	db $80

.frame_44
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -8, $0e, 3
	frame_oam -16,   0, $0e, 3 | OAMF_XFLIP
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAMF_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_45
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	frame_oam -16,  -8, $0c, 3
	frame_oam -16,   0, $0c, 3 | OAMF_XFLIP
	frame_oam -16, -12, $08, 5
	frame_oam -16,  -4, $0a, 5
	frame_oam -16,   4, $08, 5 | OAMF_XFLIP
	db $80

.frame_46
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -8, $10, 3
	frame_oam -16,   0, $12, 3
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAMF_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_47
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -8, $14, 3
	frame_oam -16,   0, $14, 3 | OAMF_XFLIP
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAMF_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_48
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,   0, $10, 3 | OAMF_XFLIP
	frame_oam -16,  -8, $12, 3 | OAMF_XFLIP
	frame_oam -16, -12, $02, 5
	frame_oam -16,  -4, $04, 5
	frame_oam -16,   4, $02, 5 | OAMF_XFLIP
	frame_oam -32,  -4, $00, 5
	frame_oam   0,  -4, $06, 5
	db $80

.frame_49
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $00, 6
	frame_oam -16,  -4, $02, 6
	frame_oam -16,   4, $04, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	db $80

.frame_50
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16, -12, $00, 6
	frame_oam -16,   4, $04, 6
	frame_oam -16,  -4, $08, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	db $80

.frame_51
	frame_oam -16, -20, $0a, 6
	frame_oam -16,  12, $10, 6
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -4, $02, 6
	frame_oam -16, -12, $0c, 6
	frame_oam -16,   4, $0e, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	db $80

.frame_52
	frame_oam  -7, -20, $16, 6
	frame_oam  -8,  12, $1c, 6
	frame_oam -16, -20, $20, 6
	frame_oam -16,  12, $22, 6
	frame_oam -32,   3, $38, 5
	frame_oam -32,  11, $3a, 5
	frame_oam -32,  19, $3c, 5
	frame_oam -32,  27, $3e, 5
	frame_oam -16,  -4, $02, 6
	frame_oam -16, -12, $12, 6
	frame_oam -16,   4, $14, 6
	frame_oam -16,  -8, $06, 7
	frame_oam -16,   0, $06, 7
	frame_oam   0, -12, $18, 6
	frame_oam   0,   4, $1a, 6
	db $80

Frameset_1f1c4a:
	db $00,  1
	db $ff

Frameset_1f1c4d:
	db $01,  1
	db $ff

Frameset_1f1c50:
	db $06, 100
	db $07,  3
	db $08,  3
	db $07,  3
	db $06,  3
	db $07,  3
	db $08,  3
	db $07,  3
	db $06, 50
	db $07,  4
	db $08,  4
	db $07,  4
	db $ff

Frameset_1f1c69:
	db $06,  8
	db $09,  8
	db $06,  8
	db $09,  8
	db $06, 50
	db $ff

Frameset_1f1c74:
	db $0a, 50
	db $ff

Frameset_1f1c77:
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $0b,  4
	db $0c,  4
	db $0a,  4
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $ff

Frameset_1f1c9c:
	db $11, 50
	db $ff

Frameset_1f1c9f:
	db $12,  4
	db $13,  4
	db $14,  4
	db $15,  4
	db $12,  4
	db $13,  4
	db $14,  4
	db $15,  4
	db $12,  4
	db $13,  4
	db $14,  4
	db $15,  4
	db $ff

Frameset_1f1cb8:
	db $16, 50
	db $ff

Frameset_1f1cbb:
	db $17,  4
	db $18,  4
	db $19,  4
	db $1a,  4
	db $1b,  4
	db $1c,  4
	db $17,  4
	db $18,  4
	db $19,  4
	db $1a,  4
	db $1b,  4
	db $1c,  4
	db $ff

Frameset_1f1cd4:
	db $1d, 10
	db $1e,  9
	db $1f,  8
	db $20,  7
	db $21,  8
	db $22,  9
	db $23, 10
	db $22,  9
	db $21,  8
	db $20,  7
	db $1f,  8
	db $1e,  9
	db $ff

Frameset_1f1ced:
	db $02,  4
	db $ff

Frameset_1f1cf0:
	db $03,  4
	db $ff

Frameset_1f1cf3:
	db $04,  4
	db $ff

Frameset_1f1cf6:
	db $05,  4
	db $ff

Frameset_1f1cf9:
	db $27, 17
	db $28, 20
	db $29, 20
	db $28, 16
	db $27, 15
	db $28, 18
	db $29, 18
	db $28, 14
	db $ff

Frameset_1f1d0a:
	db $2a,  4
	db $2b,  4
	db $2a,  4
	db $2b,  4
	db $2a,  4
	db $2b,  4
	db $2a,  4
	db $2b,  4
	db $ff

Frameset_1f1d1b:
	db $2c, 18
	db $2d, 18
	db $ff

Frameset_1f1d20:
	db $2c,  3
	db $2e,  3
	db $2f,  3
	db $30,  3
	db $2c,  3
	db $2e,  3
	db $2f,  3
	db $30,  3
	db $2c,  3
	db $2e,  3
	db $2f,  3
	db $30,  3
	db $2c,  3
	db $2e,  3
	db $2f,  3
	db $30,  3
	db $ff

Frameset_1f1d41:
	db $31, 30
	db $32,  4
	db $31,  4
	db $32,  4
	db $31,  4
	db $ff

Frameset_1f1d4c:
	db $33,  4
	db $34,  4
	db $33,  4
	db $34,  4
	db $33,  4
	db $34,  4
	db $33,  4
	db $34,  4
	db $ff

FontGfx: INCBIN "gfx/font.2bpp.rle"

GBIncompatibleGfx: INCBIN "gfx/gb_incompatible.2bpp.rle"
BGMap_1f34d6: INCBIN "gfx/bgmaps/map_1f34d6.bin"
BGMap_1f35e0: INCBIN "gfx/bgmaps/map_1f35e0.bin" ; unreferenced

Pals_1f3610:
	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 31, 31, 31
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 26, 15
	rgb 31,  0, 11
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30, 28,  0
	rgb 30, 15,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31,  0
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 10, 10, 10
	rgb  0,  0,  0

LanguageSelection1TextMap:
INCBIN "gfx/bgmaps/text/language_selection1.bin"

LanguageSelection2TextMap:
INCBIN "gfx/bgmaps/text/language_selection2.bin"
