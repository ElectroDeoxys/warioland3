; rst vectors
SECTION "rst00", ROM0
	jp Init
	ds 5
SECTION "rst08", ROM0
	ds 8
SECTION "rst10", ROM0
	ds 8
SECTION "rst18", ROM0
	ds 8
SECTION "rst20", ROM0
	ds 8
SECTION "rst28", ROM0
	add a
	pop hl
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld h, [hl]
; SECTION "rst30", ROM0
	ld l, a
	jp hl
	ds 6
SECTION "rst38", ROM0
	ds 8

; interrupts
SECTION "vblank", ROM0
	jp VBlank
	ds 5
SECTION "lcd", ROM0
	jp wLCDFunc
	ds 5
SECTION "timer", ROM0
	reti
	ds 7
SECTION "serial", ROM0
	reti
	ds 7
SECTION "joypad", ROM0
	reti

VBlank: ; 61 (0:61)
	push af
	push bc
	push de
	push hl
	ld a, [wEnableVBlankFunc]
	and a
	jr z, .skip
	ld a, [wROMBank]
	push af
	ld a, [wSRAMBank]
	push af
	ldh a, [rSVBK]
	push af
	ldh a, [rVBK]
	push af
	call wVBlankFunc
	pop af
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	pop af
	sramswitch
	pop af
	bankswitch
	ld a, $01
	ld [wVBlankFuncExecuted], a
.skip
	pop hl
	pop de
	pop bc
	pop af
	reti
; 0x9a
	ds $66

SECTION "romheader", ROM0
	nop
	jp Start
	ds $4c

SECTION "start", ROM0
Start: ; 0150 (0:0150)
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

Init: ; 15e (0:15e)
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
	ld bc, $f00
	call WriteAToHL_BCTimes
	call ClearWRAM

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
	call Func_341

	ld a, SRAM_ENABLE
	ld [MBC5SRamEnable], a
	farcall Func_1f0cad
	ei

	ldh a, [hCGB]
	and a
	jr nz, .asm_21a
	ld a, MAIN_SEQTABLE_0b
	ld [wSequence], a
	xor a ; MAIN_SEQTABLE_TITLE
	ld [wSubSequence], a
	jr .asm_21d
.asm_21a
	call Func_1690
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
	ld a, [wc09a]
	and a
	jr nz, .asm_24e

; restart the game if all four buttons are down
	ld a, [wJoypadDown]
	and BUTTONS
	cp A_BUTTON | B_BUTTON | SELECT | START
	jr nz, .asm_24e
	; restart game
	call Func_1002
	ld bc, SOUND_OFF
	call Func_ff4
	call Func_fbc
	jp Init

.asm_24e
	call MainSequenceTable

	ld a, [wced8]
	and a
	jr z, .asm_266
	farcall LoadAnimatedTiles

.asm_266
	ld a, [wced9]
	and a
	jr z, .asm_26f
	call Func_2a77

.asm_26f
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

Func_28d: ; 28d (0:28d)
	jp Init
; 0x290

; handle playing SFX and music
HandleSound: ; 290 (0:290)
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

	INCROM $02cf, $0334

; store in wVBlankFunc a return function
VBlank_Ret: ; 334 (0:334)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ret
.func_end

; store in wLCDFunc a return function
Func_341: ; 341 (0:341)
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

VBlank_354: ; 354 (0:354)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x370

WaitVBlank: ; 370 (0:370)
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
ClearWholeVirtualOAM: ; 37d (0:37d)
	ld hl, wVirtualOAM
	ld b, NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH
	xor a
	call WriteAToHL_BTimes
	xor a
	ld [wNumOAMSprites], a
	ret
; 0x38b

ClearBGMap0: ; 38b (0:38b)
	ld a, $ff
	jr FillBGMap0

; fills v0BGMap0 and v1BGMap0 with $7f
FillBGMap0_With7f: ; 38f (0:38f)
	ld a, $7f
	; fallthrough

; fills v0BGMap0 and v1BGMap0 with byte in a
FillBGMap0: ; 391 (0:391)
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

ClearBGMap1: ; 3ad (0:3ad)
	ld a, $ff
	ld hl, v0BGMap1
	ld bc, v0End - v0BGMap1
	call WriteAToHL_BCTimes
	ret
; 0x3b9

; clears wVirtualOAM, only up to the filled number of elements
ClearVirtualOAM: ; 3b9 (0:3b9)
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

UpdateJoypad: ; 3d8 (0:3d8)
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

PushOAM: ; 418 (0:418)
	ldh [rDMA], a
	ld a, NUM_SPRITE_OAM_STRUCTS
.loop
	dec a
	jr nz, .loop
	ret
.end
; 0x420

; writes a to address in hl, b times
WriteAToHL_BTimes: ; 420 (0:420)
	ld [hli], a
	dec b
	jr nz, WriteAToHL_BTimes
	ret
; 0x425

; write a to hl, bc times
WriteAToHL_BCTimes: ; 425 (0:425)
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
CopyHLToDE_BC: ; 434 (0:434)
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

	INCROM $443, $466

; copies b bytes from hl to de
CopyHLToDE: ; 466 (0:466)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, CopyHLToDE
	ret
; 0x46d

FadeBGToWhite_Normal: ; 46d (0:46d)
	ld a, FADE_SPEED_NORMAL
	ld [wFadeSpeed], a
	jr FadeBGToWhite

SlowFadeBGToWhite: ; 474 (0:474)
	ld a, FADE_SPEED_FAST
	ld [wFadeSpeed], a
	jr FadeBGToWhite

FastFadeToWhite: ; 47b (0:47b)
	xor a ; FADE_SPEED_SLOW
	ld [wFadeSpeed], a
	; fallthrough

FadeBGToWhite: ; 47f (0:47f)
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
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x54e

	INCROM $54e, $5df

DarkenBGToPal_Normal: ; 5df (0:5df)
	ld a, FADE_SPEED_NORMAL
	ld [wFadeSpeed], a
	jr DarkenBGToPal

DarkenBGToPal_Fast: ; 5e6 (0:5e6)
	ld a, FADE_SPEED_FAST
	ld [wFadeSpeed], a
	jr DarkenBGToPal

SlowFadeFromWhite: ; 5ed (0:5ed)
	xor a ; FADE_SPEED_SLOW
	ld [wFadeSpeed], a
	; fallthrough

; fades BG palettes to wTempPals1
; gradually darkens up to wTempPals1
DarkenBGToPal: ; 5f1 (0:5f1)
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
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x6fa

; fades BG palettes to wTempPals1
; gradually lightens up to wTempPals1
; when fading is complete, advances wSubSequence
FadeInTitle: ; 6fa (0:6fa)
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
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x7cf

	INCROM $7cf, $88d

VBlank_88d: ; 88d (0:88d)
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
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	call StoreBGPals
	call StoreOBPals
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
; 0x8bf

VBlank_8bf: ; 8bf (0:8bf)
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
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	call LoadBGPalettesFromWRAM
	call LoadOBPalettesFromWRAM
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
; 0x8e6

DisableLCD: ; 8e6 (0:8e6)
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
Decompress: ; 909 (0:909)
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

Func_928: ; 928 (0:928)
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
	ld a, [$d507]
	ld [$d504], a
	ld a, [$d508]
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
	ld hl, wSubSequence
	inc [hl]
	jr .asm_95a
; 0x9a3

Func_9a3: ; 9a3 (0:9a3)
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

VBlank_9cb: ; 9cb (0:9cb)
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
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
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

InitHRAMCallFunc: ; a92 (0:a92)
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
	call MainSequenceTable
	pop af
	bankswitch
	ret
.func_end
; 0xab5

Func_ab5: ; ab5 (0:ab5)
	ld a, [wceef]
	and $3c
	ret nz

	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wc0ac]
	bankswitch
	ld a, [wc0ad]
	ld h, a
	ld a, [wc0ae]
	ld l, a
	call Func_aee
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xaee

Func_aee: ; aee (0:aee)
	ld c, $a0
	ld de, s1a000
.asm_af3
	ld a, [hli]
	and a
	ret z
	bit 7, a
	jr nz, .asm_b23
	ld b, a
	ld a, [hli]
	ld [wc09f], a
.asm_aff
	ld a, [wc09f]
	ld [de], a
	inc de
	ld a, e
	cp c
	jr z, .asm_b0d

.asm_b08
	dec b
	jr nz, .asm_aff
	jr .asm_af3
.asm_b0d
	ld e, $00
	inc d
	ld a, d
	cp $c0
	jr nz, .asm_b21 ; can be .asm_b08
	ld d, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_b21
	jr .asm_b08

.asm_b23
	and $7f
	ld b, a
.asm_b26
	ld a, [hli]
	ld [de], a
	inc de
	ld a, e
	cp c
	jr z, .asm_b32
.asm_b2d
	dec b
	jr nz, .asm_b26
	jr .asm_af3

.asm_b32
	ld e, $00
	inc d
	ld a, d
	cp $c0
	jr nz, .asm_b2d
	ld d, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .asm_b2d
; 0xb48

Func_b48: ; b48 (0:b48)
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wc0ac]
	bankswitch
	ld a, [wc0ad]
	ld h, a
	ld a, [wc0ae]
	ld l, a
	call Func_b7b
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xb7b

Func_b7b: ; b7b (0:b7b)
	ld a, $a0
	srl a
	add $b0
	dec a
	ld c, a
	ld de, $a0b0
.asm_b86
	ld a, [hli]
	and a
	ret z
	bit 7, a
	jr nz, .asm_bb6
	ld b, a
	ld a, [hli]
	ld [wc09f], a
.asm_b92
	ld a, [wc09f]
	ld [de], a
	ld a, e
	cp c
	jr z, .asm_ba0
	inc de
.asm_b9b
	dec b
	jr nz, .asm_b92
	jr .asm_b86
.asm_ba0
	ld e, $b0
	inc d
	ld a, d
	cp $c0
	jr nz, .asm_bb4
	ld d, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_bb4
	jr .asm_b9b
.asm_bb6
	and $7f
	ld b, a
.asm_bb9
	ld a, [hli]
	ld [de], a
	ld a, e
	cp c
	jr z, .asm_bc5
	inc de
.asm_bc0
	dec b
	jr nz, .asm_bb9
	jr .asm_b86
.asm_bc5
	ld e, $b0
	inc d
	ld a, d
	cp $c0
	jr nz, .asm_bc0
	ld d, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .asm_bc0
; 0xbdb

Func_bdb: ; bdb (0:bdb)
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

Func_c19: ; c19 (0:c19)
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
	ld [wccf0], a
	ld a, l
	ld [wccf1], a
	ret
; 0xc4c

Func_c4c: ; c4c (0:c4c)
	ld a, [wc1a0]
	and a
	jr nz, .asm_c72
	xor a
	ld [MBC5SRamBank], a
	ld hl, wc0bc
	ld a, [wTempSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ld hl, wce6a
	ld bc, wce01
	jp wVBlankFunc + $10

.asm_c72
	ld hl, wc1a1
	ld a, [hli]
	ld [MBC5RomBank], a
	ld c, $51
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
	ld [wc1a0], a
	ld hl, wc0bc
	ld a, [wTempSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	xor a
	ld [wce00], a
	ld [wce69], a
	ret
; 0xcab

	INCROM $cab, $cb8

Func_cb8: ; cb8 (0:cb8)
	xor a
	ld [wce00], a
	ld [wce69], a
	ret
; 0xcc0

Func_cc0: ; cc0 (0:cc0)
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
	ld [wcced], a

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
	ld [wccee], a
	ld h, c
	ret
; 0xcf8

Func_cf8: ; cf8 (0:cf8)
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

Func_d3e: ; d3e (0:d3e)
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

Func_d81: ; d81 (0:d81)
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

Func_d8c: ; d8c (0:d8c)
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

Func_d9e: ; d9e (0:d9e)
	ld a, [wca8e]
	cp $06
	jr nz, .asm_db1
	ld hl, wca8d
	inc [hl]
	ld a, [hl]
	and $f2
	cp $f0
	jr z, .asm_db6
	ret

.asm_db1
	ld a, [wca8d]
	and a
	ret nz

.asm_db6
	ld a, [wOAMBank]
	ld [wc0ac], a
	ld a, [wROMBank]
	push af
	ld a, [wc0ac]
	bankswitch
	ld a, [wOAMPtr + 0]
	ld h, a
	ld a, [wOAMPtr + 1]
	ld l, a
	ld a, [wWarioScreenYPos]
	ld [wCurSpriteYOffset], a
	ld a, [wWarioScreenXPos]
	ld [wCurSpriteXOffset], a
	ld a, [wca65]
	ld [wCurSpriteFrame], a
	ld a, [wca66]
	ld [wCurSpriteAttributes], a
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0xdf4

; hl = sprite pointer
TryAddSprite: ; df4 (0:df4)
	ld a, [wCurSpriteFrame]
	ld d, $00
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	ld hl, wCurSpriteXOffset
	ld a, [hld]
	ld c, a    ; wCurSpriteXOffset
	ld a, [hld]
	ld b, a    ; wCurSpriteYOffset
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

UpdateAnimation: ; e53 (0:e53)
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

	ld a, [hl] ; wca68
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
	ld a, [hl] ; wca68
	add 2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a ; wFrameDuration
	ret

.finished
	xor a
	ld [hld], a ; wca68
	ld [hl], a ; wFrameDuration
	ld a, TRUE
	ld [wAnimationHasFinished], a
	ret
; 0xe87

Func_e87: ; e87 (0:e87)
	jp Init
; 0xe8a

Func_e8a: ; e8a (0:e8a)
	ld d, $00
	ld a, [wLevel]
	add a
	ld e, a
	rl d
	ld hl, PointerTable_c00be
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(PointerTable_c00be)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jr z, Func_e87

	ld a, [hli]
	ld [wc0ae], a
	ld a, [hli]
	ld [wc0ad], a
	ld a, [hl]
	ld [wc0ac], a
	push hl
	call Func_ab5
	pop hl
	ld a, [hli]
	ld [wc0ac], a
	ld a, [hli]
	ld [wc0ae], a
	ld a, [hl]
	ld [wc0ad], a
	pop af
	bankswitch

	push hl
	ld a, [wceef]
	and $3c
	jr nz, .asm_ed9
	call Func_b48
.asm_ed9
	pop hl
	ret
; 0xedb

Func_edb: ; edb (0:edb)
	ld d, $00
	ld a, [wLevel]
	add a
	ld e, a
	rl d
	ld hl, PointerTable_c00be
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(PointerTable_c00be)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jp z, Func_e87

	ld a, [hli]
	ld [wc0ae], a
	ld a, [hli]
	ld [wc0ad], a
	ld a, [hl]
	ld [wc0ac], a
	pop af
	bankswitch
	call Func_f13
	ret
; 0xf13

Func_f13: ; f13 (0:f13)
	ld a, [wceef]
	and $3c
	ret nz
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wc0ac]
	bankswitch
	ld a, [wc0ad]
	ld d, a
	ld a, [wc0ae]
	ld e, a
	call Func_f4c
	pop af
	bankswitch
	pop af
	sramswitch
	ret
; 0xf4c

Func_f4c: ; f4c (0:f4c)
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

InitAudio: ; fae (0:fae)
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
Func_fbc: ; fbc (0:fbc)
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
PlaySFX: ; fca (0:fca)
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

Func_fe6: ; fe6 (0:fe6)
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
Func_ff4: ; ff4 (0:ff4)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f1e
	pop af
	ldh [rSVBK], a
	ret
; 0x1002

Func_1002: ; 1002 (0:1002)
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
PlayNewMusic_SetNoise: ; 1062 (0:1062)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_PlayNewMusic_SetNoise
	pop af
	ldh [rSVBK], a
	ret
; 0x1070

Func_1070: ; 1070 (0:1070)
	load_sfx SFX_012
	ret
; 0x1079

Func_1079: ; 1079 (0:1079)
	ld a, [wca8e]
	cp $53
	call z, Func_10a7

	xor a
	ld [wca8c], a
	ld [wca8e], a
	ld [wca8f], a
	ld [wca92], a
	ld [wca93], a
	ld [wca94], a
	ld [wca8a], a
	ld [wca90], a
	ld [wca91], a
	ld [wca9b], a
	ld [wca8d], a
	ld [wca9c], a
	ret
; 0x10a7

Func_10a7: ; 10a7 (0:10a7)
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

Func_1146: ; 1146 (0:1146)
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
Func_114e: ; 114e (0:114e)
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

Func_1197: ; 1197 (0:1197)
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

Func_11ae: ; 11ae (0:11ae)
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
	load_sfx SFX_0E1
	ld a, $08
	ld [wc1aa], a
	ld a, $01
	ld [wca73], a
	xor a
	ld [wcac8], a
	ret
; 0x11d6

Func_11d6: ; 11d6 (0:11d6)
	ld a, c
	ld [wca78], a
	load_sfx SFX_0E1
	ld a, $04
	ld [wc1aa], a
	ld a, $01
	ld [wca73], a
	ld a, $80
	ld [wc1a9], a
	xor a
	ld [wcac8], a
	ret
; 0x11f6

Func_11f6: ; 11f6 (0:11f6)
	xor a
	ld [wca9a], a
	ld [wc1b1], a
	ld [wced9], a
	ld [wcee0], a
	ld [wcee1], a
	ld [wcee2], a
	ld [wcac3], a
	ld [wc0e6], a
	inc a
	ld [wca8a], a
	ld a, [wc0d7]
	bit 7, a
	ret nz
	ld hl, wSubSequence
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
	ld [$d508], a
	ld a, l
	ld [$d507], a
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

AddXOffset: ; 1259 (0:1259)
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

SubXOffset: ; 1270 (0:1270)
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
AddYOffset: ; 1287 (0:1287)
	ld a, [wc0c2]
	add b
	ld [wc0c2], a
;	fallthrough

Func_128e: ; 128e (0:128e)
	ld a, [wYPosLo]
	add b
	ld [wYPosLo], a
	ld a, [wYPosHi]
	adc 0
	ld [wYPosHi], a
	ret
; 0x129e

; b = y offset
SubYOffset: ; 129e (0:129e)
	ld a, [wc0c2]
	sub b
	ld [wc0c2], a
;	fallthrough

Func_12a5: ; 12a5 (0:12a5)
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
Func_12c3: ; 12c3 (0:12c3)
	ld hl, wcca0
	ld b, $42
	xor a
	call WriteAToHL_BTimes
	ret
; 0x12cd

CopyVRAMToWRAM: ; 12cd (0:12cd)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	ld a, [wTempSCY]
	ld [w3d500], a
	ld a, [wTempSCX]
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
	ld a, 4 ; WRAM4
	ldh [rSVBK], a
	ld hl, v0Tiles0
	ld de, w4d000
	ld bc, v0Tiles2 - v0Tiles0
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, 5 ; WRAM5
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
	ld a, 6 ; WRAM6
	ldh [rSVBK], a
	ld hl, v1Tiles0
	ld de, w6d000
	ld bc, v1Tiles2 - v1Tiles0
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, 7 ; WRAM7
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

	INCROM $1351, $142b

Func_142b: ; 142b (0:142b)
	ld a, $f0
	ld [wcee3], a
	farcall Func_461e
	ret
; 0x1440

	INCROM $1440, $145a

UpdateObjAnim: ; 145a (0:145a)
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

Func_1488: ; 1488 (0:1488)
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

Func_14de: ; 14de (0:14de)
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

Func_14f6: ; 14f6 (0:14f6)
	update_pos_y
;	fallthrough

Func_1501: ; 1501 (0:1501)
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

Func_151e: ; 151e (0:151e)
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

Func_1531: ; 1531 (0:1531)
	ld a, [wca86]
	cp $08
	jr c, Func_1554
	ld a, $04
	ld [wca86], a
	jr Func_1554
; 0x153f

Func_153f: ; 153f (0:153f)
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

Func_1554: ; 1554 (0:1554)
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

Func_156d: ; 156d (0:156d)
	jp Init
; 0x1570

Func_1570: ; 1570 (0:1570)
	call Func_1079
	ld a, $10
	ld [wca8c], a
	jr .asm_157d
.asm_157a
	call Func_1079
.asm_157d
	call Func_161a
	ld hl, Pals_c800
	call Func_1af6
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_159e
	farcall SetState_Idling
	jp Func_1070
.asm_159e
	farcall StartFall
	jp Func_1070
; 0x15b0

Func_15b0: ; 15b0 (0:15b0)
	ld a, [wca7b]
	ld [wc1a1], a
	ld a, [wca7c + 0]
	ld [wc1a2 + 0], a
	ld a, [wca7c + 1]
	ld [wc1a2 + 1], a

	ld a, $80
	ld [wc1a5], a
	ld a, $00
	ld [wc1a6], a
	ld a, $00
	ld [wc1a4], a
	ld a, $7f
	ld [wc1a7], a
	ld a, $01
	ld [wc1a0], a
	ret
; 0x15dc

Func_15dc: ; 15dc (0:15dc)
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_15ff
	ld a, [wcee3]
	cp $f1
	jr z, .asm_15ff
	cp $f2
	jr z, .asm_15ff
	cp $f3
	jr z, .asm_15ff
	ld a, [wca3d]
	and $01
	jr z, .asm_15ff
	ld a, [wca39]
	dec a
	jr z, .asm_1610
.asm_15ff
	ld a, [wSubSequence]
	ld [wced5], a
	ld a, MAIN_SEQTABLE_04
	ld [wSequence], a
	ld a, $18
	ld [wSubSequence], a
	ret
.asm_1610
	ld hl, wSequence
	ld [hl], MAIN_SEQTABLE_0d
	xor a
	ld [wSubSequence], a
	ret
; 0x161a

; loads a music ID to hMusicID, depending on wLevel
Func_161a: ; 161a (0:161a)
	ld a, [wcac3]
	and a
	jr nz, .boss_song
	ld a, [wca8e]
	and a
	jr nz, .asm_165d

	ld a, [wROMBank]
	push af
	ld a, BANK(LevelMusic)
	bankswitch
.asm_1632
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

.boss_song
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

.asm_165d
	ld a, [wca8e]
	and $1f
	ld d, $00
	add a
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
	jr z, .asm_1632
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

; clears wSequence and wSubSequence
Func_1690: ; 1690 (0:1690)
	xor a ; MAIN_SEQTABLE_TITLE
	ld [wSequence], a
	ld [wSubSequence], a
	ret
; 0x1698

; clears some SRAM stuff
Func_1698: ; 1698 (0:1698)
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

Func_16d0: ; 16d0 (0:16d0)
	ld hl, wSequence
	ld a, MAIN_SEQTABLE_07
	ld [hli], a
	ld [hl], $00 ; wSubSequence
	ret
; 0x16d9

Func_16d9: ; 16d9 (0:16d9)
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
IsOnSlipperyGround: ; 1700 (0:1700)
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

Func_1762: ; 1762 (0:1762)
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

	INCROM $1783, $1827

PalsWhite: ; 1827 (0:1827)
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

PalsBlack: ; 1867 (0:1867)
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

JumpVelTable_Normal: ; 18a7 (0:18a7)
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

JumpVelTable_HighJump: ; 18cf (0:18cf)
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

JumpVelTable_KnockBack: ; 18f7 (0:18f7)
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

JumpVelTable_BouncyJump: ; 191f (0:191f)
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

JumpVelTable_BouncyHighJump: ; 1947 (0:1947)
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

Data_196f: ; 196f (0:196f)
	db $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $03, $04, $04, $04, $04
; 0x198b

; treasure IDs of each level
LevelTreasureIDs: ; 198b (0:198b)
	db TREASURE_101, TREASURE_101, TREASURE_101, TREASURE_101
	db TREASURE_027, TREASURE_021, TREASURE_006, TREASURE_005
	db TREASURE_031, TREASURE_023, TREASURE_087, TREASURE_077
	db TREASURE_032, TREASURE_099, TREASURE_030, TREASURE_078
	db TREASURE_026, TREASURE_089, TREASURE_046, TREASURE_055
	db TREASURE_025, TREASURE_063, TREASURE_044, TREASURE_079
	db TREASURE_003, TREASURE_064, TREASURE_069, TREASURE_074
	db TREASURE_034, TREASURE_035, TREASURE_100, TREASURE_070
	db TREASURE_012, TREASURE_080, TREASURE_076, TREASURE_036
	db TREASURE_018, TREASURE_029, TREASURE_033, TREASURE_096
	db TREASURE_019, TREASURE_002, TREASURE_065, TREASURE_042
	db TREASURE_047, TREASURE_094, TREASURE_040, TREASURE_081
	db TREASURE_066, TREASURE_086, TREASURE_049, TREASURE_082
	db TREASURE_001, TREASURE_061, TREASURE_028, TREASURE_060
	db TREASURE_072, TREASURE_098, TREASURE_056, TREASURE_015
	db TREASURE_007, TREASURE_010, TREASURE_022, TREASURE_024
	db TREASURE_011, TREASURE_037, TREASURE_075, TREASURE_039
	db TREASURE_068, TREASURE_091, TREASURE_073, TREASURE_048
	db TREASURE_097, TREASURE_093, TREASURE_053, TREASURE_054
	db TREASURE_062, TREASURE_038, TREASURE_004, TREASURE_071
	db TREASURE_014, TREASURE_088, TREASURE_016, TREASURE_090
	db TREASURE_013, TREASURE_017, TREASURE_059, TREASURE_045
	db TREASURE_067, TREASURE_041, TREASURE_008, TREASURE_092
	db TREASURE_057, TREASURE_095, TREASURE_058, TREASURE_083
	db TREASURE_009, TREASURE_084, TREASURE_043, TREASURE_085
	db TREASURE_020, TREASURE_051, TREASURE_050, TREASURE_052
; 0x19f3

LoadBGPalettesFromWRAM: ; 19f3 (0:19f3)
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

LoadOBPalettesFromWRAM: ; 1a04 (0:1a04)
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
LoadPalsToTempPals1: ; 1a15 (0:1a15)
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
LoadPalsToTempPals2: ; 1a21 (0:1a21)
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
CopyHLToDE_Short: ; 1a2d (0:1a2d)
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, CopyHLToDE_Short
	ret
; 0x1a34

; copies hl to wTempPals2
Func_1a34: ; 1a34 (0:1a34)
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

EnableDoubleSpeed: ; 1a40 (0:1a40)
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
ClearVRAM: ; 1a64 (0:1a64)
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

ClearWRAM: ; 1a82 (0:1a82)
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
StoreBGPals: ; 1a9a (0:1a9a)
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
StoreOBPals: ; 1aad (0:1aad)
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
FillWhiteBGPal: ; 1ac0 (0:1ac0)
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
FillWhiteOBPal: ; 1ad1 (0:1ad1)
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

; hl = palette to copy from bank 3
Func_1af6: ; 1af6 (0:1af6)
	ld a, h
	ld [wca79 + 0], a
	ld a, l
	ld [wca79 + 1], a
	ld a, [wROMBank]
	push af
	ld a, $03
	bankswitch
	push hl
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, $03
	ldh [hCallFuncBank], a
	call_hram CopyHLToDE_Short
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

Func_1c4a: ; 1c4a (0:1c4a)
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

	INCROM $1c5b, $2800

LoadPermissionMap: ; 2800 (0:2800)
	ld a, [wPermissionMapID]
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
	ld a, [wPermissionMapID]
	cp NUM_PERMISSION_MAPS_GROUP_1 - 1
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

Func_285c: ; 285c (0:285c)
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
	add a
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
	jr nz, .asm_2893
	jp Init

.asm_2893
	pop af
	bankswitch

	ld a, [wLevel]
	cp $64
	jr nc, .asm_28af
	ld a, [wROMBank]
	push af
	ld a, $30
	bankswitch
	jr .asm_28bb
.asm_28af
	ld a, [wROMBank]
	push af
	ld a, $31
	bankswitch

.asm_28bb
	ld a, [wc0a0]
	add a
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld e, a
	ld h, [hl]
	ld l, e
	ld a, h
	cp $ff
	jr nz, .asm_28cf
	jp Init

.asm_28cf
	ld a, [hli]
	ld [wc0a1], a
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
	farcall Func_64000
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
	farcall Func_c0095
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

Func_298d: ; 298d (0:298d)
	ld a, [wPermissionMapID]
	add a
	ld e, a
	ld d, $00
	ld hl, PointerTable_c090d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0cf]
	ld [wc0ac], a
	ld a, [wROMBank]
	push af
	ld a, [wc0ac]
	bankswitch
	ld de, wc600
	ld bc, $200
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x29bf

LoadRoomTileMap: ; 29bf (0:29bf)
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
	ld [wc0ac], a
	ld bc, w3d300
	ld a, [wc0ac]
	ldh [hCallFuncBank], a
	call_hram Decompress
	ret
; 0x29e7

LoadRoomMainTiles: ; 29e7 (0:29e7)
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
	ld [wc0ac], a
	ld a, [wROMBank]
	push af
	ld a, [wc0ac]
	bankswitch
	ld de, v0Tiles2
	ld bc, $800
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x2a19

LoadRoomSpecialTiles: ; 2a19 (0:2a19)
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
	ld [wc0ac], a
	ld a, [wROMBank]
	push af
	ld a, [wc0ac]
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

LoadRoomPalettes: ; 2a52 (0:2a52)
	ld a, [wRoomPalettes]
	add a
	ld e, a
	ld d, $00
	ld hl, PalPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPaletteBank]
	ld [wc0ac], a
	ld a, [wc0ac]
	ldh [hCallFuncBank], a
	call_hram LoadPalsToTempPals1
	ret
; 0x2a77

Func_2a77: ; 2a77 (0:2a77)
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
	ld a, [wc1b2]
	ld h, a
	ld a, [wc1b2 + 1]
	ld l, a
	ld a, [wc1b4]
	inc a
	cp $08
	jr c, .asm_2aa6
	xor a
.asm_2aa6
	ld [wc1b4], a
	ld e, a
	ld d, $00
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(PalPointers)
	bankswitch
	ld d, $00
	ld a, [hl]
	add a
	ld e, a
	rl d
	ld hl, PalPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	bankswitch

	ld a, [wROMBank]
	push af
	ld a, BANK(Pals_cc000)
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

Func_3000: ; 3000 (0:3000)
	ld a, [wROMBank]
	push af
	ld a, [hl]
	swap a
	and $07
	or $60
	bankswitch
	ld l, e
	ld a, [hli]
	ld [wCurSpriteYOffset], a
	ld a, [hli]
	ld [wCurSpriteXOffset], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurSpriteFrame]
	ld d, $00
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wCurSpriteXOffset
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld b, a
	ld l, [hl]
	ld h, $cc
.asm_3036
	ld a, l
	cp $a0
	jr nc, .asm_3054
	ld a, [de]
	cp $80
	jr z, .asm_3054
	ld a, [de]
	add b
	ld [hli], a
	inc de
	ld a, [de]
	add c
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, l
	ld [wNumOAMSprites], a
	inc de
	jr .asm_3036
.asm_3054
	pop af
	bankswitch
	ret
; 0x305c

	INCROM $305c, $3104

Func_3104: ; 3104 (0:3104)
	ld hl, $d114
	ld a, [hld]
	sub $01
	ret nc
	ld a, [wROMBank]
	push af
	ld a, $1a
	bankswitch
	dec l
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl]
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr nz, .asm_312a
	ld a, [de]
.asm_312a
	ld [$d10f], a
	jr Func_312f.pop_af

Func_312f: ; 312f (0:312f)
	ld hl, $d114
	ld a, [hl]
	sub $01
	ld [hld], a
	ret nc
	ld a, [wROMBank]
	push af
	ld a, $1a
	bankswitch
	dec l
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl]
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .asm_3161
	ld [$d10f], a
	ld a, [hl]
	add $02
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a
	jr .pop_af
.asm_3161
	ld a, $02
	ld [hld], a
	ld a, [de]
	ld [$d10f], a
	inc de
	ld a, [de]
	ld [hl], a
.pop_af
	pop af
	bankswitch
	ret
; 0x3173

	INCROM $3173, $3a38

; hl = OAM data
; b = sprite bank
; de = pointer to sprite
Func_3a38: ; 3a38 (0:3a38)
	ld a, [hli]
	ld c, $10
	add c
	ld [wCurSpriteYOffset], a
	ld a, [hli]
	ld c, $08
	add c
	ld [wCurSpriteXOffset], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
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

Func_3a66: ; 3a66 (0:3a66)
	xor a
	ld [w2d024], a

	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [hl]
	sub $1
	ld [hli], a
	jr nc, .asm_3a92
	ld a, [hl]
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .asm_3aa2
	ld d, a
	ld a, [hl]

.asm_3a89
	add $02
	ld [hld], a
	inc bc
	ld a, [bc]
	dec a
	ld [hld], a
	dec l
	ld [hl], d

.asm_3a92
	ld a, $f8
	and l
	ld l, a
	ld b, h
	add $06
	ld c, a
	pop af
	bankswitch
	ret

.asm_3aa2
	ld [w2d024], a
	ld b, d
	ld c, e
	ld a, [de]
	ld d, a
	xor a
	jr .asm_3a89
; 0x3aac

Func_3aac: ; 3aac (0:3aac)
	ld hl, $d000
	ld e, a
	srl e
	srl e
	srl e
	ld d, $00
	add hl, de ; hl = $d000 + (a / 8)

	ld e, $01
	bit 2, a
	jr z, .asm_3ac1
	swap e
.asm_3ac1
	and $03
	ld d, a
	ld a, e
	jr z, .asm_3ad0
	rla
	dec d
	jr z, .asm_3ad0
	rla
	dec d
	jr z, .asm_3ad0
	rla
.asm_3ad0
	ld d, a
	and [hl]
	ret z
	ld a, $01
	scf
	ret
; 0x3ad7

	INCROM $3ad7, $3b42

; copies c * $100 bytes from bank b
; at address hl to de
CopyFarBytes: ; 3b42 (0:3b42)
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

LoadFarTiles: ; 3b5b (0:3b5b)
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

Func_3b93: ; 3b93 (0:3b93)
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	ret
; 0x3b98

	INCROM $3b98, $3bb8

LoadFarPalsToTempPals1: ; 3bb8 (0:3bb8)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals1
	pop af
	bankswitch
	ret
; 0x3bce

LoadFarPalsToTempPals2: ; 3bce (0:3bce)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals2
	pop af
	bankswitch
	ret
; 0x3be4

Func_3be4: ; 3be4 (0:3be4)
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

	INCROM $3c03, $3c4f

AddOffsetInPointerTable: ; 3c4f (0:3c4f)
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
GetPointerFromTableHL: ; 3c58 (0:3c58)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 0x3c5f

; same as GetPointerFromTableHL
; but outputs pointer to de
GetPointerFromTableDE: ; 3c5f (0:3c5f)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 0x3c66

	INCROM $3c66, $3f00

DoAudioFunc_InitAudio: ; 3f00 (0:3f00)
	call BackupBankAndSwitchToAudioBank
	jp _InitAudio
; 0x3f06

Func_3f06: ; 3f06 (0:3f06)
	call Func_3f75
	jp Func_3007a
; 0x3f0c

DoAudioFunc_PlaySFX: ; 3f0c (0:3f0c)
	call Func_3f62
	jp _PlaySFX
; 0x3f12

	INCROM $3f12, $3f18

Func_3f18: ; 3f18 (0:3f18)
	call Func_3f62
	jp Func_302b8
; 0x3f1e

Func_3f1e: ; 3f1e (0:3f1e)
	call Func_3f62
	jp Func_303c9
; 0x3f24

Func_3f24: ; 3f24 (0:3f24)
	call Func_3f62
	jp Func_30416
; 0x3f2a

	INCROM $3f2a, $3f48

DoAudioFunc_PlayNewMusic_SetNoise: ; 3f48 (0:3f48)
	call Func_3f62
	jp _PlayNewMusic_SetNoise
; 0x3f4e

BackupBankAndSwitchToAudioBank: ; 3f4e (0:3f4e)
	ld a, [wROMBank]
	ld [wAudioBankBackup], a
;	fallthrough

SwitchToAudioBank: ; 3f54 (0:3f54)
	ld a, BANK("Audio Engine")

.switch_bank
	ld [wROMBank], a
	ld [MBC5RomBank - $100], a
	ret

SwitchBackFromAudioBank: ; 3f5d (0:3f5d)
	ld a, [wAudioBankBackup]
	jr SwitchToAudioBank.switch_bank
; 0x3f62

Func_3f62: ; 3f62 (0:3f62)
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

Func_3f75: ; 3f75 (0:3f75)
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

Func_3f8d: ; 3f8d (0:3f8d)
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

ReadAudioCommands_1Byte: ; 3faa (0:3faa)
	ld a, [wSoundBank]
	call SwitchToAudioBank.switch_bank
	ld a, [de]
	ld c, a
	jp SwitchToAudioBank
; 0x3fb5

ReadAudioCommands_2Bytes: ; 3fb5 (0:3fb5)
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
