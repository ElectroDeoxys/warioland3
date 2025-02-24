InitAudio::
	push_wram BANK("Audio RAM")
	call AudioFunc_InitAudio
	pop_wram
	ret

; bc = sound ID
Func_fbc::
	push_wram BANK("Audio RAM")
	call Func_3f06
	pop_wram
	ret

; bc = sound ID
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

; bc = sound ID
PlayNewMusic::
	push_wram BANK("Audio RAM")
	call AudioFunc_PlayNewMusic
	pop_wram
	ret

; bc = sound ID
Func_ff4::
	push_wram BANK("Audio RAM")
	call Func_3f1e
	pop_wram
	ret

Func_1002::
	push_wram BANK("Audio RAM")
	call Func_3f24
	pop_wram
	ret

; unreferenced
Func_1010:
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	call Func_3f2a
	pop af
	ldh [rSMBK], a
	ret

; unreferenced
Func_101e:
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	call Func_3f30
	pop af
	ldh [rSMBK], a
	ret

Func_102c::
	ldh [hffac], a
	push_wram BANK("Audio RAM")
	ldh a, [hffac]
	call Func_3f36
	pop_wram
	ret

; unreferenced
Func_103e:
	ldh [hffac], a
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	ldh a, [hffac]
	call Func_3f3c
	pop af
	ldh [rSMBK], a
	ret

; unreferenced
Func_1050:
	ldh [hffac], a
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	ldh a, [hffac]
	call Func_3f42
	pop af
	ldh [rSMBK], a
	ret

; bc = sound ID
PlayNewMusic_SetNoise::
	push_wram BANK("Audio RAM")
	call AudioFunc_PlayNewMusic_SetNoise
	pop_wram
	ret
