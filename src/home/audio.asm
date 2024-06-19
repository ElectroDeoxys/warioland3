AudioFunc_InitAudio:
	call BackupBankAndSwitchToAudioBank
	jp _InitAudio

Func_3f06:
	call Func_3f75
	jp Func_3007a

AudioFunc_PlaySFX:
	call PrepareAudioJump
	jp _PlaySFX

Func_3f12:
	call PrepareAudioJump
	jp PlayMusic

AudioFunc_PlayNewMusic::
	call PrepareAudioJump
	jp _PlayNewMusic

Func_3f1e:
	call PrepareAudioJump
	jp Func_303c9

Func_3f24:
	call PrepareAudioJump
	jp Func_30416

Func_3f2a:
	call PrepareAudioJump
	jp Func_302e4

Func_3f30:
	call PrepareAudioJump
	jp Func_30438

Func_3f36:
	call PrepareAudioJump
	jp Func_3049e

Func_3f3c:
	call PrepareAudioJump
	jp Func_30519

Func_3f42:
	call PrepareAudioJump
	jp Func_30449

AudioFunc_PlayNewMusic_SetNoise::
	call PrepareAudioJump
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

; prepares jumping into a function in the Audio Engine
; checks if there's a backup bank to switch after the function returns:
; - if there is already, pop the stack and return
; (skips the rest of the caller's instructions)
; - if not, then calls BackupBankAndSwitchToAudioBank and returns
PrepareAudioJump:
	ld hl, wAudioEngineFlags
	bit AUDIOENG_HAS_BACKUP_BANK_F, [hl]
	jr nz, .pop_stack
.backup
	set AUDIOENG_HAS_BACKUP_BANK_F, [hl]
	push af
	call BackupBankAndSwitchToAudioBank
	pop af
	ret
.pop_stack
	pop hl
	ld a, $ff
	ret

Func_3f75::
	ld hl, wAudioEngineFlags
	bit AUDIOENG_HAS_BACKUP_BANK_F, [hl]
	jr z, PrepareAudioJump.backup
	bit AUDIOENG_HAS_CALLBACK_F, [hl]
	jr nz, PrepareAudioJump.pop_stack
	set AUDIOENG_HAS_CALLBACK_F, [hl]

	; pop calling function from the stack
	; and store it in WRAM
	pop hl
	ld a, h
	ld [wAudioBankCallback + 1], a
	ld a, l
	ld [wAudioBankCallback + 0], a
	xor a
	ret

; expects functions called after PrepareAudioJump to jump to this routine
ReturnFromAudioJump::
	ld hl, wAudioEngineFlags
	bit AUDIOENG_HAS_CALLBACK_F, [hl]
	jr nz, .push_callback
	call SwitchBackFromAudioBank
	res AUDIOENG_HAS_BACKUP_BANK_F, [hl]
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
