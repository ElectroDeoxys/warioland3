InitSaveScreen:
	ld a, TRUE
	ld [wResetDisabled], a
	call DisableLCD
	call ClearVirtualOAM

	farcall LoadSaveScreenPals
	farcall LoadSaveScreenGfx
	farcall PrintNowSavingBox
	call VBlank_SaveScreen

	xor a
	ld [wSCY], a
	ldh [rSCY], a
	ld [wSCX], a
	ldh [rSCX], a
	xor a
	ld [wPalFadeCounter], a
	ld [wcee4], a
	ld [wTimer], a

	ld hl, wBGMapTileVRAM0Queue
	ld a, HIGH(v0BGMap0 + $164)
	ld [hli], a
	ld [hl], LOW(v0BGMap0 + $164)
	ld a, LCDC_DEFAULT
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
	ld hl, wBGMapTileVRAM0Queue + 1
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
	push_wram BANK(w3d280)
	ld hl, w3d280 palette 12
	ld de, wcaa1
	ld b, 4 palettes
	call CopyHLToDE
	pop_wram

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

	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop_wram

	push_wram BANK("Level Objects WRAM")
	ld hl, STARTOF("Level Objects WRAM")
	ld bc, SIZEOF("Level Objects WRAM")
	call CopyHLToDE_BC
	pop_wram

	ld a, $31
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	call CalculateWRAMDataChecksum
	ld a, d
	ld [sWRAMChecksum + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [sWRAMChecksum + 1], a
	ld [wChecksum + 1], a

	ld a, $32
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [sWRAMChecksumEcho1 + 0], a
	ld a, e
	ld [sWRAMChecksumEcho1 + 1], a

	ld a, $33
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [sWRAMChecksumEcho2 + 0], a
	ld a, e
	ld [sWRAMChecksumEcho2 + 1], a

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
	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop_wram
	push_wram BANK("Level Objects WRAM")
	ld hl, STARTOF("Level Objects WRAM")
	ld bc, SIZEOF("Level Objects WRAM")
	call CopyHLToDE_BC
	pop_wram
	ld a, $51
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateWRAMDataChecksum
	ld a, d
	ld [sBackup1WRAMChecksum + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [sBackup1WRAMChecksum + 1], a
	ld [wChecksum + 1], a
	ld a, $52
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [sBackup1WRAMChecksumEcho1 + 0], a
	ld a, e
	ld [sBackup1WRAMChecksumEcho1 + 1], a
	ld a, $53
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [sBackup1WRAMChecksumEcho2 + 0], a
	ld a, e
	ld [sBackup1WRAMChecksumEcho2 + 1], a
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
	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop_wram
	push_wram BANK("Level Objects WRAM")
	ld hl, STARTOF("Level Objects WRAM")
	ld bc, SIZEOF("Level Objects WRAM")
	call CopyHLToDE_BC
	pop_wram
	ld a, $61
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateWRAMDataChecksum
	ld a, d
	ld [sBackup2WRAMChecksum + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [sBackup2WRAMChecksum + 1], a
	ld [wChecksum + 1], a
	ld a, $62
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [sBackup2WRAMChecksumEcho1 + 0], a
	ld a, e
	ld [sBackup2WRAMChecksumEcho1 + 1], a
	ld a, $63
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [sBackup2WRAMChecksumEcho2 + 0], a
	ld a, e
	ld [sBackup2WRAMChecksumEcho2 + 1], a

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
	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop_wram
	push_wram BANK("Level Objects WRAM")
	ld hl, STARTOF("Level Objects WRAM")
	ld bc, SIZEOF("Level Objects WRAM")
	call CopyHLToDE_BC
	pop_wram
	ld a, $81
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateWRAMDataChecksum
	ld a, d
	ld [sBackup3WRAMChecksum + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [sBackup3WRAMChecksum + 1], a
	ld [wChecksum + 1], a
	ld a, $82
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [sBackup3WRAMChecksumEcho1 + 0], a
	ld a, e
	ld [sBackup3WRAMChecksumEcho1 + 1], a
	ld a, $83
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [sBackup3WRAMChecksumEcho2 + 0], a
	ld a, e
	ld [sBackup3WRAMChecksumEcho2 + 1], a

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
	ld a, LCDC_DEFAULT
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

ResetAfterPauseMenuSave:
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
	call VBlank_SaveScreen

	xor a
	ld [wSCY], a
	ldh [rSCY], a
	ld [wSCX], a
	ldh [rSCX], a
	xor a
	ld [wPalFadeCounter], a
	ld [wTimer], a
	ld [wcee4], a

	ld hl, wBGMapTileVRAM0Queue
	ld a, HIGH(v0BGMap0 + $164)
	ld [hli], a
	ld [hl], LOW(v0BGMap0 + $164)
	ld a, LCDC_DEFAULT
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
	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop_wram

	ld a, $11
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	call CalculateGameDataChecksum
	ld a, d
	ld [sGameDataChecksum + 0], a
	ld [wChecksum + 0], a
	ld a, e
	ld [sGameDataChecksum + 1], a
	ld [wChecksum + 1], a

	ld a, $12
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [sGameDataChecksumEcho1 + 0], a
	ld a, e
	ld [sGameDataChecksumEcho1 + 1], a

	ld a, $13
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [sGameDataChecksumEcho2 + 0], a
	ld a, e
	ld [sGameDataChecksumEcho2 + 1], a

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
	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CopyHLToDE
	pop_wram

	ld a, $21
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, [wChecksum + 0]
	ld d, a
	ld [sBackupGameDataChecksum + 0], a
	ld a, [wChecksum  + 0+ 1]
	ld e, a
	ld [sBackupGameDataChecksum + 1], a

	ld a, $22
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [sBackupGameDataChecksumEcho1 + 0], a
	ld a, e
	ld [sBackupGameDataChecksumEcho1 + 1], a

	ld a, $23
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [sBackupGameDataChecksumEcho2 + 0], a
	ld a, e
	ld [sBackupGameDataChecksumEcho2 + 1], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	pop af
	sramswitch

	call VBlank_1f0c6c
	farcall LoadSaveScreenPals
	farcall PrintSaveCompleteBox

    ; sets wTimer to 512
	xor a ; LOW(512)
	ld [wTimer + 0], a
	ld a, HIGH(512)
	ld [wTimer + 1], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

TransitionAfterSave:
	ld a, [wTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .after_epilogue
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .after_epilogue
	cp TRANSITION_GAME_OVER
	jr z, .game_over

; overworld
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

ResetAfterSave:
	jp Init
