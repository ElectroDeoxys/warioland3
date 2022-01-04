_PauseMenuStateTable: ; 1f0000 (7c:4000)
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
	dw Func_1f03fa
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
	dw Func_1f0701
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw Func_1f0768
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
	dw Func_1f0701
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw Func_1f0768
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
; 0x1f007a

	INCROM $1f007a, $1f0087

InitPauseMenu: ; 1f0087 (7c:4087)
	call DisableLCD
	call SaveBackupVRAM
	ld a, [wAnimatedTilesFrameDuration]
	ld [wTempAnimatedTilesFrameDuration], a
	ld a, [wAnimatedTilesGroup]
	ld [wTempAnimatedTilesGroup], a
	stop_sfx
	play_music MUSIC_PAUSE_MENU
	xor a
	ld [wPauseMenuSelection], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a
	call ClearBGMap0
	call ClearWholeVirtualOAM

	farcall LoadPauseMenuPals
	farcall LoadPauseMenuGfx
	farcall Func_1f403f

	call PrintNumberMusicCoins
	ld hl, v0BGMap1 + $1ee
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
	ld a, $5c
	ld [hli], a
	ld a, $b8
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
	ld a, $5c
	ld [hli], a
	ld a, $d4
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
	ld a, $5c
	ld [hli], a
	ld a, $4a
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
	ld a, $5c
	ld [hli], a
	ld a, $4d
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
	ld a, $5c
	ld [hli], a
	ld a, $4a
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
	ld a, $5c
	ld [hli], a
	ld a, $4d
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
	ld a, $5c
	ld [hli], a
	ld a, $f0
	ld [hl], a
	jr .set_grey_treasure_sprite
.no_grey_treasure
	ld a, $5c
	ld [hli], a
	ld a, $ed
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
	ld a, $5c
	ld [hli], a
	ld a, $f6
	ld [hl], a
	jr .set_red_treasure_sprite
.no_red_treasure
	ld a, $5c
	ld [hli], a
	ld a, $f3
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
	ld a, $5c
	ld [hli], a
	ld a, $f0
	ld [hl], a
	jr .set_green_treasure_sprite
.no_green_treasure
	ld a, $5c
	ld [hli], a
	ld a, $ed
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
	ld a, $5c
	ld [hli], a
	ld a, $f6
	ld [hl], a
	jr .set_blue_treasure_sprite
.no_blue_treasure
	ld a, $5c
	ld [hli], a
	ld a, $f3
	ld [hl], a
.set_blue_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj11
	call AddPauseMenuSprite

	ld a, LCDC_ON | LCDC_BG9C00 | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret
; 0x1f02a2

UpdatePauseMenu: ; 1f02a2 (7c:42a2)
	call HandlePauseMenuInput
	ld hl, $d53a
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
	ld hl, $d532
	call UpdateObjAnim
	ld hl, wMenuObj2
	call AddPauseMenuSprite

	call ClearVirtualOAM

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
	jp ReturnToMap

.Save
	ld a, TRUE
	ld [wResetDisabled], a
	ld a, SST_PAUSE_MENU_SAVE
	ld [wSubState], a
	ret
; 0x1f033c

ReturnFromPauseMenu: ; 1f033c (7c:433c)
	call DisableLCD
	call ClearWholeVirtualOAM
	call Func_1f0969
	call LoadBackupVRAM

	xor a
	ld [wced6], a
	ld a, [wTempAnimatedTilesFrameDuration]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [wTempAnimatedTilesGroup]
	ld [wAnimatedTilesGroup], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a

	call UpdateLevelMusic
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1f0370

InitSaveScreen: ; 1f0370 (7c:4370)
	ld a, TRUE
	ld [wResetDisabled], a
	call DisableLCD
	call ClearWholeVirtualOAM

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
	ld [wIntroSeqTimer], a

	ld hl, wce01
	ld a, HIGH(v0BGMap0 + $164)
	ld [hli], a
	ld [hl], LOW(v0BGMap0 + $164)
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1f03d1

; every 4 frames fill another tile
; in the save screen bar
; when done, advance to next substate
FillSaveScreenBar: ; 1f03d1 (7c:43d1)
	ld a, [wIntroSeqTimer]
	inc a
	ld [wIntroSeqTimer], a
	cp $04
	ret c
	xor a
	ld [wIntroSeqTimer], a
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
; 0x1f03fa

Func_1f03fa: ; 1f03fa (7c:43fa)
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

	call Func_1f0b3a

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
	ld hl, wca00
	ld b, $ca
	call CopyHLToDE

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld hl, $d000
	ld bc, $14a
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ld a, $31
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call Func_1f0b9b
	ld a, d
	ld [s0a795 + 0], a
	ld [wcee7], a
	ld a, e
	ld [s0a795 + 1], a
	ld [wcee8], a
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
	ld [wcee7], a
	ld a, e
	ld [s0a79d + 1], a
	ld [wcee8], a
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
	ld hl, wca00
	ld b, $ca
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld hl, $d000
	ld bc, $14a
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ld a, $51
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call Func_1f0b9b
	ld a, d
	ld [s0a797 + 0], a
	ld [wcee7], a
	ld a, e
	ld [s0a797 + 1], a
	ld [wcee8], a
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
	ld hl, wca00
	ld b, $ca
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld hl, $d000
	ld bc, $14a
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ld a, $61
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call Func_1f0b9b
	ld a, d
	ld [s0a799 + 0], a
	ld [wcee7], a
	ld a, e
	ld [s0a799 + 1], a
	ld [wcee8], a
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
	ld hl, wca00
	ld b, $ca
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld hl, $d000
	ld bc, $14a
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	ld a, $81
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call Func_1f0b9b
	ld a, d
	ld [s0a79b + 0], a
	ld [wcee7], a
	ld a, e
	ld [s0a79b + 1], a
	ld [wcee8], a
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
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	xor a
	ld [wIntroSeqTimer + 0], a
	ld a, $02
	ld [wIntroSeqTimer + 1], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1f06e1

; advances substate if A button is pressed
; or when wIntroSeqTimer has elapsed
HandleSaveCompleteBox: ; 1f06e1 (7c:46e1)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .close
	ld hl, wIntroSeqTimer
	dec [hl]
	ret nz
	ld hl, wIntroSeqTimer + 1
	dec [hl]
	ret nz
.close
	xor a
	ld [wIntroSeqTimer + 0], a
	ld [wIntroSeqTimer + 1], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1f06fe

ResetAfterSave: ; 1f06fe (7c:46fe)
	jp Init
; 0x1f0701

Func_1f0701: ; 1f0701 (7c:4701)
	ld a, TRUE
	ld [wResetDisabled], a
	call DisableLCD
	call SaveBackupVRAM
	call ClearBGMap1
	call ClearWholeVirtualOAM

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
	ld [wIntroSeqTimer], a
	ld [wcee4], a

	ld hl, wce01
	ld a, HIGH(v0BGMap0 + $164)
	ld [hli], a
	ld [hl], LOW(v0BGMap0 + $164)
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1f0768

Func_1f0768: ; 1f0768 (7c:4768)
	call DisableLCD
	call Func_1f0b3a
	ld a, [wSRAMBank]
	push af
	ld a, $00
	sramswitch
	ld a, $10
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld de, s0a380
	ld a, $77
	ld [de], a
	inc e
	ld a, $61
	ld [de], a
	inc e
	ld a, $72
	ld [de], a
	inc e
	ld a, $33
	ld [de], a
	inc e
	ld hl, wca00
	ld b, $5b
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ld a, $11
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call Func_1f1228
	ld a, d
	ld [s0a791], a
	ld [wcee7], a
	ld a, e
	ld [$a792], a
	ld [wcee8], a
	ld a, $12
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7e1], a
	ld a, e
	ld [$a7e2], a
	ld a, $13
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afa1], a
	ld a, e
	ld [$afa2], a
	ld a, $20
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld de, s0ab80
	ld a, $77
	ld [de], a
	inc e
	ld a, $61
	ld [de], a
	inc e
	ld a, $72
	ld [de], a
	inc e
	ld a, $33
	ld [de], a
	inc e
	ld hl, wca00
	ld b, $5b
	call CopyHLToDE
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	ld a, $21
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, [wcee7]
	ld d, a
	ld [s0a793], a
	ld a, [wcee8]
	ld e, a
	ld [$a794], a
	ld a, $22
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7e3], a
	ld a, e
	ld [$a7e4], a
	ld a, $23
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afa3], a
	ld a, e
	ld [$afa4], a
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
	ld [wIntroSeqTimer + 0], a
	ld a, $02
	ld [wIntroSeqTimer + 1], a
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1f08af

Func_1f08af: ; 1f08af (7c:48af)
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
	ld a, LCDC_ON | LCDC_WIN9C00 | LCDC_WINON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
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
	ld [hl], ST_09
	xor a
	ld [wSubState], a
	ret

.game_over
	xor a
	ld [wResetDisabled], a
	ld hl, wState
	ld [hl], ST_0c
	xor a
	ld [wSubState], a
	ret
; 0x1f08f4

Func_1f08f4: ; 1f08f4 (7c:48f4)
	jp Init
; 0x1f08f7

LoadFontTiles: ; 1f08f7 (7c:48f7)
	ld hl, FontGFX
	ld bc, v0Tiles0
	call Decompress
	ret
; 0x1f0901

LoadGBIncompatibleScreenGfx: ; 1f0901 (7c:4901)
	ld hl, $6bc2
	ld bc, v0Tiles0
	call Decompress
	ret
; 0x1f090b

LoadGBIncompatibleScreenMap: ; 1f090b (7c:490b)
	ld hl, $74d6
	ld bc, v0BGMap0
	call Decompress
	ld a, %11100100
	ldh [rBGP], a
	ret
; 0x1f0919

LoadFontPals: ; 1f0919 (7c:4919)
	ld hl, Pals_1f3610
	call LoadPalsToTempPals1
	ld hl, Pals_1f3610
	call LoadPalsToTempPals2
	ret
; 0x1f0926

LoadLanguageSelectionText: ; 1f0926 (7c:4926)
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
; 0x1f0940

AddPauseMenuSprite: ; 1f0940 (7c:4940)
	ld a, [hli]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteTileID], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, $556c
	call TryAddSprite
	ret
; 0x1f095b

PrintNumberMusicCoins: ; 1f095b (7c:495b)
	ld a, [wNumMusicalCoins]
	add a ; *2
	add $a0
	ld [v0BGMap1 + $1e7], a
	inc a
	ld [v0BGMap1 + $207], a
	ret
; 0x1f0969

Func_1f0969: ; 1f0969 (7c:4969)
	farcall VBlank_b672
	farcall Func_b681
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall Func_6164e
	pop af
	ldh [rSVBK], a
	call DrawWario
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall Func_616d7
	pop af
	ldh [rSVBK], a
	ret
; 0x1f09bd

HandlePauseMenuInput: ; 1f09bd (7c:49bd)
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
	ld a, $5c
	ld [hli], a
	ld a, $9c
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
	ld bc, $5c50
	jr .asm_1f0a79
.owl_1
	ld bc, $5cf9
	jr .asm_1f0a79
.rail_1
	ld bc, $5d1b
	jr .asm_1f0a79
.vampire_1
	ld bc, $5d41
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
	ld a, $5c
	ld [hli], a
	ld a, $74
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
	ld a, $5c
	ld [hli], a
	ld a, $b8
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
	ld a, $5c
	ld [hli], a
	ld a, $bb
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
	ld a, $5c
	ld [hli], a
	ld a, $9f
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
	ld bc, $5c69
	jr .asm_1f0b18
.owl_2
	ld bc, $5d0a
	jr .asm_1f0b18
.rail_2
	ld bc, $5d20
	jr .asm_1f0b18
.vampire_2
	ld bc, $5d4c
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
	ld a, $5c
	ld [hli], a
	ld a, $77
	ld [hl], a
	jr .do_selection
.do_selection
	ld hl, wPauseMenuSelection
	set 7, [hl]
	play_sfx SFX_0E3
	ret
; 0x1f0b3a

; increments counter in wca00
Func_1f0b3a: ; 1f0b3a (7c:4b3a)
	ld a, [wca00 + 3]
	add 1
	ld [wca00 + 3], a
	ld a, [wca00 + 2]
	adc $00
	ld [wca00 + 2], a
	ld a, [wca00 + 1]
	adc $00
	ld [wca00 + 1], a
	ld a, [wca00 + 0]
	adc $00
	ld [wca00 + 0], a
	ret
; 0x1f0b5b

Func_1f0b5b: ; 1f0b5b (7c:4b5b)
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
; 0x1f0b83

; sums b bytes starting at hl
; result is added in de
CalculateChecksum: ; 1f0b83 (7c:4b83)
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
; 0x1f0b8e

; same as CalculateChecksum but
; does checksum for bc bytes instead
; buggy, doesn't loop properly
CalculateChecksumLong: ; 1f0b8e (7c:4b8e)
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
; 0x1f0b9b

Func_1f0b9b: ; 1f0b9b (7c:4b9b)
	ld de, $0
	ld hl, wca00
	ld b, $ca
	call CalculateChecksum
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CalculateChecksum
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld hl, $d000
	ld bc, $14a
	call CalculateChecksumLong
	pop af
	ldh [rSVBK], a
	ret
; 0x1f0bcc

; calculates checksum for SRAM1 and first half of SRAM2
; outputs result in de
CalculateBackupSRAMChecksum1: ; 1f0bcc (7c:4bcc)
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
; 0x1f0c1c

; calculates checksum for SRAM3 and second half of SRAM2
; outputs result in de
CalculateBackupSRAMChecksum2: ; 1f0c1c (7c:4c1c)
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
; 0x1f0c6c

VBlank_1f0c6c: ; 1f0c6c (7c:4c6c)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x1f0c7e

VBlank_1f0c7e: ; 1f0c7e (7c:4c7e)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
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
.func_end
; 0x1f0cad

Func_1f0cad:: ; 1f0cad (7c:4cad)
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM0")
	sramswitch

	ld hl, s0a380
	call Func_1f0d2e
	jr nc, .asm_1f0cec
	ld hl, s0a000
	call Func_1f0d47
	jr nc, .asm_1f0cec
	ld hl, s0a400
	call Func_1f0d47
	jr nc, .asm_1f0cec
	ld hl, s0ab80
	call Func_1f0d2e
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

Func_1f0d2e: ; 1f0d2e (7c:4d2e)
	ld a, [hli]
	cp $77
	jr nz, .set_carry
	ld a, [hli]
	cp $61
	jr nz, .set_carry
	ld a, [hli]
	cp $72
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

Func_1f0d47: ; 1f0d47 (7c:4d47)
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
; 0x1f0d60

Func_1f0d60: ; 1f0d60 (7c:4d60)
	xor a
	ld [wceee], a
	ld hl, s0a380
	call Func_1f0d2e
	jr c, .asm_1f0dcc

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
	ld hl, s0a384
	call Func_1f1210
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0d9b
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f0d9b
	jr .asm_1f0dc2

.asm_1f0d9b
	ld a, [wcef0]
	and a
	jr z, .asm_1f0dcc
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
	jr nz, .asm_1f0dcc
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0dcc
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0dcc

.asm_1f0dc2
	ld hl, s0a384
	ld hl, wceee
	set 0, [hl]
	jr .asm_1f0de9

.asm_1f0dcc
	ld a, $10
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a380
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0de9
	ld hl, s0ab80
	call Func_1f0d2e
	jr c, .asm_1f0e51
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
	ld hl, s0ab84
	call Func_1f1210
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0e20
	ld a, [wcee8]
	cp e
	jr nz, .asm_1f0e20
	jr .asm_1f0e47

.asm_1f0e20
	ld a, [wcef0]
	and a
	jr z, .asm_1f0e51
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
	jr nz, .asm_1f0e51
	ld a, [wceeb]
	cp d
	jr nz, .asm_1f0e51
	ld a, [wceec]
	cp e
	jr nz, .asm_1f0e51
.asm_1f0e47
	ld hl, s0ab84
	ld hl, wceee
	set 1, [hl]
	jr .asm_1f0e6e

.asm_1f0e51
	ld a, $20
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0ab80
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
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0e9a
	ld a, [wcee8]
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
	ld a, [s0a795 + 0]
	ld b, a
	ld a, [s0a795 + 1]
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
	ld hl, s0a004
	call Func_1f0b5b
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0f00
	ld a, [wcee8]
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
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f0f83
	ld a, [wcee8]
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
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f100e
	ld a, [wcee8]
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
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f1074
	ld a, [wcee8]
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
	ld a, [wcee7]
	cp d
	jr nz, .asm_1f10f5
	ld a, [wcee8]
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
; 0x1f1153

Func_1f1153: ; 1f1153 (7c:5153)
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
	ld [wcee7], a
	ld a, d
	ld [wcee9], a
	ld a, h
	ld [wceeb], a
	ld a, c
	ld [wcee8], a
	ld a, e
	ld [wceea], a
	ld a, l
	ld [wceec], a
	ret

.asm_1f11a3
	ld a, $04
	ld [wcef0], a
	ld a, b
	ld [wcee7], a
	ld [wceeb], a
	ld a, h
	ld [wcee9], a
	ld a, c
	ld [wcee8], a
	ld [wceec], a
	ld a, l
	ld [wceea], a
	ret

.asm_1f11bf
	ld a, $02
	ld [wcef0], a
	ld a, b
	ld [wcee7], a
	ld [wceeb], a
	ld a, d
	ld [wcee9], a
	ld a, c
	ld [wcee8], a
	ld [wceec], a
	ld a, e
	ld [wceea], a
	ret

.asm_1f11db
	ld a, $01
	ld [wcef0], a
	ld a, d
	ld [wcee7], a
	ld [wceeb], a
	ld a, b
	ld [wcee9], a
	ld a, e
	ld [wcee8], a
	ld [wceec], a
	ld a, c
	ld [wceea], a
	ret

.asm_1f11f7
	xor a
	ld [wcef0], a
	ld a, b
	ld [wcee7], a
	ld [wcee9], a
	ld [wceeb], a
	ld a, c
	ld [wcee8], a
	ld [wceea], a
	ld [wceec], a
	ret
; 0x1f1210

Func_1f1210: ; 1f1210 (7c:5210)
	ld de, $0
	ld b, $5b
	call CalculateChecksum
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld b, $11
	call CalculateChecksum
	pop af
	ldh [rSVBK], a
	ret
; 0x1f1228

Func_1f1228: ; 1f1228 (7c:5228)
	ld de, $0
	ld hl, wca00
	ld b, $5b
	call CalculateChecksum
	ldh a, [rSVBK]
	push af
	ld a, $02
	ldh [rSVBK], a
	ld hl, $d000
	ld b, $11
	call CalculateChecksum
	pop af
	ldh [rSVBK], a
	ret
; 0x1f1246

Func_1f1246: ; 1f1246 (7c:5246)
	xor a
	ld [wceef], a
	ld a, [wceee]
	and $3f
	jr nz, .asm_1f1266
.asm_1f1251
	ld hl, wLevelTimeAttackScores
	ld b, 2 * NUM_LEVELS
	ld a, $aa
	call WriteAToHL_BTimes
	ld hl, wca42
	ld b, $4
	ld a, $aa
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

	ld hl, s0a384
	ld de, s0afe0
	ld b, $4
	call CopyHLToDE

	ld hl, s0ab84
	ld de, s0afe4
	ld b, $4
	call CopyHLToDE

	ld hl, s0a004
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
	ld hl, s0a384
	call Func_1f13d7
	ret
.asm_1f13ae
	ld hl, s0ab84
	call Func_1f13d7
	ret
.asm_1f13b5
	ld hl, s0a004
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
; 0x1f13d7

Func_1f13d7: ; 1f13d7 (7c:53d7)
	ld de, wca00
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
; 0x1f13f2

Func_1f13f2: ; 1f13f2 (7c:53f2)
	ld de, wca00
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
; 0x1f1420

Func_1f1420: ; 1f1420 (7c:5420)
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
; 0x1f14c6

Func_1f14c6: ; 1f14c6 (7c:54c6)
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
.asm_1f14f6
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
	jr nz, .asm_1f14f6
	dec b
	jr nz, .asm_1f14f6

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
; 0x1f156c

	INCROM $1f156c, $1f1d5d

FontGFX: ; 1f1d5d (2c:5d5d)
INCBIN "gfx/font.2bpp.lz"
; 0x1f2bc2

	INCROM $1f2bc2, $1f3610

Pals_1f3610: ; 1f3610 (2c:7610)
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
; 0x1f3650

LanguageSelection1TextMap: ; 1f3650 (2c:7650)
INCBIN "gfx/bgmaps/text/language_selection1.bin"

LanguageSelection2TextMap: ; 1f367f (2c:767f)
INCBIN "gfx/bgmaps/text/language_selection2.bin"
