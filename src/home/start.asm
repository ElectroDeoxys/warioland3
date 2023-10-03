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
	ldh [hfffd], a
	; fallthrough

Init::
	xor a
	ldh [hDemoPowerUp], a
InitWithoutDemoPowerUpReset::
	di
	ld sp, $cfff
	ld hl, sp+$00
	ld c, $00
	xor a
.loop_clear_stack
	ld [hld], a
	dec c
	jr nz, .loop_clear_stack

	xor a
	ldh [rVBK], a
	ldh [rSVBK], a
	ldh [rRP], a

	ld a, LCDCF_ON
	ldh [rLCDC], a
.wait_lcd_y
	ldh a, [rLY]
	cp $94
	jr nz, .wait_lcd_y

	ld a, LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	call ClearVRAM
	call EnableDoubleSpeed

	ldh a, [hCGB]
	and a
	jr z, .clear_wram
	xor a
	ldh [rVBK], a
	ldh [rSVBK], a
	ldh [rRP], a

.clear_wram
	xor a
	ld hl, w0Start ; start of WRAM0
	ld bc, w0End - w0Start
	call WriteAToHL_BCTimes
	call ClearWRAM

	; clear OAM
	xor a
	ld hl, $fe00
	ld bc, $100
	call WriteAToHL_BCTimes

	ld hl, hCallFunc
	ld b, hDemoPowerUp - hCallFunc
	call WriteAToHL_BTimes
	call FillBGMap0_With7f
	call ClearBGMap1

	ld a, BANK("Bank 1")
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
	call VBlank_Ret
	call InitHRAMCallFunc

	xor a
	ldh [rIF], a
	ld a, IEF_VBLANK
	ldh [rIE], a
	call InitLCD

	ld a, CART_SRAM_ENABLE
	ld [rRAMG], a
	farcall Func_1f0cad
	ei

	ldh a, [hCGB]
	and a
	jr nz, .is_cgb
	ld a, ST_GB_INCOMPATIBLE
	ld [wState], a
	xor a
	ld [wSubState], a
	jr .asm_21d
.is_cgb
	call InitGameState
.asm_21d

	xor a
	ld [wJoypadPressed], a
	call FillWhiteBGPal
	ld a, LCDCF_ON
	ldh [rLCDC], a
	di
	call InitAudio
	ei

; main game loop
.GameLoop
	call UpdateJoypad
	ld a, [wResetDisabled]
	and a
	jr nz, .no_reset

; restart the game if all four buttons are down
	ld a, [wJoypadDown]
	and BUTTONS
	cp A_BUTTON | B_BUTTON | SELECT | START
	jr nz, .no_reset
	; restart game
	call Func_1002
	ld bc, SOUND_OFF
	call Func_ff4
	call Func_fbc
	jp Init

.no_reset
	call StateTable

	ld a, [wRoomAnimatedTilesEnabled]
	and a
	jr z, .animated_pals
	farcall UpdateRoomAnimatedTiles
.animated_pals
	ld a, [wRoomAnimatedPalsEnabled]
	and a
	jr z, .skip_animated_pals
	call UpdateRoomAnimatedPals
.skip_animated_pals

	ld a, TRUE
	ld [wEnableVBlankFunc], a
	halt
	nop
.wait_vblank_exec
	ld a, [wVBlankFuncExecuted]
	and a
	jr z, .wait_vblank_exec

	ld hl, wGlobalCounter
	inc [hl]
	xor a
	ld [wEnableVBlankFunc], a
	ld [wVBlankFuncExecuted], a
	call HandleSound
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
	jr nz, .asm_2a2
	ld bc, SOUND_OFF
	jr .got_sfx
.asm_2a2
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
	jr nz, .asm_2c0
	ld bc, SOUND_OFF
	xor a
	ld [hld], a
	ld [hl], a
	call Func_fe6
	jr .asm_2cb

.asm_2c0
	ld c, [hl]
	ld b, a
	or c
	jr z, .asm_2cb
	xor a
	ld [hld], a
	ld [hl], a
	call PlayNewMusic_SetNoise

.asm_2cb
	call Func_fbc
	ret

; unreferenced
UnreferencedMuteSound:
	ld a, [wSoundMuted]
	and a
	ret nz
	xor a
	ldh [hSFXID + 0], a
	ldh [hSFXID + 1], a
	call Func_1002
	ld bc, SOUND_OFF
	call Func_ff4
	call Func_fbc
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
	ldh a, [hffb3]
	ld b, a
	ldh a, [hffb4]
	ld c, a
	call PlayNewMusic_SetNoise
	ret
