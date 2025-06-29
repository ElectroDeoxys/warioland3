InitAudio::
	push_wram BANK("Audio RAM")
	call AudioFunc_InitAudio
	pop_wram
	ret

UpdateAudio::
	push_wram BANK("Audio RAM")
	call AudioFunc_UpdateAudio
	pop_wram
	ret

; input:
; - bc = sound ID
PlaySFX::
	push_wram BANK("Audio RAM")
	call AudioFunc_PlaySFX
	pop_wram
	ret

; unreferenced
Func_fd8:
	push_wram BANK("Audio RAM")
	call Func_3f12
	pop_wram
	ret

; input:
; - bc = sound ID
PlayNewMusic::
	push_wram BANK("Audio RAM")
	call AudioFunc_PlayNewMusic
	pop_wram
	ret

; turns off all SFX channels playing
; SFX ID given by bc
; if bc = SOUND_OFF, then turn off all SFX
; only ever used to switch SFX off (SOUND_OFF)
; input:
; - bc = sound ID
TurnOffSFXID::
	push_wram BANK("Audio RAM")
	call AudioFunc_TurnOffSFXID
	pop_wram
	ret

TurnMusicOff::
	push_wram BANK("Audio RAM")
	call AudioFunc_TurnMusicOff
	pop_wram
	ret

; unreferenced
Func_1010:
	push_wram BANK("Audio RAM")
	call Func_3f2a
	pop_wram
	ret

; unreferenced
Func_101e:
	push_wram BANK("Audio RAM")
	call Func_3f30
	pop_wram
	ret

; input:
; - a = ?
; - b = ?
; - d = ?
; - e = ?
Func_102c::
	ldh [hffac], a
	push_wram BANK("Audio RAM")
	ldh a, [hffac]
	call Func_3f36
	pop_wram
	ret

; unreferenced
; input:
; - a = ?
Func_103e:
	ldh [hffac], a
	push_wram BANK("Audio RAM")
	ldh a, [hffac]
	call Func_3f3c
	pop_wram
	ret

; unreferenced
Func_1050:
	ldh [hffac], a
	push_wram BANK("Audio RAM")
	ldh a, [hffac]
	call Func_3f42
	pop_wram
	ret

; input:
; - bc = sound ID
PlayNewMusic_SetNoise::
	push_wram BANK("Audio RAM")
	call AudioFunc_PlayNewMusic_SetNoise
	pop_wram
	ret
