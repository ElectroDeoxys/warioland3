AudioFunc_InitAudio:
	call BackupBankAndSwitchToAudioBank
	jp _InitAudio

AudioFunc_UpdateAudio:
	call PrepareAudioJump_WithCallback
	jp _UpdateAudio

AudioFunc_PlaySFX:
	call PrepareAudioJump_NoCallback
	jp _PlaySFX

Func_3f12:
	call PrepareAudioJump_NoCallback
	jp PlayMusic

AudioFunc_PlayNewMusic::
	call PrepareAudioJump_NoCallback
	jp _PlayNewMusic

AudioFunc_TurnOffSFXID:
	call PrepareAudioJump_NoCallback
	jp _TurnOffSFXID

AudioFunc_TurnMusicOff:
	call PrepareAudioJump_NoCallback
	jp _TurnMusicOff

Func_3f2a:
	call PrepareAudioJump_NoCallback
	jp Func_302e4

Func_3f30:
	call PrepareAudioJump_NoCallback
	jp Func_30438

AudioFunc_ExecuteAudioMod:
	call PrepareAudioJump_NoCallback
	jp _ExecuteAudioMod

Func_3f3c:
	call PrepareAudioJump_NoCallback
	jp Func_30519

AudioFunc_GetPlayingSoundID:
	call PrepareAudioJump_NoCallback
	jp _GetPlayingSoundID

AudioFunc_PlayNewMusic_SetNoise::
	call PrepareAudioJump_NoCallback
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
PrepareAudioJump_NoCallback:
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

; same as PrepareAudioJump_NoCallback but can additionally
; use wAudioBankCallback in case backup bank is already set
PrepareAudioJump_WithCallback::
	ld hl, wAudioEngineFlags
	bit AUDIOENG_HAS_BACKUP_BANK_F, [hl]
	jr z, PrepareAudioJump_NoCallback.backup
	bit AUDIOENG_HAS_CALLBACK_F, [hl]
	jr nz, PrepareAudioJump_NoCallback.pop_stack
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

; expects functions called after PrepareAudioJump_NoCallback
; or PrepareAudioJump_WithCallback to jump to this routine
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
