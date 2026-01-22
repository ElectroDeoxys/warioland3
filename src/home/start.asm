SECTION "start", ROM0
Start::
	and a
	cp BOOTUP_A_CGB
	ld a, FALSE
	jr nz, .not_cgb
	inc a ; TRUE
.not_cgb
	ldh [hCGB], a
	ld a, $00
	ldh [hUnused_fffd], a
	; fallthrough

Init::
	; reset power up to show in Demo
	xor a
	ldh [hDemoPowerUp], a
InitWithoutDemoPowerUpReset::
	; init stack
	di
	ld sp, wStackTop
	ld hl, sp+$00
	ld c, 0 ; aka $100 bytes
	xor a
.loop_clear_stack
	ld [hld], a
	dec c
	jr nz, .loop_clear_stack

	xor a
	ldh [rVBK], a
	ldh [rWBK], a
	ldh [rRP], a

	; set lcd on and wait for VBlank
	ld a, LCDC_ON
	ldh [rLCDC], a
.wait_vblank
	ldh a, [rLY]
	cp LY_VBLANK + 4
	jr nz, .wait_vblank

	; enable BG and OBJ
	ld a, LCDC_BG_ON | LCDC_OBJ_ON
	ldh [rLCDC], a
	call ClearVRAM
	call EnableDoubleSpeed

	ldh a, [hCGB]
	and a
	jr z, .clear_wram

	; is CGB
	xor a
	ldh [rVBK], a
	ldh [rWBK], a
	ldh [rRP], a

.clear_wram
	; clear all WRAM except stack
	xor a
	ld hl, STARTOF(WRAM0)
	ld bc, SIZEOF(WRAM0) - SIZEOF("Stack")
	call WriteAToHL_BCTimes
	call ClearWRAM

	; clear OAM
	xor a
	ld hl, STARTOF(OAM)
	ld bc, $100
	call WriteAToHL_BCTimes

	; clears most of HRAM
	; except hDemoPowerUp, hUnused_fffd and hCGB
	ld hl, STARTOF(HRAM)
	ld b, hDemoPowerUp - STARTOF(HRAM)
	call WriteAToHL_BTimes

	; clear BGMap0 and BGMap1
	call FillBGMap0_With7f
	call ClearBGMap1

	ld a, BANK("Main State Table")
	bankswitch
	xor a
	ld [rROMB1 + $100], a
	xor a ; SRAM0
	sramswitch

	xor a
	ldh [rIF], a
	ldh [rIE], a
	ldh [rSCY], a
	ldh [rSCX], a
	ldh [rSTAT], a

	; init hTransferVirtualOAM
	ld c, LOW(hTransferVirtualOAM)
	; should be ld b, (PushOAM.end - PushOAM) + 1
	ld b, (WriteAToHL_BCTimes - PushOAM) + 1
	ld hl, PushOAM
.loop_write_oam_func
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop_write_oam_func

	; init VBlank function
	call VBlank_Ret
	; init HRAM call function
	call InitHRAMCallFunc

	xor a
	ldh [rIF], a
	ld a, IE_VBLANK
	ldh [rIE], a
	call InitLCD

	; enable SRAM
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	farcall ValidateSaveData
	ei

	; if not playing on CGB, then show
	; the GB Incompatible screen
	ldh a, [hCGB]
	and a
	jr nz, .is_cgb
	ld a, ST_GB_INCOMPATIBLE
	ld [wState], a
	xor a
	ld [wSubState], a
	jr .skip_init_game_state
.is_cgb
	; otherwise, init the game state
	call InitGameState
.skip_init_game_state

	xor a
	ld [wJoypadPressed], a
	call FillWhiteBGPal
	ld a, LCDC_ON
	ldh [rLCDC], a

	; init audio
	di
	call InitAudio
	ei

; main game loop
.GameLoop:
	call UpdateJoypad
	ld a, [wResetDisabled]
	and a
	jr nz, .no_reset

; restart the game if all four buttons are down
	ld a, [wJoypadDown]
	and PAD_BUTTONS
	cp PAD_A | PAD_B | PAD_SELECT | PAD_START
	jr nz, .no_reset
	; restart game
	call TurnMusicOff
	ld bc, SOUND_OFF
	call TurnOffSFXID
	call UpdateAudio
	jp Init

.no_reset
	; where all main game logic is handled
	call MainStateTable

	; update animated tiles if enabled
	ld a, [wRoomAnimatedTilesEnabled]
	and a
	jr z, .skip_animated_tiles
	farcall UpdateRoomAnimatedTiles
.skip_animated_tiles
	; update animated pals if enabled
	ld a, [wRoomAnimatedPalsEnabled]
	and a
	jr z, .skip_animated_pals
	call UpdateRoomAnimatedPals
.skip_animated_pals

	; enable V-Blank handler and wait for it to be executed
	ld a, TRUE
	ld [wEnableVBlankFunc], a
	halt
	nop
.wait_vblank_exec
	ld a, [wVBlankFuncExecuted]
	and a
	jr z, .wait_vblank_exec

	; increment global counter
	ld hl, wGlobalCounter
	inc [hl]

	xor a ; FALSE
	ld [wEnableVBlankFunc], a
	ld [wVBlankFuncExecuted], a

	; audio handler
	call HandleSound

	; loop back to game loop
	jp .GameLoop

; used as a handler for invalid jumptable entries
; resets the game
DebugReset::
	jp Init

; handle playing SFX and music
HandleSound::
	ld a, [wSoundMuted]
	and a
	ret nz
	ld hl, hSFXID
	ld a, [hli]
	cp $ff
	jr nz, .valid_sfx
	ld bc, SOUND_OFF
	jr .got_sfx
.valid_sfx
	ld c, [hl]
	ld b, a
	or c
	jr z, .music
.got_sfx
	xor a
	ld [hld], a
	ld [hl], a
	call PlaySFX

.music
	ld hl, hMusicID
	ld a, [hli]
	cp $ff
	jr nz, .valid_music
	ld bc, SOUND_OFF
	xor a
	ld [hld], a
	ld [hl], a
	call PlayNewMusic
	jr .update

.valid_music
	ld c, [hl]
	ld b, a
	or c
	jr z, .update
	xor a
	ld [hld], a
	ld [hl], a
	call PlayNewMusic_SetNoise

.update
	call UpdateAudio
	ret

; unreferenced
UnreferencedMuteSound:
	ld a, [wSoundMuted]
	and a
	ret nz
	xor a
	ldh [hSFXID + 0], a
	ldh [hSFXID + 1], a
	call TurnMusicOff
	ld bc, SOUND_OFF
	call TurnOffSFXID
	call UpdateAudio
	ld a, TRUE
	ld [wSoundMuted], a
	ret

; unreferenced
UnreferencedUnmuteSound:
	ld a, [wSoundMuted]
	and a
	ret z
	xor a
	ld [wSoundMuted], a
	ldh [hSFXID + 0], a
	ldh [hSFXID + 1], a
	ldh a, [hMusicIDBackup + 0]
	ld b, a
	ldh a, [hMusicIDBackup + 1]
	ld c, a
	call PlayNewMusic_SetNoise
	ret
