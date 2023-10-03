DoAudioFunc_InitAudio:
	call BackupBankAndSwitchToAudioBank
	jp _InitAudio

Func_3f06:
	call Func_3f75
	jp Func_3007a

DoAudioFunc_PlaySFX:
	call Func_3f62
	jp _PlaySFX

Func_3f12:
	call Func_3f62
	jp PlayMusic

Func_3f18::
	call Func_3f62
	jp Func_302b8

Func_3f1e:
	call Func_3f62
	jp Func_303c9

Func_3f24:
	call Func_3f62
	jp Func_30416

Func_3f2a:
	call Func_3f62
	jp _PlayNewMusic_SetNoise.asm_302e4

Func_3f30:
	call Func_3f62
	jp Func_30438

Func_3f36:
	call Func_3f62
	jp Func_3049e

Func_3f3c:
	call Func_3f62
	jp Func_30519

Func_3f42:
	call Func_3f62
	jp Func_30449

DoAudioFunc_PlayNewMusic_SetNoise::
	call Func_3f62
	jp _PlayNewMusic_SetNoise

BackupBankAndSwitchToAudioBank::
	ld a, [wROMBank]
	ld [wAudioBankBackup], a
;	fallthrough

SwitchToAudioBank::
	ld a, BANK("Audio Engine")
.switch_bank
	ld [wROMBank], a
	ld [rROMB0], a
	ret

SwitchBackFromAudioBank::
	ld a, [wAudioBankBackup]
	jr SwitchToAudioBank.switch_bank

Func_3f62:
	ld hl, wAudioEngineFlags
	bit AUDIOENG_UNK7_F, [hl]
	jr nz, .pop_hl
.asm_3f69
	set AUDIOENG_UNK7_F, [hl]
	push af
	call BackupBankAndSwitchToAudioBank
	pop af
	ret
.pop_hl
	pop hl
	ld a, $ff
	ret

Func_3f75::
	ld hl, wAudioEngineFlags
	bit AUDIOENG_UNK7_F, [hl]
	jr z, Func_3f62.asm_3f69
	bit AUDIOENG_HAS_CALLBACK_F, [hl]
	jr nz, Func_3f62.pop_hl
	set AUDIOENG_HAS_CALLBACK_F, [hl]

	; pop calling function from the stack
	; and store the it in WRAM
	pop hl
	ld a, h
	ld [wAudioBankCallback + 1], a
	ld a, l
	ld [wAudioBankCallback + 0], a
	xor a
	ret

Func_3f8d::
	ld hl, wAudioEngineFlags
	bit AUDIOENG_HAS_CALLBACK_F, [hl]
	jr nz, .push_callback
	call SwitchBackFromAudioBank
	res AUDIOENG_UNK7_F, [hl]
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
	res AUDIOENG_HAS_CALLBACK_F, [hl]
	ret

ReadAudioCommands_1Byte::
	ld a, [wSoundBank]
	call SwitchToAudioBank.switch_bank
	ld a, [de]
	ld c, a
	jp SwitchToAudioBank

ReadAudioCommands_2Bytes::
	ld a, [wSoundBank]
	call SwitchToAudioBank.switch_bank
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	jp SwitchToAudioBank
