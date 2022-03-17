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

Func_3f18:: ; 3f18 (0:3f18)
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

	INCROM $3f2a, $3f36

Func_3f36: ; 3f36 (0:3f36)
	call Func_3f62
	jp Func_3049e
; 0x3f3c

	INCROM $3f3c, $3f48

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
