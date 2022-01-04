SECTION "start", ROM0
Start:: ; 0150 (0:0150)
	and a
	cp $11
	ld a, FALSE
	jr nz, .not_cgb
	inc a ; TRUE
.not_cgb
	ldh [hCGB], a
	ld a, $00
	ldh [hfffd], a
	; fallthrough

Init:: ; 15e (0:15e)
	xor a
	ldh [hfffc], a
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

	ld a, LCDC_ON
	ldh [rLCDC], a
.wait_lcd_y
	ldh a, [rLY]
	cp $94
	jr nz, .wait_lcd_y

	ld a, LCDC_OBJON | LCDC_BGON
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
	ld b, hfffc - hCallFunc
	call WriteAToHL_BTimes
	call FillBGMap0_With7f
	call ClearBGMap1

	ld a, BANK("Bank 1")
	bankswitch
	xor a
	ld [MBC5HighRomBank], a
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
	ld a, 1 << INT_VBLANK
	ldh [rIE], a
	call InitLCD

	ld a, SRAM_ENABLE
	ld [MBC5SRamEnable], a
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
	ld a, LCDC_ON
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
; 0x28d

; used as a handler for invalid jumptable entries
; resets the game
DebugReset:: ; 28d (0:28d)
	jp Init
; 0x290

; handle playing SFX and music
HandleSound:: ; 290 (0:290)
	ld a, [wc090]
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
; 0x2cf

	INCROM $2cf, $302

; adds a Repeat Delay and Rate to any DPad key
ProcessDPadRepeat:: ; 302 (0:302)
	ldh a, [rSVBK]
	push af
	ld a, BANK("GFX RAM")
	ldh [rSVBK], a

	ld hl, wDPadRepeatCounter
	ld a, [hl]
	and a
	jr z, .reset_counter
	ld a, [wJoypadPressed]
	and D_PAD
	jr nz, .reset_counter
	ld a, [wJoypadDown]
	and D_PAD
	jr z, .reset_counter
	dec [hl]
	jr nz, .done

; add down Joypad buttons
; to the pressed buttons
	ld b, a
	ld a, [wJoypadPressed]
	or b
	ld [wJoypadPressed], a

	ld a, $08
	jr .set_counter
.reset_counter
	ld a, $10
.set_counter
	ld [hl], a
.done
	pop af
	ldh [rSVBK], a
	ret
; 0x334

; store in wVBlankFunc a return function
VBlank_Ret:: ; 334 (0:334)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ret
.func_end

; store in wLCDFunc a return function
InitLCD:: ; 341 (0:341)
	ld a, $d9 ; reti
	ld [wLCDFunc], a
	xor a
	ldh [rIF], a
	ld hl, rIE
	res INT_LCD_STAT, [hl]
	ld hl, rSTAT
	res STAT_LYC, [hl]
	ret
; 0x354

VBlank_354:: ; 354 (0:354)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x370

WaitVBlank:: ; 370 (0:370)
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, WaitVBlank
.is_on
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .is_on
	ret
; 0x37d

; clears whole wVirtualOAM regardless of filled elements
ClearWholeVirtualOAM:: ; 37d (0:37d)
	ld hl, wVirtualOAM
	ld b, NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH
	xor a
	call WriteAToHL_BTimes
	xor a
	ld [wNumOAMSprites], a
	ret
; 0x38b

ClearBGMap0:: ; 38b (0:38b)
	ld a, $ff
	jr FillBGMap0

; fills v0BGMap0 and v1BGMap0 with $7f
FillBGMap0_With7f:: ; 38f (0:38f)
	ld a, $7f
	; fallthrough

; fills v0BGMap0 and v1BGMap0 with byte in a
FillBGMap0:: ; 391 (0:391)
	ld d, a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0
	ld bc, v1BGMap1 - v1BGMap0
	xor a
	call WriteAToHL_BCTimes

	ldh [rVBK], a ; VRAM0
	ld a, d
	ld hl, v0BGMap0
	ld bc, v0BGMap1 - v0BGMap0
	call WriteAToHL_BCTimes
	ret
; 0x3ad

ClearBGMap1:: ; 3ad (0:3ad)
	ld a, $ff
	ld hl, v0BGMap1
	ld bc, v0End - v0BGMap1
	call WriteAToHL_BCTimes
	ret
; 0x3b9

; clears wVirtualOAM, only up to the filled number of elements
ClearVirtualOAM:: ; 3b9 (0:3b9)
	ld a, [wNumOAMSprites]
	ld l, a
	ld h, HIGH(wVirtualOAM)
	ld a, NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH
	sub l
	jr z, .done
	jr c, .done
	srl a ; a / 2
	srl a ; a / 4
	ld b, a

	xor a
.loop
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .loop
.done
	xor a
	ld [wNumOAMSprites], a
	ret
; 0x3d8

UpdateJoypad:: ; 3d8 (0:3d8)
; read the joypad register and translate it to something more
; workable for use in-game. There are 8 buttons, so we can use
; one byte to contain all player input.

; can only get four inputs at a time
; take d-pad first
	ld a, R_DPAD
	ldh [rJOYP], a

; read a couple of times to give some time
rept 4
	ldh a, [rJOYP]
endr

; the Joypad register output is in the lo nybble (inverted)
; make the hi nybble of our new container d-pad input
	cpl
	and JOY_INPUT_MASK
	swap a
	ld b, a

; buttons make 8 total inputs (A, B, Select, Start)
; we can fit this into one byte
	ld a, R_BUTTONS
	ldh [rJOYP], a

; read a couple of times to give some time
rept 10
	ldh a, [rJOYP]
endr

; input is in the lo nybble
	cpl
	and JOY_INPUT_MASK
	or b
	ld c, a

	ld a, [wJoypadDown]
	; xor-ing then and-ing makes it so only
	; bits set this frame remain set
	xor c
	and c
	ld [wJoypadPressed], a
	; set the inputs which are pressed down
	ld a, c
	ld [wJoypadDown], a

; reset joypad
	ld a, $30
	ldh [rJOYP], a
	ret
; 0x418

PushOAM:: ; 418 (0:418)
	ldh [rDMA], a
	ld a, NUM_SPRITE_OAM_STRUCTS
.loop
	dec a
	jr nz, .loop
	ret
.end
; 0x420

; writes a to address in hl, b times
WriteAToHL_BTimes:: ; 420 (0:420)
	ld [hli], a
	dec b
	jr nz, WriteAToHL_BTimes
	ret
; 0x425

; write a to hl, bc times
WriteAToHL_BCTimes:: ; 425 (0:425)
	push af
	ld a, c
	and a
	jr z, .skip_inc_b
	inc b
.skip_inc_b
	pop af
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret
; 0x434

; copies bc bytes from hl to de
CopyHLToDE_BC:: ; 434 (0:434)
	ld a, c
	and a
	jr z, .loop
	inc b
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret
; 0x443

; switches bank to wTempBank
; then copies bc bytes from hl to de
FarCopyHLToDE_BC:: ; 443 (0:443)
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, c
	and a
	jr z, .loop
	inc b
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	pop af
	bankswitch
	ret
; 0x466

; copies b bytes from hl to de
CopyHLToDE:: ; 466 (0:466)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, CopyHLToDE
	ret
; 0x46d

FadeBGToWhite_Normal:: ; 46d (0:46d)
	ld a, FADE_SPEED_NORMAL
	ld [wFadeSpeed], a
	jr FadeBGToWhite

SlowFadeBGToWhite:: ; 474 (0:474)
	ld a, FADE_SPEED_FAST
	ld [wFadeSpeed], a
	jr FadeBGToWhite

FastFadeToWhite:: ; 47b (0:47b)
	xor a ; FADE_SPEED_SLOW
	ld [wFadeSpeed], a
	; fallthrough

FadeBGToWhite:: ; 47f (0:47f)
	ld a, [wPalFadeCounter]
	cp 2
	jr nc, .lighten
	dec a
	jr z, .asm_496
	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl]
	ret

.asm_496
	call VBlank_8bf

.lighten
	ld hl, wCurRGB
	ld de, wTempBGPals
	ld b, 8 palettes

.loop_colors
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hl], a ; blue

; inc blue
	inc [hl]
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_blue ; FADE_SPEED_SLOW
	inc [hl]
	dec a
	jr z, .cap_blue ; FADE_SPEED_NORMAL
	inc [hl]
	inc [hl]

.cap_blue
	ld a, [hl]
	cp $1f
	jr c, .inc_green
	ld [hl], $1f

.inc_green
	dec l
	inc [hl]
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_green ; FADE_SPEED_SLOW
	inc [hl]
	dec a
	jr z, .cap_green ; FADE_SPEED_NORMAL
	inc [hl]
	inc [hl]
.cap_green
	ld a, [hl]
	cp $1f
	jr c, .inc_red
	ld [hl], $1f

.inc_red
	dec l
	inc [hl]
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_red ; FADE_SPEED_SLOW
	inc [hl]
	dec a
	jr z, .cap_red ; FADE_SPEED_NORMAL
	inc [hl]
	inc [hl]
.cap_red
	ld a, [hl]
	cp $1f
	jr c, .convert_rgb
	ld [hl], $1f

.convert_rgb
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and %00000111
	rlca
	rlca
	rlca
	rlca
	rlca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and %00011000
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a
	inc e
	dec l
	dec b
	jr nz, .loop_colors

	ld hl, wPalFadeCounter
	inc [hl]
	ld b, 33
	ld a, [wFadeSpeed]
	and a
	jr z, .asm_52d ; FADE_SPEED_SLOW
	ld b, 18
	dec a
	jr z, .asm_52d ; FADE_SPEED_NORMAL
	ld b, 10
.asm_52d
	ld a, [hl]
	cp b
	ret c

	di
	ld hl, wBackupVBlankFunc
	ld b, $07 ; useless
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wFadeSpeed], a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x54e

	INCROM $54e, $5df

DarkenBGToPal_Normal:: ; 5df (0:5df)
	ld a, FADE_SPEED_NORMAL
	ld [wFadeSpeed], a
	jr DarkenBGToPal

DarkenBGToPal_Fast:: ; 5e6 (0:5e6)
	ld a, FADE_SPEED_FAST
	ld [wFadeSpeed], a
	jr DarkenBGToPal

SlowFadeFromWhite:: ; 5ed (0:5ed)
	xor a ; FADE_SPEED_SLOW
	ld [wFadeSpeed], a
	; fallthrough

; fades BG palettes to wTempPals1
; gradually darkens up to wTempPals1
DarkenBGToPal:: ; 5f1 (0:5f1)
	ld a, [wPalFadeCounter]
	cp 2
	jr nc, .asm_60b
	dec a
	jr z, .asm_608
	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl] ; set up to begin fade
	ret

.asm_608
	call VBlank_8bf

.asm_60b
	ld hl, wTargetRed
	ld de, wTempPals1
	ld b, 8 palettes

.loop_colors
; convert rgb values from wTempPals1
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hli], a ; blue

; convert rgb values from wTempBGPals
	dec e
	ld d, HIGH(wTempBGPals)
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rrca
	rrca
	rrca
	rrca
	rrca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hl], a ; blue

; reduce blue
	ld a, [wTargetBlue]
	ld c, a
	dec [hl]
	jr z, .cap_blue
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_blue ; FADE_SPEED_SLOW
	dec [hl]
	jr z, .cap_blue
	dec a
	jr z, .cap_blue ; FADE_SPEED_NORMAL
	dec [hl]
	jr z, .cap_blue
	dec [hl]
.cap_blue
	ld a, [hl]
	cp c
	jr nc, .reduce_green
	ld [hl], c

.reduce_green
	dec l
	ld a, [wTargetGreen]
	ld c, a
	dec [hl]
	jr z, .cap_green
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_green ; FADE_SPEED_SLOW
	dec [hl]
	jr z, .cap_green
	dec a
	jr z, .cap_green ; FADE_SPEED_NORMAL
	dec [hl]
	jr z, .cap_green
	dec [hl]
.cap_green
	ld a, [hl]
	cp c
	jr nc, .reduce_red
	ld [hl], c

.reduce_red
	dec l
	ld a, [wTargetRed]
	ld c, a
	dec [hl]
	jr z, .cap_red
	ld a, [wFadeSpeed]
	and a
	jr z, .cap_red ; FADE_SPEED_SLOW
	dec [hl]
	jr z, .cap_red
	dec a
	jr z, .cap_red ; FADE_SPEED_NORMAL
	dec [hl]
	jr z, .cap_red
	dec [hl]
.cap_red
	ld a, [hl]
	cp c
	jr nc, .convert_rgb
	ld [hl], c

.convert_rgb
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and %00000111
	rlca
	rlca
	rlca
	rlca
	rlca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and %00011000
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a

	inc e
	ld d, HIGH(wTempPals1)
	ld hl, wTargetRed
	dec b
	jp nz, .loop_colors

	ld hl, wPalFadeCounter
	inc [hl]
	ld b, 33
	ld a, [wFadeSpeed]
	and a
	jr z, .asm_6db ; FADE_SPEED_SLOW
	ld b, 18
	dec a
	jr z, .asm_6db ; FADE_SPEED_NORMAL
	ld b, 10
.asm_6db
	ld a, [hl]
	cp b
	ret c

	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wFadeSpeed], a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x6fa

; fades BG palettes to wTempPals1
; gradually lightens up to wTempPals1
; when fading is complete, advances wSubState
SlowFadeInScreen:: ; 6fa (0:6fa)
	ld a, [wPalFadeCounter]
	cp 2
	jr nc, .fade ; jump if in middle of fade
	dec a
	jr z, .begin_fade

	ld a, $01
	ld [wc186], a
	call VBlank_88d
	ld hl, wPalFadeCounter
	inc [hl] ; set up to begin fade
	ret

.begin_fade
	call VBlank_8bf

.fade
	ld hl, wTargetRed
	ld de, wTempPals1
	ld b, 8 palettes

.loop_colors
; convert rgb values from wTempPals1
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rlca
	rlca
	rlca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hli], a ; blue

; convert rgb values from wTempBGPals
	dec e
	ld d, HIGH(wTempBGPals)
	ld a, [de]
	and %00011111
	ld [hli], a ; red
	ld a, [de]
	and %11100000
	rlca
	rlca
	rlca
	ld [hl], a
	inc e
	ld a, [de]
	and %00000011
	rlca
	rlca
	rlca
	or [hl]
	ld [hli], a ; green
	ld a, [de]
	and %01111100
	rrca
	rrca
	ld [hl], a ; blue

; compare blue
	ld a, [wTargetBlue]
	ld c, a
	cp [hl]
	jr z, .compare_green
	jr nc, .inc_blue
	dec [hl]
	ld a, [hl]
	cp c ; useless
	jr .compare_green
.inc_blue
	inc [hl]
	ld a, [hl]
	cp c ; useless

.compare_green
	dec l
	ld a, [wTargetGreen]
	ld c, a
	cp [hl]
	jr z, .compare_red
	jr nc, .inc_green
	dec [hl]
	ld a, [hl]
	cp c ; useless
	jr .compare_red
.inc_green
	inc [hl]
	ld a, [hl]
	cp c ; useless

.compare_red
	dec l
	ld a, [wTargetRed]
	ld c, a
	cp [hl]
	jr z, .convert_rgb
	jr nc, .inc_red
	dec [hl]
	ld a, [hl]
	cp c ; useless
	jr .convert_rgb
.inc_red
	inc [hl]
	ld a, [hl]
	cp c ; useless

.convert_rgb
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and %00000111
	rrca
	rrca
	rrca
	or c
	dec e
	ld [de], a
	ld a, [hli]
	and %00011000
	rrca
	rrca
	rrca
	ld c, a
	ld a, [hld]
	rlca
	rlca
	or c
	inc e
	ld [de], a

	inc e
	ld d, HIGH(wTempPals1)
	ld hl, wTargetRed
	dec b
	jp nz, .loop_colors

	ld hl, wPalFadeCounter
	inc [hl]
	ld b, 33
	ld a, [hl]
	cp b
	ret c

	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wFadeSpeed], a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x7cf

	INCROM $7cf, $88d

VBlank_88d:: ; 88d (0:88d)
	di
	ld hl, wVBlankFunc
	ld de, wBackupVBlankFunc
	ld b, 3
	call CopyHLToDE

	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ei
	ret

.func
	jp .asm_8a9
.func_end

.asm_8a9
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	call StoreBGPals
	call StoreOBPals
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
; 0x8bf

VBlank_8bf:: ; 8bf (0:8bf)
	di
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ei
	ret

.func
	jp .asm_8d0
.func_end

.asm_8d0
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	call LoadBGPalettesFromWRAM
	call LoadOBPalettesFromWRAM
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
; 0x8e6

DisableLCD:: ; 8e6 (0:8e6)
	ldh a, [rLCDC]
	bit LCDC_ENABLE_F, a
	ret z ; already disabled

	ldh a, [rIE]
	ld [wTempIE], a
; disable VBlank
	res INT_VBLANK, a
	ldh [rIE], a

; wait until VBlank would normally happen
.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr nz, .wait

; turn LCD off
	ldh a, [rLCDC]
	and LCDC_OFF
	ldh [rLCDC], a
	xor a
	ldh [rIF], a
	ld a, [wTempIE]
	ldh [rIE], a
	ret
; 0x909

; decompresses data from hl and writes to bc
; the game stores some data in compressed form, such as tile gfx and bg maps
; this routine decompresses it by doing the following logic:
; - if bit 7 is not set, repeat the following byte that amount of times
; - if bit 7 is set, copy the next amount of bytes literally
; the result is written to bc
Decompress:: ; 909 (0:909)
	ld a, [hli]
	and a
	jr z, .done
	bit 7, a
	jr nz, .literal_copy

; copies byte x times
	ld d, a
	ld a, [hli]
	ld e, a
.loop1
	ld a, e
	ld [bc], a
	inc bc
	dec d
	jr nz, .loop1
	jr Decompress

.literal_copy
; copies literal x bytes
	and %01111111
	ld d, a
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .loop2
	jr Decompress
.done
	ret
; 0x928

Func_928:: ; 928 (0:928)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [$d506]
	ld c, a
	ld a, [wPalFadeCounter]
	or c
	jr nz, .asm_95e
	ld a, $01
	ld [wc186], a
	call VBlank_9cb
	ld a, [$d506]
	xor $01
	ld [$d506], a
	ld a, $01
	ld [$d503], a
	ld a, [w3d507 + 0]
	ld [$d504], a
	ld a, [w3d507 + 1]
	ld [$d505], a
.asm_95a
	pop af
	ldh [rSVBK], a
	ret

.asm_95e
	ld a, [$d506]
	xor $01
	ld [$d506], a
	jr z, .asm_96d
	call Func_9a3
	jr .asm_95a
.asm_96d
	ld hl, wPalFadeCounter
	inc [hl]
	ld a, [hl]
	cp $11
	jr c, .asm_95a

	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	xor a
	ld [wPalFadeCounter], a
	ld [wc186], a
	ld [$d506], a
	stop_music
	stop_sfx
	ld hl, wSubState
	inc [hl]
	jr .asm_95a
; 0x9a3

Func_9a3:: ; 9a3 (0:9a3)
	ld a, [wPalFadeCounter]
	cp $10
	ret nc
	ld hl, $d503
	ld a, [hl]
	add $02
	ld [hli], a
	ld a, [hl]
	add $20
	ld [hli], a
	ld a, [hl]
	adc $00
	cp $9c
	jr c, .asm_9bd
	sub $04
.asm_9bd
	ld [hld], a
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	cp $1f
	ret nz
	ld a, [hl]
	add $20
	ld [hl], a
	ret
; 0x9cb

VBlank_9cb:: ; 9cb (0:9cb)
	di
	ld hl, wVBlankFunc
	ld de, wBackupVBlankFunc
	ld b, 3
	call CopyHLToDE

	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ei
	ret

.func
	jp .asm_9e7
.func_end

.asm_9e7
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld de, $ffe0
	ld a, [$d506]
	and a
	jr z, .asm_a49
	ld hl, $d503
	ld a, [hli]
	ld b, a
	ld c, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_a0a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld [hl], $7f
	add hl, de
	ld a, h
	cp $98
	jr nc, .asm_a22
	add $04
	ld h, a
.asm_a22
	dec b
	jr nz, .asm_a0a
	ld b, c
	inc b
.asm_a27
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, $7f
	ld [hli], a
	ld a, l
	and $1f
	jr nz, .asm_a44
	ld a, l
	sub $20
	ld l, a
	ld a, h
	sbc $00
	ld h, a
.asm_a44
	dec b
	jr nz, .asm_a27
	jr .asm_a8e
.asm_a49
	ld hl, $d503
	ld a, [hli]
	ld b, a
	ld c, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_a52
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, $7f
	ld [hli], a
	ld a, l
	and $1f
	jr nz, .asm_a6f
	ld a, l
	sub $20
	ld l, a
	ld a, h
	sbc $00
	ld h, a
.asm_a6f
	dec b
	jr nz, .asm_a52
	ld b, c
.asm_a73
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld [hl], $7f
	add hl, de
	ld a, h
	cp $98
	jr nc, .asm_a8b
	add $04
	ld h, a
.asm_a8b
	dec b
	jr nz, .asm_a73
.asm_a8e
	pop af
	ldh [rSVBK], a
	ret
; 0xa92

InitHRAMCallFunc:: ; a92 (0:a92)
	ld hl, .func
	ld de, hCallFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wROMBank]
	push af
	ld a, $0
	bankswitch
	call $4000
	pop af
	bankswitch
	ret
.func_end
; 0xab5

; decompresses level layout data pointed
; by wCompressedLevelLayoutPtr to SRAM
DecompressLevelLayout:: ; ab5 (0:ab5)
	ld a, [wceef]
	and $3c
	ret nz

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCompressedLevelLayoutPtr + 0]
	ld h, a
	ld a, [wCompressedLevelLayoutPtr + 1]
	ld l, a
	call .Decompress
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xaee

; decompresses level layout data
; - if bit 7 is not set, repeat the following byte that amount of times
; - if bit 7 is set, copy the next amount of bytes literally
; each row is 160 blocks wide
.Decompress:: ; aee (0:aee)
	ld c, LEVEL_WIDTH
	ld de, s1a000
.loop_data
	ld a, [hli]
	and a
	ret z ; done

	bit 7, a
	jr nz, .literal_copy
	ld b, a
	ld a, [hli]
	ld [wc09f], a
.loop_repeat
	ld a, [wc09f]
	ld [de], a
	inc de
	ld a, e
	cp c
	jr z, .next_row_1
.next_repeat
	dec b
	jr nz, .loop_repeat
	jr .loop_data
.next_row_1
	ld e, LOW($a000)
	inc d
	ld a, d
	cp $c0 ; check if already outside SRAM
	jr nz, .skip_sram_switch ; can be .next_repeat
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.skip_sram_switch
	jr .next_repeat

.literal_copy
	and %01111111
	ld b, a
.loop_copy
	ld a, [hli]
	ld [de], a
	inc de
	ld a, e
	cp c
	jr z, .next_row_2
.next_copy
	dec b
	jr nz, .loop_copy
	jr .loop_data

.next_row_2
	ld e, LOW($a000)
	inc d
	ld a, d
	cp $c0
	jr nz, .next_copy
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .next_copy
; 0xb48

DecompressLevelObjectsMap:: ; b48 (0:b48)
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCompressedLevelLayoutPtr + 0]
	ld h, a
	ld a, [wCompressedLevelLayoutPtr + 1]
	ld l, a
	call .Decompress
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xb7b

.Decompress:: ; b7b (0:b7b)
	ld a, LEVEL_WIDTH
	srl a ; /2
	add $b0
	dec a
	ld c, a
	ld de, s1a000 + $b0
.loop_data
	ld a, [hli]
	and a
	ret z ; done

	bit 7, a
	jr nz, .literal_copy
	ld b, a
	ld a, [hli]
	ld [wc09f], a
.loop_repeat
	ld a, [wc09f]
	ld [de], a
	ld a, e
	cp c
	jr z, .next_row_1
	inc de
.next_repeat
	dec b
	jr nz, .loop_repeat
	jr .loop_data
.next_row_1
	ld e, $b0
	inc d
	ld a, d
	cp $c0 ; check if already outside SRAM
	jr nz, .skip_sram_switch ; can be .next_repeat
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
.skip_sram_switch
	jr .next_repeat

.literal_copy
	and %01111111
	ld b, a
.loop_copy
	ld a, [hli]
	ld [de], a
	ld a, e
	cp c
	jr z, .next_row_2
	inc de
.next_copy
	dec b
	jr nz, .loop_copy
	jr .loop_data
.next_row_2
	ld e, $b0
	inc d
	ld a, d
	cp $c0
	jr nz, .next_copy
	ld d, HIGH($a000)
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .next_copy
; 0xbdb

Func_bdb:: ; bdb (0:bdb)
; y position
	ld a, [hli] ; hi
	ld d, a
	ld a, [hli] ; lo
	swap a
	and $0f ; high nybble
	ld b, a
	ld a, d
	and $0f ; low nybble
	swap a
	add b

	ld b, $01
	add $a0
	cp $c0
	jr c, .asm_bfb
	inc b
	sub $20
	cp $c0
	jr c, .asm_bfb
	inc b
	sub $20
.asm_bfb
	ld [wYCell], a
	ld a, b
	ld [wFloorNum], a

; x position
	ld a, [hli] ; hi
	ld d, a
	ld a, [hl] ; lo
	swap a
	and $0f ; high nybble
	ld l, a
	ld a, d
	and $0f ; low nybble
	swap a
	add l
	ld l, a
	ld [wXCell], a

	ld a, [wYCell]
	ld h, a
	ret
; 0xc19

Func_c19:: ; c19 (0:c19)
	ld a, h
	sub $a0
	ld e, a
	ld d, $00
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld a, d
	and $03
	ld d, a
	ld a, l
	and $0f
	add a
	ld l, a
	ld h, $98
	add hl, de
	ld a, h
	ld [wccf0 + 0], a
	ld a, l
	ld [wccf0 + 1], a
	ret
; 0xc4c

Func_c4c:: ; c4c (0:c4c)
	ld a, [wIsDMATransferPending]
	and a
	jr nz, .dma_transfer

	xor a
	ld [MBC5SRamBank], a
	ld hl, wc0bc
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

; copy wce01 to memory pointed by wce6a
	ld hl, wce6a
	ld bc, wce01
	jp wVBlankFunc + $10

.dma_transfer
	ld hl, wPendingDMASourceBank
	ld a, [hli]
	ld [MBC5RomBank], a
	ld c, LOW(rHDMA1)
	ld a, [hli] ; wPendingDMASourcePtr
	ld [$ff00+c], a ; rHDMA1
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rHDMA2
	ld a, [hli] ; wPendingDMADestinationBank
	ldh [rVBK], a
	inc c
	ld a, [hli] ; wPendingDMADestinationPtr
	ld [$ff00+c], a ; rHDMA3
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rHDMA4
	inc c
	ld a, [hl] ; wPendingDMALength
	ld [$ff00+c], a ; rHDMA5

	xor a
	ld [wIsDMATransferPending], a
	ld hl, wc0bc
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

	xor a
	ld [wce00], a
	ld [wce69], a
	ret
; 0xcab

Func_cab:: ; cab (0:cab)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wce6a
	ld bc, wce35
	jp wc800
; 0xcb8

Func_cb8:: ; cb8 (0:cb8)
	xor a
	ld [wce00], a
	ld [wce69], a
	ret
; 0xcc0

; input:
; - hl = hPos
; output:
; - h = y cell
; - l = x cell
Func_cc0:: ; cc0 (0:cc0)
	ld a, [hli]
	ld d, a
	ld a, [hli]
	swap a
	and $0f
	ld c, a
	ld a, d
	and $0f
	swap a
	add c
	add $a0
	ld c, a
	ld [wSpawnYCell], a

	ld a, [hli]
	ld d, a
	ld a, [hl]
	swap a
	and $0f
	ld l, a
	ld a, d
	and $0f
	swap a
	add l
	srl a
	ld l, a
	ld a, $00
	adc $00
	xor $01
	ld [wccef], a
	ld b, a

	ld a, l
	add $b0
	ld l, a
	ld [wSpawnXCell], a
	ld h, c
	ret
; 0xcf8

Func_cf8:: ; cf8 (0:cf8)
	push hl
	ld a, h
	sub $a0
	ld h, a
	and $f0
	swap a
	ld d, a
	ld a, [wccec]
	dec a
	add a
	add d
	ldh [hYPosHi], a
	ld a, h
	and $0f
	swap a
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc 0
	ldh [hYPosHi], a

	ld a, b
	xor $01
	add a
	add a
	add a
	add a ; *16
	add $08
	ld d, a
	ld a, l
	sub $b0
	add a
	ld l, a
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, l
	and $0f
	swap a
	add d
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc 0
	ldh [hXPosHi], a
	pop hl
	ret
; 0xd3e

Func_d3e:: ; d3e (0:d3e)
	ld a, h
	sub $a0
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, [wFloorNum]
	dec a
	add a
	add b
	ldh [hYPosHi], a
	ld a, d
	and $0f
	swap a
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	ld a, l
	sub $00
	ld e, a
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, e
	and $0f
	swap a
	add $08
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc $00
	ldh [hXPosHi], a
	ld a, l
	and $01
	xor $01
	ld b, a
	ld [wccef], a
	ret
; 0xd81

Func_d81:: ; d81 (0:d81)
	ld a, l
	sub $b0
	add a
	ld l, a
	ld a, b
	xor $1
	add l
	ld l, a
	ret
; 0xd8c

Func_d8c:: ; d8c (0:d8c)
	ld a, [wFloorNum]
	ld [wccec], a
	ld b, $01
	ld a, l
	srl a
	jr nc, .asm_d9a
	dec b
.asm_d9a
	add $b0
	ld l, a
	ret
; 0xd9e

; draws Wario on screen unless he's invisible
DrawWario:: ; d9e (0:d9e)
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr nz, .invincible
; show Wario if wInvisibleFrame
; has upper 4 bits set and bit 2 unset
	ld hl, wInvisibleFrame
	inc [hl]
	ld a, [hl]
	and %11110010
	cp %11110000
	jr z, .show_wario
	ret

.invincible
; show Wario if wInvisibleFrame is 0
	ld a, [wInvisibleFrame]
	and a
	ret nz

.show_wario
	ld a, [wOAMBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wOAMPtr + 0]
	ld h, a
	ld a, [wOAMPtr + 1]
	ld l, a
	ld a, [wWarioScreenYPos]
	ld [wCurSpriteYCoord], a
	ld a, [wWarioScreenXPos]
	ld [wCurSpriteXCoord], a
	ld a, [wca65]
	ld [wCurSpriteTileID], a
	ld a, [wca66]
	ld [wCurSpriteAttributes], a
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0xdf4

; hl = sprite pointer
TryAddSprite:: ; df4 (0:df4)
	ld a, [wCurSpriteTileID]
	ld d, $00
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	ld hl, wCurSpriteXCoord
	ld a, [hld]
	ld c, a    ; wCurSpriteXCoord
	ld a, [hld]
	ld b, a    ; wCurSpriteYCoord
	ld l, [hl] ; wNumOAMSprites
	ld h, HIGH(wVirtualOAM)
.loop
	ld a, l
	cp NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH
	ret nc
	ld a, [de]
	cp $80
	ret z ; finished

	ld a, [de] ; SPRITEOAMSTRUCT_YCOORD
	add b
	ld [hli], a
	inc de
	ld a, [de] ; SPRITEOAMSTRUCT_XCOORD
	add c
	ld [hli], a
	inc de
	ld a, [de] ; SPRITEOAMSTRUCT_TILE_ID
	ld [hli], a
	inc de
	push hl
	ld hl, wCurSpriteAttributes
	ld a, [de] ; SPRITEOAMSTRUCT_ATTRIBUTES
	xor [hl]
	pop hl
	ld [hli], a
	ld a, l
	ld [wNumOAMSprites], a
	inc de
	jr .loop
; 0xe2b

	INCROM $e2b, $e53

UpdateAnimation:: ; e53 (0:e53)
	ld a, [wFramesetPtr + 0]
	ld d, a
	ld a, [wFramesetPtr + 1]
	ld e, a

	xor a ; FALSE
	ld [wAnimationHasFinished], a
	ld hl, wFrameDuration
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc ; return if duration hasn't elapsed yet

	ld a, [hl] ; wAnimationFrame
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .finished

; next frame
	ld [wca65], a
	ld a, [hl] ; wAnimationFrame
	add 2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a ; wFrameDuration
	ret

.finished
	xor a
	ld [hld], a ; wAnimationFrame
	ld [hl], a ; wFrameDuration
	ld a, TRUE
	ld [wAnimationHasFinished], a
	ret
; 0xe87

Func_e87:: ; e87 (0:e87)
	jp Init
; 0xe8a

LoadLevelLayoutAndObjects:: ; e8a (0:e8a)
	ld d, $00
	ld a, [wLevel]
	add a ; *2
	ld e, a
	rl d
	ld hl, LevelHeaders
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(LevelHeaders)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jr z, Func_e87 ; null

	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 1], a
	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 0], a
	ld a, [hl]
	ld [wTempBank], a
	push hl
	call DecompressLevelLayout
	pop hl
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 1], a
	ld a, [hl]
	ld [wCompressedLevelLayoutPtr + 0], a
	pop af
	bankswitch

	push hl
	ld a, [wceef]
	and $3c
	jr nz, .skip_loading_objects
	call DecompressLevelObjectsMap
.skip_loading_objects
	pop hl
	ret
; 0xedb

Func_edb:: ; edb (0:edb)
	ld d, $00
	ld a, [wLevel]
	add a ; *2
	ld e, a
	rl d
	ld hl, LevelHeaders
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(LevelHeaders)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jp z, Func_e87 ; null

	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 1], a
	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 0], a
	ld a, [hl]
	ld [wTempBank], a
	pop af
	bankswitch
	call Func_f13
	ret
; 0xf13

Func_f13:: ; f13 (0:f13)
	ld a, [wceef]
	and $3c
	ret nz
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCompressedLevelLayoutPtr + 0]
	ld d, a
	ld a, [wCompressedLevelLayoutPtr + 1]
	ld e, a
	call Func_f4c
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xf4c

Func_f4c:: ; f4c (0:f4c)
	ld c, $a0
	ld hl, s0a000
.asm_f51
	ld a, [de]
	and a
	ret z
	bit 7, a
	jr nz, .asm_f85
	ld b, a
	inc de
	ld a, [de]
	and $80
	ld [wc09f], a
	inc de
.asm_f61
	ld a, [wc09f]
	or [hl]
	ld [hli], a
	ld a, l
	cp c
	jr z, .asm_f6f
.asm_f6a
	dec b
	jr nz, .asm_f61
	jr .asm_f51
.asm_f6f
	ld l, $00
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_f83
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_f83
	jr .asm_f6a
.asm_f85
	and $7f
	ld b, a
	inc de
.asm_f89
	ld a, [de]
	and $80
	or [hl]
	ld [hli], a
	inc de
	ld a, l
	cp c
	jr z, .asm_f98
.asm_f93
	dec b
	jr nz, .asm_f89
	jr .asm_f51
.asm_f98
	ld l, $00
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_f93
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .asm_f93
; 0xfae

InitAudio:: ; fae (0:fae)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_InitAudio
	pop af
	ldh [rSVBK], a
	ret
; 0xfbc

; bc = sound ID
Func_fbc:: ; fbc (0:fbc)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f06
	pop af
	ldh [rSVBK], a
	ret
; 0xfca

; bc = sound ID
PlaySFX:: ; fca (0:fca)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_PlaySFX
	pop af
	ldh [rSVBK], a
	ret
; 0xfd8

	INCROM $fd8, $0fe6

Func_fe6:: ; fe6 (0:fe6)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f18
	pop af
	ldh [rSVBK], a
	ret
; 0xff4

; bc = sound ID
Func_ff4:: ; ff4 (0:ff4)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f1e
	pop af
	ldh [rSVBK], a
	ret
; 0x1002

Func_1002:: ; 1002 (0:1002)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f24
	pop af
	ldh [rSVBK], a
	ret
; 0x1010

	INCROM $1010, $1062

; bc = sound ID
PlayNewMusic_SetNoise:: ; 1062 (0:1062)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_PlayNewMusic_SetNoise
	pop af
	ldh [rSVBK], a
	ret
; 0x1070

PlayRecoverySFX:: ; 1070 (0:1070)
	play_sfx SFX_RECOVERY
	ret
; 0x1079

ClearTransformationValues:: ; 1079 (0:1079)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_BLIND
	call z, .RestoreBlindPalettes

	xor a
	ld [wInvincibleCounter], a
	ld [wTransformation], a
	ld [wca8f], a
	ld [wStingTouchState], a
	ld [wTouchState], a
	ld [wca94], a
	ld [wIsIntangible], a
	ld [wTransformationDuration + 0], a
	ld [wTransformationDuration + 1], a
	ld [wAutoMoveState], a
	ld [wInvisibleFrame], a
	ld [wca9c], a
	ret

; restores the palettes after
; recovering from Blind transformation
.RestoreBlindPalettes
	ld hl, wTempPals1
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld b, 8
	ld c, LOW(rBGPD)

.wait_lcd_on_bg
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_on_bg
.wait_lcd_off_bg
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_off_bg

	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on_bg

	ld hl, wTempPals2 palette 3
	ld a, (1 << rOBPI_AUTO_INCREMENT) | $18
	ldh [rOBPI], a
	ld b, 4
	ld c, LOW(rOBPD)

.wait_lcd_on_ob
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_on_ob
.wait_lcd_off_ob
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_off_ob

	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on_ob
	ret
; 0x10fc

	INCROM $10fc, $1146

Func_1146:: ; 1146 (0:1146)
	call Func_114e
	ld a, c
	ld [wca78], a
	ret
; 0x114e

; returns in c:
; 6 if   $0 <= ypos <  $80
; 5 if  $80 <= ypos < $100
; 4 if $100 <= ypos < $180
; 3 if $180 <= ypos < $200
; 2 if $200 <= ypos < $280
; 1 if $280 <= ypos < $300
Func_114e:: ; 114e (0:114e)
	ld a, [wYPosHi]
	dec a
	jr z, .asm_115b ; 1
	dec a
	jr z, .asm_115f ; 2
	ld c, $05
	jr .asm_1161
.asm_115b
	ld c, $03
	jr .asm_1161
.asm_115f
	ld c, $01

.asm_1161
	ld a, [wYPosLo]
	cp $80
	ret nc
	; < $80
	inc c
	ret
; 0x1169

	INCROM $1169, $1197

Func_1197:: ; 1197 (0:1197)
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_11ad
	call Func_114e
	ld a, [wca78]
	sub c
	jr c, .asm_11ab
	jr .asm_11ad
.asm_11ab
	jr Func_11d6
.asm_11ad
	ret
; 0x11ae

Func_11ae:: ; 11ae (0:11ae)
	ld a, c
	ld [wca78], a
	cp $05
	jr z, .asm_11ba
	ld a, $80
	jr .asm_11bc
.asm_11ba
	ld a, $68
.asm_11bc
	ld [wc1a9], a
	play_sfx SFX_0E1
	ld a, $08
	ld [wc1aa], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	xor a
	ld [wcac8], a
	ret
; 0x11d6

Func_11d6:: ; 11d6 (0:11d6)
	ld a, c
	ld [wca78], a
	play_sfx SFX_0E1
	ld a, $04
	ld [wc1aa], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	ld a, $80
	ld [wc1a9], a
	xor a
	ld [wcac8], a
	ret
; 0x11f6

Func_11f6:: ; 11f6 (0:11f6)
	xor a
	ld [wGrabState], a
	ld [wc1b1], a
	ld [wRoomAnimatedPalsEnabled], a
	ld [wcee0], a
	ld [wcee1], a
	ld [wcee2], a
	ld [wcac3], a
	ld [wIsBossBattle], a
	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, [wc0d7]
	bit 7, a
	ret nz
	ld hl, wSubState
	ld a, [wc0d7]
	bit 5, a
	jr z, .asm_1246
	inc [hl]
	farcall Func_8e06
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, h
	ld [w3d507 + 1], a
	ld a, l
	ld [w3d507 + 0], a
	pop af
	ldh [rSVBK], a
	ret

.asm_1246
	inc [hl]
	inc [hl]
	stop_music
	stop_sfx
	ret
; 0x1259

AddXOffset:: ; 1259 (0:1259)
	ld a, [wc0c3]
	add b
	ld [wc0c3], a
	ld a, [wXPosLo]
	add b
	ld [wXPosLo], a
	ld a, [wXPosHi]
	adc 0
	ld [wXPosHi], a
	ret
; 0x1270

SubXOffset:: ; 1270 (0:1270)
	ld a, [wc0c3]
	sub b
	ld [wc0c3], a
	ld a, [wXPosLo]
	sub b
	ld [wXPosLo], a
	ld a, [wXPosHi]
	sbc 0
	ld [wXPosHi], a
	ret
; 0x1287

; b = y offset
AddYOffset:: ; 1287 (0:1287)
	ld a, [wc0c2]
	add b
	ld [wc0c2], a
;	fallthrough

Func_128e:: ; 128e (0:128e)
	ld a, [wYPosLo]
	add b
	ld [wYPosLo], a
	ld a, [wYPosHi]
	adc 0
	ld [wYPosHi], a
	ret
; 0x129e

; b = y offset
SubYOffset:: ; 129e (0:129e)
	ld a, [wc0c2]
	sub b
	ld [wc0c2], a
;	fallthrough

Func_12a5:: ; 12a5 (0:12a5)
	ld a, [wYPosLo]
	sub b
	ld [wYPosLo], a
	ld a, [wYPosHi]
	sbc 0
	ld [wYPosHi], a
	ret
; 0x12b5

	INCROM $12b5, $12c3

; clears wcca0
Func_12c3:: ; 12c3 (0:12c3)
	ld hl, wcca0
	ld b, $42
	xor a
	call WriteAToHL_BTimes
	ret
; 0x12cd

SaveBackupVRAM:: ; 12cd (0:12cd)
	ldh a, [rSVBK]
	push af
	ld a, BANK("GFX RAM")
	ldh [rSVBK], a
	ld a, [wSCY]
	ld [w3d500], a
	ld a, [wSCX]
	ld [w3d501], a
	ld hl, wTempPals1
	ld de, w3d280
	ld b, 16 palettes
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	xor a ; VRAM0
	ldh [rVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM4")
	ldh [rSVBK], a
	ld hl, v0Tiles0
	ld de, w4d000
	ld bc, v0Tiles2 - v0Tiles0
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM5")
	ldh [rSVBK], a
	ld hl, v0Tiles2
	ld de, w5d000
	ld bc, v0End - v0Tiles2
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM6")
	ldh [rSVBK], a
	ld hl, v1Tiles0
	ld de, w6d000
	ld bc, v1Tiles2 - v1Tiles0
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM7")
	ldh [rSVBK], a
	ld hl, v1Tiles2
	ld de, w7d000
	ld bc, v1End - v1Tiles2
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	xor a ; VRAM0
	ldh [rVBK], a
	ret
; 0x1351

LoadBackupVRAM:: ; 1351 (0:1351)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [w3d500]
	ld [wSCY], a
	ld a, [w3d501]
	ld [wSCX], a
	ld hl, w3d280
	ld de, wTempPals1
	ld b, 16 palettes
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	xor a
	ldh [rVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM4")
	ldh [rSVBK], a
	ld hl, w4d000
	ld de, v0Tiles0
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM5")
	ldh [rSVBK], a
	ld hl, w5d000
	ld de, v0Tiles2
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM6")
	ldh [rSVBK], a
	ld hl, w6d000
	ld de, v1Tiles0
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM7")
	ldh [rSVBK], a
	ld hl, w7d000
	ld de, v1Tiles2
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	xor a
	ldh [rVBK], a
	ret
; 0x13d5

	INCROM $13d5, $141a

ReturnToPendingLevelState:: ; 141a (0:141a)
	ld hl, wState
	ld [hl], ST_LEVEL
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret
; 0x1426

ReturnToMap:: ; 1426 (0:1426)
	ld hl, wca3b
	set 7, [hl]
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a
	farcall StartOverworldState
	ret
; 0x1440

	INCROM $1440, $145a

UpdateObjAnim:: ; 145a (0:145a)
	xor a
	ld [wObjAnimWasReset], a
	ld a, [hld] ;
	ld e, a     ; frameset pointer
	ld a, [hld] ;
	ld d, a     ;
	ld a, [hl] ; duration
	sub 1
	ld [hld], a
	ret nc

	; new frame
	ld a, [hl] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .reset_anim
	dec l
	dec l
	ld [hli], a ; frame
	inc l
	ld a, [hl] ; frameset offset
	add $2
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a ; duration
	ret

.reset_anim
	xor a
	ld [hli], a ; frameset offset
	ld [hl], a ; duration
	ld a, TRUE
	ld [wObjAnimWasReset], a
	ret
; 0x1488

Func_1488:: ; 1488 (0:1488)
	ld a, [wJumpVelTable]
	dec a
	jr z, .knock_back
	dec a
	jr z, .normal_jump
	dec a
	jr z, .high_jump
	dec a
	jr z, .asm_14a0
	dec a
	jr z, .asm_149b
	ret

.asm_149b
	ld hl, JumpVelTable_BouncyHighJump
	jr .asm_14b2
.asm_14a0
	ld hl, JumpVelTable_BouncyJump
	jr .asm_14b2
.high_jump
	ld hl, JumpVelTable_HighJump
	jr .asm_14b2
.normal_jump
	ld hl, JumpVelTable_Normal
	jr .asm_14b2
.knock_back
	ld hl, JumpVelTable_KnockBack
.asm_14b2

	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	add hl, de
	bit 7, [hl]
	jr z, .falling

; rising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call SubYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	jr .done

.falling
	xor a
	ld [wca76], a
	ld b, [hl]
	call AddYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .done
	ld [hl], MAX_JUMP_VEL_INDEX

.done
	ret
; 0x14de

Func_14de:: ; 14de (0:14de)
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .done
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .done
	jr c, .done
	jp Func_11ae
.done
	ret
; 0x14f6

Func_14f6:: ; 14f6 (0:14f6)
	update_pos_y
;	fallthrough

Func_1501:: ; 1501 (0:1501)
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .done
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .done
	jr c, .asm_151a
	call Func_11ae
	jr .done
.asm_151a
	call Func_11d6
.done
	ret
; 0x151e

Func_151e:: ; 151e (0:151e)
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir left
	xor a
	ld [wca86], a
	jr Func_1554

.dir_right
	ld a, [wIsStandingOnSlope]
	bit 0, a
	jr z, Func_1554
;	fallthrough

Func_1531:: ; 1531 (0:1531)
	ld a, [wca86]
	cp $08
	jr c, Func_1554
	ld a, $04
	ld [wca86], a
	jr Func_1554
; 0x153f

Func_153f:: ; 153f (0:153f)
	ld a, [wDirection]
	and a
	jr z, .dir_left
	xor a
	ld [wca86], a
	jr Func_1554
.dir_left
	ld a, [wIsStandingOnSlope]
	bit 1, a
	jr z, Func_1554
	jr Func_1531
; 0x1554

Func_1554:: ; 1554 (0:1554)
	ld a, [wca86]
	ld e, a
	ld d, $00
	ld hl, Data_196f
	add hl, de
	ld b, [hl]
	ld hl, wca86
	ld a, [hl]
	cp $1b
	jr z, .asm_1569
	inc [hl]
	ret

.asm_1569
	and $fc
	ld [hl], a
	ret
; 0x156d

Func_156d:: ; 156d (0:156d)
	jp Init
; 0x1570

RecoverFromTransformation:: ; 1570 (0:1570)
	call ClearTransformationValues
	ld a, $10
	ld [wInvincibleCounter], a
	jr ResetLevelMusicWarioPalsAndState
; 0x157a

RecoverFromTransformation_WithoutInvincibility:: ; 157a (0:157a)
	call ClearTransformationValues
;	fallthrough

ResetLevelMusicWarioPalsAndState:: ; 157d (0:157d)
	call UpdateLevelMusic
	ld hl, Pals_c800
	call SetWarioPal
	ld a, [wJumpVelTable]
	and a
	jr nz, .fall
	farcall SetState_Idling
	jp PlayRecoverySFX
.fall
	farcall StartFall
	jp PlayRecoverySFX
; 0x15b0

LoadWarioGfx:: ; 15b0 (0:15b0)
	ld a, [wDMASourceBank]
	ld [wPendingDMASourceBank], a
	ld a, [wDMASourcePtr + 0]
	ld [wPendingDMASourcePtr + 0], a
	ld a, [wDMASourcePtr + 1]
	ld [wPendingDMASourcePtr + 1], a

	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, 127
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a
	ret
; 0x15dc

Func_15dc:: ; 15dc (0:15dc)
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_15ff
	ld a, [wTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .asm_15ff
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .asm_15ff
	cp TRANSITION_GAME_OVER
	jr z, .asm_15ff
	ld a, [wGameModeFlags]
	and ($1 << MODE_DAY_NIGHT_F)
	jr z, .asm_15ff
	ld a, [wNumberCollectedTreasures]
	dec a
	jr z, Func_1610
.asm_15ff
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld a, ST_PAUSE_MENU
	ld [wState], a
	ld a, SST_PAUSE_18
	ld [wSubState], a
	ret
; 0x1610

Func_1610:: ; 1610 (0:1610)
	ld hl, wState
	ld [hl], ST_0d
	xor a
	ld [wSubState], a
	ret
; 0x161a

; loads a music ID to hMusicID, depending on wLevel
; and whether there's a new transformation music
UpdateLevelMusic:: ; 161a (0:161a)
	ld a, [wcac3]
	and a
	jr nz, .boss_music
	ld a, [wTransformation]
	and a
	jr nz, .transformation

	ld a, [wROMBank]
	push af
	ld a, BANK(LevelMusic)
	bankswitch
.level_music
	ld a, [wLevel]
	ld d, $00
	add a
	ld e, a
	rl d
	ld hl, LevelMusic
	add hl, de
	ld a, [hli]
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	pop af
	bankswitch
	ret

.boss_music
	dec a
	ld d, $00
	add a
	ld e, a
	ld hl, .BossMusicIDs
	add hl, de
	ld a, [hli]
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	ret

.transformation
	ld a, [wTransformation]
	and %11111
	ld d, $00
	add a ; *2
	ld e, a
	rl d
	ld a, [wROMBank]
	push af
	ld a, BANK(TransformationMusicIDs)
	bankswitch
	ld hl, TransformationMusicIDs
	add hl, de
	ld a, [hli]
	cp $ff ; is it null?
	jr z, .level_music
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	pop af
	bankswitch
	ret

.BossMusicIDs
	dw MUSIC_HIDDEN_FIGURE_BATTLE_1
	dw MUSIC_BOSS_BATTLE
	dw MUSIC_BOSS_DEFEAT
; 0x1690

; set game state to Title
InitGameState:: ; 1690 (0:1690)
	xor a ; ST_TITLE
	ld [wState], a
	ld [wSubState], a
	ret
; 0x1698

; clears some SRAM stuff
Func_1698:: ; 1698 (0:1698)
	xor a
	ld hl, s0a380
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0ab80
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a000
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a800
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a400
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0ac00
	ld b, $8
	call WriteAToHL_BTimes

	ld a, $00
	ldh [hfffd], a
	jp Init
; 0x16d0

OpenActionHelp:: ; 16d0 (0:16d0)
	ld hl, wState
	ld a, ST_07
	ld [hli], a
	ld [hl], $00 ; wSubState
	ret
; 0x16d9

Func_16d9:: ; 16d9 (0:16d9)
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $18
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, $0e
	farcall Func_c9f3
	ret
; 0x1700

; returns nz if standing on slippery ground
IsOnSlipperyGround:: ; 1700 (0:1700)
	xor a
	ld [wIsOnSlipperyGround], a

	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a ; - wca71 - 3

	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc 0
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	farcall Func_19b51
	ld a, [wIsOnSlipperyGround]
	and a
	ret nz

	ld a, [wca72]
	sub $03
	ld c, a ; wca72 - 3

	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	farcall Func_19b51
	ld a, [wIsOnSlipperyGround]
	and a
	ret
; 0x1762

Func_1762:: ; 1762 (0:1762)
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1776
	ld a, [wca86]
	cp $10
	jr c, .asm_1775
	ld a, $0c
	ld [wca86], a
.asm_1775
	ret

.asm_1776
	ld a, [wca86]
	cp $08
	jr c, .asm_1782
	ld a, $04
	ld [wca86], a
.asm_1782
	ret
; 0x1783

Func_1783:: ; 1783 (0:1783)
	farcall Func_d4876
	ld a, b
	and a
	ret
; 0x1795

	INCROM $1795, $17ec

Func_17ec:: ; 17ec (0:17ec)
	ld a, [hli]
	add $10
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteTileID], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [$d521]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [$d51e]
	ld h, a
	ld a, [$d51f]
	ld l, a
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0x1826

	db $80 ; ??

PalsWhite:: ; 1827 (0:1827)
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31

	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31

	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31

	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
; 0x1867

PalsBlack:: ; 1867 (0:1867)
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
; 0x18a7

JumpVelTable_Normal:: ; 18a7 (0:18a7)
	db -4 ; $00
	db -4 ; $01
	db -3 ; $02
	db -3 ; $03
	db -3 ; $04
	db -3 ; $05
	db -2 ; $06
	db -2 ; $07
	db -2 ; $08
	db -2 ; $09
	db -1 ; $0a
	db -1 ; $0b
	db -1 ; $0c
	db -1 ; $0d
	db -1 ; $0e
	db -1 ; $0f
	db -1 ; $10
	db -1 ; $11
	db  0 ; $12
	db  0 ; $13
	db  0 ; $14
	db  0 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  1 ; $1a
	db  1 ; $1b
	db  2 ; $1c
	db  2 ; $1d
	db  2 ; $1e
	db  2 ; $1f
	db  2 ; $20
	db  2 ; $21
	db  3 ; $22
	db  3 ; $23
	db  3 ; $24
	db  3 ; $25
	db  4 ; $26
	db  4 ; $27
; 0x18cf

JumpVelTable_HighJump:: ; 18cf (0:18cf)
	db -4 ; $00
	db -4 ; $01
	db -4 ; $02
	db -4 ; $03
	db -4 ; $04
	db -4 ; $05
	db -3 ; $06
	db -3 ; $07
	db -3 ; $08
	db -3 ; $09
	db -2 ; $0a
	db -2 ; $0b
	db -2 ; $0c
	db -2 ; $0d
	db -1 ; $0e
	db -1 ; $0f
	db -1 ; $10
	db -1 ; $11
	db -1 ; $12
	db -1 ; $13
	db  0 ; $14
	db  0 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  1 ; $1a
	db  1 ; $1b
	db  2 ; $1c
	db  2 ; $1d
	db  2 ; $1e
	db  2 ; $1f
	db  2 ; $20
	db  2 ; $21
	db  3 ; $22
	db  3 ; $23
	db  3 ; $24
	db  3 ; $25
	db  4 ; $26
	db  4 ; $27
; 0x18f7

JumpVelTable_KnockBack:: ; 18f7 (0:18f7)
	db -2 ; $00
	db -2 ; $01
	db -2 ; $02
	db -2 ; $03
	db -1 ; $04
	db -1 ; $05
	db -1 ; $06
	db -1 ; $07
	db -1 ; $08
	db -1 ; $09
	db -1 ; $0a
	db -1 ; $0b
	db -1 ; $0c
	db -1 ; $0d
	db -1 ; $0e
	db -1 ; $0f
	db  0 ; $10
	db  0 ; $11
	db  0 ; $12
	db  0 ; $13
	db  0 ; $14
	db  0 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  1 ; $1a
	db  1 ; $1b
	db  2 ; $1c
	db  2 ; $1d
	db  2 ; $1e
	db  2 ; $1f
	db  2 ; $20
	db  2 ; $21
	db  3 ; $22
	db  3 ; $23
	db  3 ; $24
	db  3 ; $25
	db  4 ; $26
	db  4 ; $27
; 0x191f

JumpVelTable_BouncyJump:: ; 191f (0:191f)
	db -2 ; $00
	db -2 ; $01
	db -3 ; $02
	db -4 ; $03
	db -4 ; $04
	db -4 ; $05
	db -4 ; $06
	db -4 ; $07
	db -4 ; $08
	db -4 ; $09
	db -4 ; $0a
	db -4 ; $0b
	db -4 ; $0c
	db -4 ; $0d
	db -3 ; $0e
	db -3 ; $0f
	db -2 ; $10
	db -2 ; $11
	db -2 ; $12
	db -1 ; $13
	db -1 ; $14
	db -1 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  2 ; $1a
	db  2 ; $1b
	db  3 ; $1c
	db  3 ; $1d
	db  3 ; $1e
	db  3 ; $1f
	db  4 ; $20
	db  4 ; $21
	db  4 ; $22
	db  4 ; $23
	db  4 ; $24
	db  4 ; $25
	db  4 ; $26
	db  4 ; $27
; 0x1947

JumpVelTable_BouncyHighJump:: ; 1947 (0:1947)
	db -2 ; $00
	db -3 ; $01
	db -4 ; $02
	db -4 ; $03
	db -4 ; $04
	db -4 ; $05
	db -4 ; $06
	db -4 ; $07
	db -4 ; $08
	db -4 ; $09
	db -4 ; $0a
	db -4 ; $0b
	db -4 ; $0c
	db -4 ; $0d
	db -4 ; $0e
	db -4 ; $0f
	db -4 ; $10
	db -4 ; $11
	db -4 ; $12
	db -3 ; $13
	db -3 ; $14
	db -2 ; $15
	db -1 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  2 ; $1a
	db  2 ; $1b
	db  3 ; $1c
	db  3 ; $1d
	db  3 ; $1e
	db  3 ; $1f
	db  4 ; $20
	db  4 ; $21
	db  4 ; $22
	db  4 ; $23
	db  4 ; $24
	db  4 ; $25
	db  4 ; $26
	db  4 ; $27
; 0x196f

Data_196f:: ; 196f (0:196f)
	db $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $03, $04, $04, $04, $04
; 0x198b

; treasure IDs of each level
LevelTreasureIDs:: ; 198b (0:198b)
	; LEVEL_THE_TEMPLE
	db TREASURE_DUMMY ; grey
	db TREASURE_DUMMY ; red
	db TREASURE_DUMMY ; green
	db TREASURE_DUMMY ; blue

	; LEVEL_OUT_OF_THE_WOODS
	db TREASURE_AXE ; grey
	db TREASURE_JAR ; red
	db TREASURE_PRINCE_FROGS_GLOVE ; green
	db TREASURE_GOLD_MUSIC_BOX ; blue

	; LEVEL_THE_PEACEFUL_VILLAGE
	db TREASURE_BLUE_TABLET ; grey
	db TREASURE_BLUE_BOOK ; red
	db TREASURE_GOBLET ; green
	db TREASURE_DAY_OR_NIGHT_SPELL ; blue

	; LEVEL_THE_VAST_PLAIN
	db TREASURE_GREEN_TABLET ; grey
	db TREASURE_CRAYON_BLUE ; red
	db TREASURE_SKULL_RING_RED ; green
	db TREASURE_RED_GEM ; blue

	; LEVEL_BANK_OF_THE_WILD_RIVER
	db TREASURE_YELLOW_BOOK ; grey
	db TREASURE_MAGNIFYING_GLASS ; red
	db TREASURE_STATUE ; green
	db TREASURE_ROCKET ; blue

	; LEVEL_THE_TIDAL_COAST
	db TREASURE_SKY_KEY ; grey
	db TREASURE_FOOT_OF_STONE ; red
	db TREASURE_ELECTRIC_FAN_PROPELLER ; green
	db TREASURE_GREEN_GEM ; blue

	; LEVEL_SEA_TURTLE_ROCKS
	db TREASURE_GREEN_MUSIC_BOX ; grey
	db TREASURE_GOLDEN_RIGHT_EYE ; red
	db TREASURE_SUN_MEDALLION_TOP ; green
	db TREASURE_FULL_MOON_GONG ; blue

	; LEVEL_DESERT_RUINS
	db TREASURE_TOP_HALF_OF_SCROLL ; grey
	db TREASURE_BOTTOM_HALF_OF_SCROLL ; red
	db TREASURE_CRAYON_PINK ; green
	db TREASURE_SUN_MEDALLION_BOTTOM ; blue

	; LEVEL_THE_VOLCANOS_BASE
	db TREASURE_LEAD_OVERALLS ; grey
	db TREASURE_BLUE_GEM ; red
	db TREASURE_CROWN ; green
	db TREASURE_TUSK_BLUE ; blue

	; LEVEL_THE_POOL_OF_RAIN
	db TREASURE_GEAR_1 ; grey
	db TREASURE_SKULL_RING_BLUE ; red
	db TREASURE_ORNAMENTAL_FAN ; green
	db TREASURE_CRAYON_YELLOW ; blue

	; LEVEL_A_TOWN_IN_CHAOS
	db TREASURE_GEAR_2 ; grey
	db TREASURE_BLUE_MUSIC_BOX ; red
	db TREASURE_GOLDEN_LEFT_EYE ; green
	db TREASURE_SAPLING_OF_GROWTH ; blue

	; LEVEL_BENEATH_THE_WAVES
	db TREASURE_EXPLOSIVE_PLUNGER_BOX ; grey
	db TREASURE_CRAYON_RED ; red
	db TREASURE_RED_CHEMICAL ; green
	db TREASURE_CLUBS_CREST ; blue

	; LEVEL_THE_WEST_CRATER
	db TREASURE_RIGHT_GLASS_EYE ; grey
	db TREASURE_SABER ; red
	db TREASURE_CASTLE_BRICK ; green
	db TREASURE_SPADES_CREST ; blue

	; LEVEL_THE_GRASSLANDS
	db TREASURE_YELLOW_MUSIC_BOX ; grey
	db TREASURE_TRUCK_WHEEL ; red
	db TREASURE_TRIDENT ; green
	db TREASURE_FIGHTER_MANNEQUIN ; blue

	; LEVEL_THE_BIG_BRIDGE
	db TREASURE_POUCH ; grey
	db TREASURE_CRAYON_CYAN ; red
	db TREASURE_POCKET_PET ; green
	db TREASURE_LANTERN ; blue

	; LEVEL_TOWER_OF_REVIVAL
	db TREASURE_SWIMMING_FLIPPERS ; grey
	db TREASURE_SUPER_SMASH ; red
	db TREASURE_TREASURE_MAP ; green
	db TREASURE_MAGIC_WAND ; blue

	; LEVEL_THE_STEEP_CANYON
	db TREASURE_GRAB_GLOVE ; grey
	db TREASURE_TUSK_RED ; red
	db TREASURE_TELEPHONE ; green
	db TREASURE_BLUE_CHEMICAL ; blue

	; LEVEL_CAVE_OF_FLAMES
	db TREASURE_SCEPTER ; grey
	db TREASURE_MINICAR ; red
	db TREASURE_MAGIC_SEEDS ; green
	db TREASURE_SCISSORS ; blue

	; LEVEL_ABOVE_THE_CLOUDS
	db TREASURE_CRAYON_GREEN ; grey
	db TREASURE_FIRE_DRENCHER ; red
	db TREASURE_JACKHAMMER ; green
	db TREASURE_PICK_AXE ; blue

	; LEVEL_THE_STAGNANT_SWAMP
	db TREASURE_FLUTE ; grey
	db TREASURE_GREEN_FLOWER ; red
	db TREASURE_RED_MUSIC_BOX ; green
	db TREASURE_EYE_OF_THE_STORM ; blue

	; LEVEL_THE_FRIGID_SEA
	db TREASURE_HEAD_SMASH_HELMET ; grey
	db TREASURE_TEAPOT ; red
	db TREASURE_MAGICAL_FLAME ; green
	db TREASURE_UFO ; blue

	; LEVEL_CASTLE_OF_ILLUSIONS
	db TREASURE_SUPER_JUMP_SLAM_OVERALLS ; grey
	db TREASURE_TORCH ; red
	db TREASURE_GOLD_MAGIC ; green
	db TREASURE_RUST_SPRAY ; blue

	; LEVEL_THE_COLOSSAL_HOLE
	db TREASURE_LEFT_GLASS_EYE ; grey
	db TREASURE_AIR_PUMP ; red
	db TREASURE_HIGH_JUMP_BOOTS ; green
	db TREASURE_LOCOMOTIVE ; blue

	; LEVEL_THE_WARPED_VOID
	db TREASURE_MYSTERY_HANDLE ; grey
	db TREASURE_CRAYON_BROWN ; red
	db TREASURE_DEMONS_BLOOD ; green
	db TREASURE_HEART_CREST ; blue

	; LEVEL_THE_EAST_CRATER
	db TREASURE_SUPER_GRAB_GLOVES ; grey
	db TREASURE_DIAMONDS_CREST ; red
	db TREASURE_NIGHT_VISION_SCOPE ; green
	db TREASURE_EARTHEN_FIGURE ; blue

	; LEVEL_FOREST_OF_FEAR 
	db TREASURE_WARP_COMPACT ; grey
	db TREASURE_KEY_CARD_RED ; red
	db TREASURE_WARP_REMOVAL_APPARATUS ; green
	db TREASURE_KEY_CARD_BLUE ; blue
; 0x19f3

LoadBGPalettesFromWRAM:: ; 19f3 (0:19f3)
	ld hl, wTempBGPals
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld b, 8 palettes
	ld c, LOW(rBGPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x1a04

LoadOBPalettesFromWRAM:: ; 1a04 (0:1a04)
	ld hl, wTempOBPals
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld b, 8 palettes
	ld c, LOW(rOBPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x1a15

; copies hl to wTempPals1
LoadPalsToTempPals1:: ; 1a15 (0:1a15)
	ld de, wTempPals1
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1a21

; copies hl to wTempPals2
LoadPalsToTempPals2:: ; 1a21 (0:1a21)
	ld de, wTempPals2
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1a2d

; copies b bytes from hl to de
; given that e doesn't overflow
CopyHLToDE_Short:: ; 1a2d (0:1a2d)
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, CopyHLToDE_Short
	ret
; 0x1a34

; copies hl to wTempPals2
Func_1a34:: ; 1a34 (0:1a34)
	ld de, wTempPals2 palette 4
	ld b, 4 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1a40

EnableDoubleSpeed:: ; 1a40 (0:1a40)
	ldh a, [rKEY1]
	bit 7, a
	ret nz ; already in double speed

	ld a, $01
	ldh [rKEY1], a
	ldh a, [rIE]
	push af
	xor a
	ldh [rIE], a
	ld a, JOY_BTNS_SELECT | JOY_DPAD_SELECT
	ldh [rJOYP], a
	stop

.wait
	ldh a, [rKEY1]
	bit 7, a
	jr z, .wait

	xor a
	ldh [rJOYP], a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	ret
; 0x1a64

; clear VRAM if hCGB != 0
ClearVRAM:: ; 1a64 (0:1a64)
	ldh a, [hCGB]
	and a
	ret z

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	xor a
	ld hl, v1Tiles0
	ld bc, v1End - v1Tiles0
	call WriteAToHL_BCTimes

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, v0Tiles0
	ld bc, v0End - v0Tiles0
	jp WriteAToHL_BCTimes
; 0x1a82

ClearWRAM:: ; 1a82 (0:1a82)
	ld e, 1 ; WRAM1
.loop
	ld a, e
	ldh [rSVBK], a
	xor a
	ld hl, $d000
	ld bc, $1000
	call WriteAToHL_BCTimes
	inc e
	bit 3, e
	jr z, .loop
	xor a ; WRAM0
	ldh [rSVBK], a
	ret
; 0x1a9a

; copies all BG pals to wTempBGPals
StoreBGPals:: ; 1a9a (0:1a9a)
	xor a
	ld e, a
	ld hl, wTempBGPals
	ld b, 8 palettes
	ld c, LOW(rBGPD)
.loop
	ld a, e
	ldh [rBGPI], a
	ld a, [$ff00+c]
	ld [hli], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1aad

; copies all OB pals to wTempOBPals
StoreOBPals:: ; 1aad (0:1aad)
	xor a
	ld e, a
	ld hl, wTempOBPals
	ld b, 8 palettes
	ld c, LOW(rOBPD)
.loop
	ld a, e
	ldh [rOBPI], a
	ld a, [$ff00+c]
	ld [hli], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1ac0

; fills BG palette with just white
FillWhiteBGPal:: ; 1ac0 (0:1ac0)
	ld hl, PalsWhite
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld b, 8 palettes
	ld c, LOW(rBGPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x1ad1

; fills OB palette with just white
FillWhiteOBPal:: ; 1ad1 (0:1ad1)
	ld hl, PalsWhite
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld b, 8 palettes
	ld c, LOW(rOBPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x1ae2

	INCROM $1ae2, $1af6

; hl = palette to copy from Wario Palettes
SetWarioPal:: ; 1af6 (0:1af6)
	ld a, h
	ld [wWarioPalsPtr + 0], a
	ld a, l
	ld [wWarioPalsPtr + 1], a
	ld a, [wROMBank]
	push af
	ld a, BANK("Wario Palettes")
	bankswitch
	push hl
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK("Wario Palettes")
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short
	pop hl

	ld a, (1 << rOBPI_AUTO_INCREMENT)
	ldh [rOBPI], a
	ld b, 2
	ld c, LOW(rOBPD)

.wait_lcd_on
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_off

; apply OBJ palette
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on
	pop af
	bankswitch
	ret
; 0x1b4f

	INCROM $1b4f, $1c4a

ApplyTempPals1ToBGPals:: ; 1c4a (0:1c4a)
	ld hl, wTempPals1
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld b, 8 palettes
	ld c, LOW(rBGPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x1c5b

ApplyTempPals2ToOBPals:: ; 1c5b (0:1c5b)
	ld hl, wTempPals2
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld b, 8 palettes
	ld c, LOW(rOBPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x1c6c

	INCROM $1c6c, $2800

LoadPermissionMap:: ; 2800 (0:2800)
	ld a, [wRoomPermissionMap]
	add a
	ld e, a
	ld d, $00
	ld hl, PermissionMapPointers
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(PermissionMapPointers)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $ff
	jr z, .asm_2859
	ld a, [wRoomPermissionMap]
	cp NUM_TILE_MAPS_GROUP_1 - 1
	jr nc, .group_2

; group_1
	ld de, wPermissionMap
	ld b, $00
	call CopyHLToDE
	pop af
	bankswitch
	ret

.group_2
	ld a, [wROMBank]
	push af
	ld a, BANK("Permission Maps 2")
	bankswitch
	ld de, wPermissionMap
	ld b, $00
	call CopyHLToDE
	pop af
	bankswitch
	pop af
	bankswitch
	ret

.asm_2859
	jp Init
; 0x285c

Func_285c:: ; 285c (0:285c)
	ld a, $70
	ld [wca5e], a
	ld a, $58
	ld [wca5f], a
	sub $58
	cpl
	inc a
	add $58
	ld [wca60], a

	ld a, [wROMBank]
	push af
	ld a, BANK(PointerTable_c0319)
	bankswitch
	ld a, [wLevel]
	add a ; *2
	ld e, a
	ld d, $00
	rl d
	ld hl, PointerTable_c0319
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $ff
	jr nz, .valid_level
	jp Init ; null reset

.valid_level
	pop af
	bankswitch

	ld a, [wLevel]
	cp THE_GRASSLANDS_NIGHT_1
	jr nc, .group_2
; group_1
	ld a, [wROMBank]
	push af
	ld a, $30
	bankswitch
	jr .got_bank
.group_2
	ld a, [wROMBank]
	push af
	ld a, $31
	bankswitch

.got_bank
	ld a, [wSpawnPointID]
	add a ; *2
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld e, a
	ld h, [hl]
	ld l, e
	ld a, h
	cp $ff
	jr nz, .valid_spawn_point
	jp Init ; null reset

.valid_spawn_point
	ld a, [hli]
	ld [wSpawnPos], a
	ld a, [hl]
	swap a
	and $0f
	ld [wc0b7], a
	ld a, [hli]
	and $0f
	ld [wc0b6], a
	ld a, [hl]
	swap a
	and $0f
	ld [wc0b8], a
	ld a, [hli]
	and $0f
	ld [wc0b9], a
	ld a, [hli]
	ld [wc0ba], a
	ld a, [hli]
	ld [wEnemyGroup], a

	push hl
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall LoadEnemyGroupData
	pop af
	ldh [rSVBK], a
	pop hl

	ld a, [hli]
	ld [wc1ab], a
	push hl
	farcall InitRoomAnimatedTiles
	pop hl

	ld a, [hli]
	ld [wc1b0], a
	push hl
	farcall InitRoomAnimatedPals
	pop hl

	ld a, [hl]
	ld [wCurRoom], a
	farcall LoadRoom
	pop af
	bankswitch

	ld a, [wc0b6]
	add a
	add a
	add a
	add a ; *16
	add $a0
	jr nz, .asm_2963
	ld a, $ff
.asm_2963
	ld [wc0c4], a

	ld a, [wc0b7]
	add a
	add a
	add a
	add a ; *16
	add $a0
	ld [wc0c5], a

	ld a, [wc0b9]
	add a
	add a
	add a ; *8
	add $b0
	jr nz, .asm_297e
	ld a, $ff
.asm_297e
	ld [wc0c7], a

	ld a, [wc0b8]
	add a
	add a
	add a ; *8
	add $b0
	ld [wc0c6], a
	ret
; 0x298d

Func_298d:: ; 298d (0:298d)
	ld a, [wRoomPermissionMap]
	add a
	ld e, a
	ld d, $00
	ld hl, PointerTable_c090d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0cf]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, wc600
	ld bc, $200
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x29bf

LoadRoomTileMap:: ; 29bf (0:29bf)
	ld a, [wRoomTileMap]
	add a
	ld e, a
	ld d, $00
	ld hl, TileMapsPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0d0]
	ld [wTempBank], a
	ld bc, w3d300
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x29e7

LoadRoomMainTiles:: ; 29e7 (0:29e7)
	ld a, [wRoomMainTiles]
	add a
	ld e, a
	ld d, $00
	ld hl, ForegroundTilesPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomMainTilesBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, v0Tiles2
	ld bc, $800
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x2a19

LoadRoomSpecialTiles:: ; 2a19 (0:2a19)
	ld a, $1 ; VRAM1
	ldh [rVBK], a
	ld a, [wRoomSpecialTiles]
	add a
	ld e, a
	ld d, $00
	ld hl, BackgroundTilesPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomSpecialTilesBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, v0Tiles2
	ld bc, $800
	call CopyHLToDE_BC
	pop af
	bankswitch
	xor a
	ldh [rVBK], a
	ret
; 0x2a52

LoadRoomPalettes:: ; 2a52 (0:2a52)
	ld a, [wRoomPalettes]
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, LevelPals
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPaletteBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall LoadPalsToTempPals1
	ret
; 0x2a77

UpdateRoomAnimatedPals:: ; 2a77 (0:2a77)
	ldh a, [rLY]
	cp $88
	jp nc, .done
	ld a, [wc1b1]
	and a
	jp z, .done
	ld b, a
	ld a, [wc1b5]
	inc a
	ld [wc1b5], a
	cp b
	jp c, .done

	xor a
	ld [wc1b5], a
	ld a, [wRoomAnimatedPals + 0]
	ld h, a
	ld a, [wRoomAnimatedPals + 1]
	ld l, a

	ld a, [wCurRoomAnimatedPal]
	inc a
	cp $08
	jr c, .ok
	xor a ; reset to 0
.ok
	ld [wCurRoomAnimatedPal], a

	ld e, a
	ld d, $00
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(RoomAnimatedPals)
	bankswitch
	ld d, $00
	ld a, [hl]
	add a ; *2
	ld e, a
	rl d
	ld hl, LevelPals
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	bankswitch

	ld a, [wROMBank]
	push af
	ld a, BANK("Palettes")
	bankswitch
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld b, 5
	ld c, LOW(rBGPD)
.wait_lcd_1
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_1
.wait_lcd_2
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_2

rept 12
	ld a, [hli]
	ld [$ff00+c], a
endr
	dec b
	jr nz, .wait_lcd_1

.wait_lcd_3
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_3
.wait_lcd_4
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_4

rept 3
	ld a, [hli]
	ld [$ff00+c], a
endr
	ld a, [hl]
	ld [$ff00+c], a
	pop af
	bankswitch
.done
	ret
; 0x2b25

	INCROM $2b25, $3000

; given the obj struct in hl
; update its sprite with its current position
UpdateObjSprite:: ; 3000 (0:3000)
	ld a, [wROMBank]
	push af
	ld a, [hl]
	swap a
	and %111
	or $60
	bankswitch
	ld l, e
	ld a, [hli]
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteTileID], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurSpriteTileID]
	ld d, $00
	add a ; *2
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	ld hl, wCurSpriteXCoord
	ld a, [hld]
	ld c, a
	ld a, [hld] ; wCurSpriteYCoord
	ld b, a
	ld l, [hl] ; wNumOAMSprites
	ld h, HIGH(wVirtualOAM)
.loop_sprites
	ld a, l
	cp LOW(wVirtualOAMEnd)
	jr nc, .done
	ld a, [de]
	cp $80
	jr z, .done
	ld a, [de]
	add b
	ld [hli], a ; SPRITEOAMSTRUCT_YCOORD
	inc de
	ld a, [de]
	add c
	ld [hli], a ; SPRITEOAMSTRUCT_XCOORD
	inc de
	ld a, [de]
	ld [hli], a ; SPRITEOAMSTRUCT_TILE_ID
	inc de
	ld a, [de]
	ld [hli], a ; SPRITEOAMSTRUCT_ATTRIBUTES
	ld a, l
	ld [wNumOAMSprites], a
	inc de
	jr .loop_sprites
.done
	pop af
	bankswitch
	ret
; 0x305c

Func_305c:: ; 305c (0:305c)
	ld a, [wCurObjUnk18]
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x3069

	INCROM $3069, $3076

Func_3076:: ; 3076 (0:3076)
	ld a, [wCurObjUnk18]
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x3083

	INCROM $3083, $30b8

; moves current object right
; by 1 every 2 frames
MoveObjectRight:: ; 30b8 (0:30b8)
	ld a, [wGlobalCounter]
	rra
	ret c
	ld hl, wCurObjXPos
	inc [hl]
	ret nz
	inc l
	inc [hl]
	ret
; 0x30c5

; moves current object left
; by 1 every 2 frames
MoveObjectLeft:: ; 30c5 (0:30c5)
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld hl, wCurObjXPos
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x30d4

	INCROM $30d4, $30e6

Func_30e6:: ; 30e6 (0:30e6)
	ld hl, wCurObjYPos
	ld a, [hl]
	sub $01
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x30f0

; input:
; - de = frameset pointer
SetObjectFramesetPtr:: ; 30f0 (0:30f0)
	ld hl, wCurObjFramesetPtr
	ld a, e
	ld [hli], a ; OBJ_FRAMESET_PTR
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ret
; 0x30fb

	INCROM $30fb, $3104

Func_3104:: ; 3104 (0:3104)
	ld hl, wCurObjFrameDuration
	ld a, [hld]
	sub 1
	ret nc
	ld a, [wROMBank]
	push af
	ld a, BANK("Object Framesets")
	bankswitch
	dec l
	ld a, [hli] ; OBJ_FRAMESET_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl] ; OBJ_FRAMESET_OFFSET
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr nz, .asm_312a
	ld a, [de] ; first frame
.asm_312a
	ld [wCurObjFrame], a
	jr Func_316b
; 0x312f

UpdateObjectAnimation:: ; 312f (0:312f)
	ld hl, wCurObjFrameDuration
	ld a, [hl]
	sub 1
	ld [hld], a
	ret nc
	ld a, [wROMBank]
	push af
	ld a, BANK("Object Framesets")
	bankswitch
	dec l
	ld a, [hli] ; OBJ_FRAMESET_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl] ; OBJ_FRAMESET_OFFSET
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .reset
	ld [wCurObjFrame], a
	ld a, [hl]
	add $2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a ; OBJ_FRAME_DURATION
	jr Func_316b
.reset
	ld a, $2
	ld [hld], a ; OBJ_FRAMESET_OFFSET
	ld a, [de] ; first frame
	ld [wCurObjFrame], a
	inc de
	ld a, [de] ; first duration
	ld [hl], a ; OBJ_FRAME_DURATION
;	fallthrough

Func_316b:: ; 316b (0:316b)
	pop af
	bankswitch
	ret
; 0x3173

	INCROM $3173, $3290

Func_3290:: ; 3290 (0:3290)
	ld a, [wROMBank]
	push af
	ld a, BANK(_ApplyObjectGravity)
	bankswitch
	jp _ApplyObjectGravity
; 0x329f

Func_329f:: ; 329f (0:329f)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_629d0)
	bankswitch
	jp Func_629d0
; 0x32ae

	INCROM $32ae, $32f9

Func_32f9:: ; 32f9 (0:32f9)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_629a6)
	bankswitch
	jp Func_629a6
; 0x3308

	INCROM $3308, $3416

Func_3416:: ; 3416 (0:3416)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_642d9)
	bankswitch
	call Func_642d9
	pop af
	bankswitch
	ret
; 0x342d

	INCROM $342d, $3444

Func_3444:: ; 3444 (0:3444)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_632ac)
	bankswitch
	call Func_632ac
	pop af
	bankswitch
	ret
; 0x345b

	INCROM $345b, $34b7

Func_34b7:: ; 34b7 (0:34b7)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_631e8)
	bankswitch
	call Func_631e8
	pop af
	bankswitch
	ret
; 0x34ce

	INCROM $34ce, $34e5

Func_34e5:: ; 34e5 (0:34e5)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_6189d)
	bankswitch
	call Func_6189d
	pop af
	bankswitch
	ret
; 0x34fc

	INCROM $34fc, $3513

Func_3513:: ; 3513 (0:3513)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_19bc3)
	bankswitch
	call Func_19bc3
	pop af
	bankswitch
	ld a, b
	ret
; 0x352b

Func_352b:: ; 352b (0:352b)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_19b7b)
	bankswitch
	call Func_19b7b
	pop af
	bankswitch
	ld a, b
	ret
; 0x3543

Func_3543:: ; 3543 (0:3543)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_19b51)
	bankswitch
	call Func_19b51
	pop af
	bankswitch
	ld a, b
	ret
; 0x355b

Func_355b:: ; 355b (0:355b)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_19b61)
	bankswitch
	call Func_19b61
	pop af
	bankswitch
	ld a, b
	ret
; 0x3573

Func_3573:: ; 3573 (0:3573)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_19b69)
	bankswitch
	call Func_19b69
	pop af
	bankswitch
	ld a, b
	ret
; 0x358b

	INCROM $358b, $3a00

; b = sprite bank
; de = pointer to sprite
AddOWSpriteWithScroll:: ; 3a00 (0:3a00)
	ld a, [wSCY]
	ld c, a
	ld a, [hli] ; y coord
	sub c
	ld c, $10
	add c
	ld [wCurSpriteYCoord], a
	ld a, [wSCX]
	ld c, a
	ld a, [hli] ; x coord
	sub c
	ld c, $08
	add c
	ld [wCurSpriteXCoord], a
	ld a, [hli] ; tileID
	ld [wCurSpriteTileID], a
	ld a, [hl] ; attributes
	ld [wCurSpriteAttributes], a
	ld h, d
	ld l, e
;	fallthrough

AddOWSpriteWithScroll_GotParams:: ; 3a22 (0:3a22)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0x3a38

; hl = OAM data
; b = sprite bank
; de = pointer to sprite
AddOWSprite:: ; 3a38 (0:3a38)
	ld a, [hli]
	ld c, $10
	add c
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	ld c, $08
	add c
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteTileID], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a

	ld h, d
	ld l, e
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0x3a66

; hl = wSceneObjXDuration
; de = frameset pointer
; b = bank
UpdateOWAnimation:: ; 3a66 (0:3a66)
	xor a
	ld [wOWAnimationFinished], a

	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [hl] ; duration
	sub 1
	ld [hli], a
	jr nc, .done
	ld a, [hl] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .frameset_end
	ld d, a
	ld a, [hl]

.advance_frameset
	add $2
	ld [hld], a ; frameset offset
	inc bc
	ld a, [bc]
	dec a
	ld [hld], a ; duration
	dec l
	ld [hl], d ; frame

.done
	ld a, $f8
	and l
	ld l, a
	ld b, h
	add $6
	ld c, a
	pop af
	bankswitch
	ret

.frameset_end
	ld [wOWAnimationFinished], a
	ld b, d
	ld c, e
	ld a, [de]
	ld d, a
	xor a
	jr .advance_frameset
; 0x3aac

; returns TRUE in a and carry set if treasure
; in input a has already been collected
; if not collected returns z set
; a = TREASURE_* constant
IsTreasureCollected:: ; 3aac (0:3aac)
	ld hl, wTreasuresCollected
	ld e, a
	srl e
	srl e
	srl e ; / 8
	ld d, $00
	add hl, de ; hl = wTreasuresCollected + (a / 8)

	ld e, $01
	bit 2, a
	jr z, .low_nybble
	swap e ; = $10
.low_nybble

	and %11
	ld d, a
	ld a, e
	jr z, .check_obtained
	rla
	dec d
	jr z, .check_obtained
	rla
	dec d
	jr z, .check_obtained
	rla
.check_obtained
	ld d, a
	and [hl]
	ret z ; not obtained
	ld a, TRUE
	scf
	ret
; 0x3ad7

Func_3ad7:: ; 3ad7 (0:3ad7)
	ld a, [hli]
	and $f8
	rlca
	rlca
	ld c, a
	and $0f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	ld a, [hl]
	and $f8
	rlca
	swap a
	add c
	ld l, a
	ld [w2d082 + 0], a
	ld a, b
	add $d5
	ld h, a
	ld [w2d082 + 1], a
	ret
; 0x3af7

; loads source address of tiles
; with the given level's name for HDMA transfer
; writes them to v0Tiles2 + $500
; b = map side constant (MAP_NORTH, ...)
; d = level index within that map side
LoadLevelName:: ; 3af7 (0:3af7)
	ld a, BANK(LevelNamesJPGfx)
	ld hl, wLanguage
	add [hl]
	ld [wHDMABank], a
	xor a
	ld [wHDMA], a
	ld hl, LevelNamesJPGfx ; aka LevelNamesENGfx
	ld c, $00
	ld a, b
	swap a ; *$10
	ld b, a
	add hl, bc
	ld a, d
	add a ; *2
	ld d, a
	ld e, $00
	add hl, de
	ld a, h
	ld [w2d0b5 + 0], a
	ld a, l
	ld [w2d0b5 + 1], a
	ld a, $15
	ld [w2d0b5 + 2], a
	xor a
	ld [w2d0b5 + 3], a
	ld a, $1f
	ld [w2d0b5 + 4], a
	ret
; 0x3b2b

; copies c bytes from b:hl to de
CopyFarBytes:: ; 3b2b (0:3b2b)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld b, c
	call CopyHLToDE
	pop af
	bankswitch
	ret
; 0x3b42

; copies c * $100 bytes from bank b
; at address hl to de
CopyFarBytes_Long:: ; 3b42 (0:3b42)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld b, c
	ld c, $00
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x3b5b

LoadFarTiles:: ; 3b5b (0:3b5b)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld bc, $800
	ld de, v0Tiles2
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x3b77

	INCROM $3b77, $3b93

; sets scene obj's state and
; resets its animation data
; a = state
SetSceneObjState:: ; 3b93 (0:3b93)
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	ret
; 0x3b98

PlayOverworldMusic:: ; 3b98 (0:3b98)
	ld a, [w2d011]
	and a
	jr nz, .night
	play_music2 MUSIC_OVERWORLD_DAY
	ret
.night
	play_music2 MUSIC_OVERWORLD_NIGHT
	ret
; 0x3bb8

LoadFarPalsToTempPals1:: ; 3bb8 (0:3bb8)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals1
	pop af
	bankswitch
	ret
; 0x3bce

LoadFarPalsToTempPals2:: ; 3bce (0:3bce)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals2
	pop af
	bankswitch
	ret
; 0x3be4

ApplyPalConfig:: ; 3be4 (0:3be4)
	ld c, [hl]
	xor a
	ld [hli], a
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
.loop
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x3c03

Func_3c03:: ; 3c03 (0:3c03)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, w2d0b5
	ld a, [hli]
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	xor a
	ld [wHDMABank], a
	ret
; 0x3c1f

	INCROM $3c1f, $3c25

; seems to be a funciton to apply some
; movement to OW obj
; hl = OW obj
; de = movement coordinates
Func_3c25:: ; 3c25 (0:3c25)
	call .Func_3c35
	add e
	ld [bc], a

	ld a, [hl]
	cp $80
	ret nz

	ld a, $07
	or c
	ld c, a
	xor a
	ld [bc], a ; unk7
	ret

.Func_3c35
	ld c, l
	ld b, h
	ld a, $07
	or l
	ld l, a
	ld a, [hl] ; unk7
	inc [hl]
	add a ; *2
	ld l, a
	ld a, $00
	adc $00
	ld h, a
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [bc] ; y coord
	add d
	ld [bc], a
	inc c
	ld a, [bc] ; x coord
	ret
; 0x3c4f

AddOffsetInPointerTable:: ; 3c4f (0:3c4f)
	add a
	ld e, a
	ld a, $00
	adc 0
	ld d, a
	add hl, de
	ret
; 0x3c58

; outputs in hl the pointer corresponding
; to the index given in register a
; from the pointer table given in hl
GetPointerFromTableHL:: ; 3c58 (0:3c58)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 0x3c5f

; same as GetPointerFromTableHL
; but outputs pointer to de
GetPointerFromTableDE:: ; 3c5f (0:3c5f)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 0x3c66

; outputs in hl the cth pointer
; pointed by the ath entry
; in the pointer table in hl
GetCthEntryFromAthTable:: ; 3c66 (0:3c66)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	call AddOffsetInPointerTable
	ret
; 0x3c71

GetByteFromPointerInHL:: ; 3c71 (0:3c71)
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ret
; 0x3c76

Func_3c76:: ; 3c76 (0:3c76)
	xor a
	ld hl, w2d0c0
	ld bc, $10
	call WriteAToHL_BCTimes
	ret
; 0x3c81

	INCROM $3c81, $3f00

DoAudioFunc_InitAudio:: ; 3f00 (0:3f00)
	call BackupBankAndSwitchToAudioBank
	jp _InitAudio
; 0x3f06

Func_3f06:: ; 3f06 (0:3f06)
	call Func_3f75
	jp Func_3007a
; 0x3f0c

DoAudioFunc_PlaySFX:: ; 3f0c (0:3f0c)
	call Func_3f62
	jp _PlaySFX
; 0x3f12

	INCROM $3f12, $3f18

Func_3f18:: ; 3f18 (0:3f18)
	call Func_3f62
	jp Func_302b8
; 0x3f1e

Func_3f1e:: ; 3f1e (0:3f1e)
	call Func_3f62
	jp Func_303c9
; 0x3f24

Func_3f24:: ; 3f24 (0:3f24)
	call Func_3f62
	jp Func_30416
; 0x3f2a

	INCROM $3f2a, $3f48

DoAudioFunc_PlayNewMusic_SetNoise:: ; 3f48 (0:3f48)
	call Func_3f62
	jp _PlayNewMusic_SetNoise
; 0x3f4e

BackupBankAndSwitchToAudioBank:: ; 3f4e (0:3f4e)
	ld a, [wROMBank]
	ld [wAudioBankBackup], a
;	fallthrough

SwitchToAudioBank:: ; 3f54 (0:3f54)
	ld a, BANK("Audio Engine")

.switch_bank
	ld [wROMBank], a
	ld [MBC5RomBank - $100], a
	ret

SwitchBackFromAudioBank:: ; 3f5d (0:3f5d)
	ld a, [wAudioBankBackup]
	jr SwitchToAudioBank.switch_bank
; 0x3f62

Func_3f62:: ; 3f62 (0:3f62)
	ld hl, wAudioEngineFlags
	bit 7, [hl]
	jr nz, .pop_hl
.asm_3f69
	set 7, [hl]
	push af
	call BackupBankAndSwitchToAudioBank
	pop af
	ret
.pop_hl
	pop hl
	ld a, $ff
	ret
; 0x3f75

Func_3f75:: ; 3f75 (0:3f75)
	ld hl, wAudioEngineFlags
	bit 7, [hl]
	jr z, Func_3f62.asm_3f69
	bit 6, [hl]
	jr nz, Func_3f62.pop_hl
	set 6, [hl]

	; pop calling function from the stack
	; and store the it in WRAM
	pop hl
	ld a, h
	ld [wAudioBankCallback + 1], a
	ld a, l
	ld [wAudioBankCallback + 0], a
	xor a
	ret
; 0x3f8d

Func_3f8d:: ; 3f8d (0:3f8d)
	ld hl, wAudioEngineFlags
	bit 6, [hl]
	jr nz, .push_callback
	call SwitchBackFromAudioBank
	res 7, [hl]
	xor a
	ret

.push_callback
	; push callback to stack and return to it
	ld a, [wAudioBankCallback + 1]
	ld h, a
	ld a, [wAudioBankCallback + 0]
	ld l, a
	push hl
	ld hl, wAudioEngineFlags
	res 6, [hl]
	ret
; 0x3faa

ReadAudioCommands_1Byte:: ; 3faa (0:3faa)
	ld a, [wSoundBank]
	call SwitchToAudioBank.switch_bank
	ld a, [de]
	ld c, a
	jp SwitchToAudioBank
; 0x3fb5

ReadAudioCommands_2Bytes:: ; 3fb5 (0:3fb5)
	ld a, [wSoundBank]
	call SwitchToAudioBank.switch_bank
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	jp SwitchToAudioBank
; 0x3fc3

rept $3d
	db $00
endr
