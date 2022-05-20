_InitAudio:: ; 30000 (c:4000)
	ld a, $ff
	ld [wAudioEngineFlags], a

	ld a, [wAudioBankBackup]
	push af
	ld hl, wAudioBankBackup
	ld b, $3f
	xor a
.loop_clear
	ld [hli], a
	dec b
	jr nz, .loop_clear
	pop af
	ld [wAudioBankBackup], a

	ld a, $4a
	ld [wSFXTempo], a
	ld [w3d007], a
	ld [wMusicTempo], a
	ld [w3d00c], a

	ld a, $40
	ld [w3d006], a
	ld [w3d00b], a

	ld a, $ff
	ld [wCurWaveSample], a

; clear all channel structs
	xor a
	ld b, NUM_CHANNELS
	ld de, CHANNEL_STRUCT_LENGTH
	ld hl, wChannels
.loop_chs
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop_chs

; clear all tracks
	xor a
	ld b, NUM_TRACKS
	ld de, TRACK_STRUCT_LENGTH
	ld hl, wTracks
.loop_tracks
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop_tracks

	ld a, %10000000 ; all chs off
	ldh [rNR52], a
	ld a, $00
	ldh [rNR51], a
	ld a, %1000
	ldh [rNR12], a
	ldh [rNR22], a
	ldh [rNR42], a
	ld a, $80
	ldh [rNR14], a
	ldh [rNR24], a
	ldh [rNR44], a
	ld a, $00
	ldh [rNR30], a
	ld a, $ff
	ldh [rNR51], a
	ld a, MAX_VOLUME
	ldh [rNR50], a
	ld a, $00
	ld [wAudioEngineFlags], a

	jp SwitchBackFromAudioBank
; 0x3007a

Func_3007a:: ; 3007a (c:407a)
	push bc
	push de
	call Func_30527

	ld hl, wAudioEngineFlags
	set 5, [hl]

	ld hl, w3d007
	ld a, [hli]
	add [hl]
	ld [hli], a ; w3d008
	ld a, 0
	adc [hl]
	ld [hld], a
	ld a, [hli] ; w3d008
	sub $4a
	ld b, a
	ld a, [hl]
	sbc 0
	jr nc, .asm_300a4

	call SetSFXChannels
.loop_chs_1
	call Func_30547
	call NextChannel
	jr nz, .loop_chs_1
	jr .asm_300c8

.asm_300a4
	ld [hld], a
	ld [hl], b

	call SetAllTracks
.loop_tracks
	call Func_30bb0
	call NextTrack
	jr nz, .loop_tracks

	call SetSFXChannels
.loop_chs_2
	call UpdateChannel
	call NextChannel
	jr nz, .loop_chs_2

	ld hl, w3d008
	ld a, [hli]
	sub $4a
	ld b, a
	ld a, [hl]
	sbc 0
	jr nc, .asm_300a4

.asm_300c8
	ld hl, wAudioEngineFlags
	res 5, [hl]
	ld hl, w3d00c
	ld a, [hli]
	add [hl]
	ld [hli], a
	ld a, 0
	adc [hl]
	ld [hld], a
	ld a, [hli]
	sub $4a
	ld b, a
	ld a, [hl]
	sbc 0
	jr nc, .asm_300ed

	call SetMusicChannels
.asm_300e3
	call Func_30547
	call NextChannel
	jr nz, .asm_300e3
	jr .asm_30111

.asm_300ed
	ld [hld], a
	ld [hl], b

	call SetAllTracks
.asm_300f2
	call Func_30bc2
	call NextTrack
	jr nz, .asm_300f2

	call SetMusicChannels
.asm_300fd
	call UpdateChannel
	call NextChannel
	jr nz, .asm_300fd

	ld hl, w3d00d
	ld a, [hli]
	sub $4a
	ld b, a
	ld a, [hl]
	sbc 0
	jr nc, .asm_300ed

.asm_30111
	call SetAllTracks
.asm_30114
	call Func_30bfb
	call NextTrack
	jr nz, .asm_30114

	ld a, [w3d01a]
	and a
	jr nz, .asm_30124
	ld a, $0f
.asm_30124
	dec a
	ld [w3d01a], a

; get active channels
	ld c, NUM_CHANNELS
	ld de, CHANNEL_STRUCT_LENGTH
	ld hl, wChannels
.loop_chs
	ld a, [hl]
	and CHANNEL_FLAGS_ACTIVE | CHANNEL_FLAGS_6 | CHANNEL_FLAGS_5 | CHANNEL_FLAGS_4 | CHANNEL_FLAGS_3
	ld [hl], a
	rla
	rr b
	add hl, de
	dec c
	jr nz, .loop_chs
	ld a, b
	ld [wActiveChannels], a
	pop de
	pop bc
	jp Func_3f8d
; 0x30144

SetSFXChannels: ; 30144 (c:4144)
	ld de, wChannels
	ld a, NUM_SFX_CHANS
	jr SetAudioChannels

SetMusicChannels: ; 3014b (c:414b)
	ld de, wMusicChannels
	ld a, NUM_MUSIC_CHANS
	jr SetAudioChannels

	ld de, wChannel1
	ld a, NUM_CHANNELS
	; fallthrough

SetAudioChannels: ; 30157 (c:4157)
	ld hl, wNumAudioChannels
	ld [hli], a
	ld a, e
	ld [hli], a ; wCurChannelPtr
	ld [hl], d
	ret
; 0x3015f

; adds CHANNEL_STRUCT_LENGTH to wCurChannelPtr
; to point to the next channel
; decrements wNumAudioChannels
NextChannel: ; 3015f (c:415f)
	ld hl, wNumAudioChannels
	dec [hl]
	ret z
	inc hl ; wCurChannelPtr
	ld a, CHANNEL_STRUCT_LENGTH
	add [hl]
	ld [hli], a
	ld a, 0
	adc [hl]
	ld [hl], a
	rra
	ret
; 0x3016f

SetTrack1: ; 3016f (c:416f)
	ld de, wTrack1
	ld a, 1
	ld c, LOW(rNR12)
	jr SetTrack

SetTrack2: ; 30178 (c:4178)
	ld de, wTrack2
	ld a, 1
	ld c, LOW(rNR22)
	jr SetTrack

SetTrack3: ; 30181 (c:4181)
	ld de, wTrack3
	ld a, 1
	ld c, LOW(rNR32)
	jr SetTrack

SetTrack4: ; 3018a (c:418a)
	ld de, wTrack4
	ld a, 1
	ld c, LOW(rNR42)
	jr SetTrack

SetAllTracks: ; 30193 (c:4193)
	ld de, wTrack1
	ld a, NUM_TRACKS
	ld c, LOW(rNR12)
	; fallthrough

; a = number of tracks
; de = pointer to first track
; c = sound register for this track
SetTrack: ; 3019a (c:419a)
	ld hl, wNumTracks
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hl], c
	ret
; 0x301a4

NextTrack: ; 301a4 (c:41a4)
	ld hl, wNumTracks
	dec [hl]
	ret z
	inc hl
	ld a, TRACK_STRUCT_LENGTH
	add [hl]
	ld [hli], a
	ld a, 0
	adc [hl]
	ld [hli], a
	ld a, [hl]
	add $5
	ld [hl], a
	rra
	ret
; 0x301b8

; bc = sound ID
_PlaySFX:: ; 301b8 (c:41b8)
	ld a, b
	or c
	jp z, TurnSFXOff
	call GetSound

	ld a, [wStartChannel]
	bit 7, a
	jr nz, .asm_30211 ; jump never taken

	ld b, a
	sub CHAN5
	jr nc, .done_1
	cpl
	inc a
	ld [wNumAudioChannels], a

	ld hl, wChannels
	ld a, b
	and a
	jr z, .got_ch_ptr
	ld de, CHANNEL_STRUCT_LENGTH
.loop_chs
	add hl, de
	dec b
	jr nz, .loop_chs
.got_ch_ptr
	ld a, l
	ld [wCurChannelPtr + 0], a
	ld a, h
	ld [wCurChannelPtr + 1], a
	jr .asm_301f1

.loop_1
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
.asm_301f1
	bit CHANNEL_FLAGS_ACTIVE_F, [hl]
	jr z, .load_to_channel
	ld bc, CHANNEL_PRIORITY
	add hl, bc
	ld a, [wSoundPriority]
	cp [hl]
	jr nc, .load_to_channel
	; lower priority, ignore
	call SkipLoadingChannel
	jr .skip_load_to_channel
.load_to_channel
	call LoadChannelWithSound
.skip_load_to_channel
	jr z, .done_1
	call NextChannel
	jr nz, .loop_1

.done_1
	jp Func_3f8d

.asm_30211
	call SetSFXChannels
	ld a, $1
	ld [w3d03b], a
	xor a
	ld [w3d03a], a
.loop_2
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	bit CHANNEL_FLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
	jr nz, .active_ch
	call LoadChannelWithSound
	jr z, .done_2
	ld a, [w3d03b]
	ld b, a
	ld a, [w3d03a]
	or b
	ld [w3d03a], a
.active_ch
	ld a, [w3d03b]
	sla a
	ld [w3d03b], a
	call NextChannel
	jr nz, .loop_2

	call SetSFXChannels
	ld a, $1
	ld [w3d03b], a
.loop_3
	ld a, [w3d03b]
	ld b, a
	ld a, [w3d03a]
	and b
	jr nz, .asm_3026f

	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_PRIORITY
	add hl, bc
	ld a, [wSoundPriority]
	cp [hl]
	jr c, .asm_3026f
	call LoadChannelWithSound
	jr z, .done_2
.asm_3026f
	ld a, [w3d03b]
	sla a
	ld [w3d03b], a
	call NextChannel
	jr nz, .loop_3

.done_2
	jp Func_3f8d
; 0x3027f

; bc = sound ID
PlayMusic: ; 3027f (c:427f)
	ld a, b
	or c
	jp z, Func_30416
	ld a, c
	ld [wLoadedMusic + 0], a
	ld a, b
	ld [wLoadedMusic + 1], a
	xor a
	ld [w3d020], a
	xor a
	ld [w3d025], a
	call GetSound

; init noise channels
	call SetMusicChannels
.loop_noise_chs
	call LoadChannelWithSound
	jr z, .next_music_ch
	call NextChannel
	jr nz, .loop_noise_chs
	jr .done

; reset music channels
.loop_music_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	xor a
	ld [hl], a
.next_music_ch
	call NextChannel
	jr nz, .loop_music_chs

.done
	jp Func_3f8d
; 0x302b8

; bc = sound ID
Func_302b8:: ; 302b8 (c:42b8)
	ld a, [wLoadedMusic + 0]
	cp c
	jr nz, PlayMusic
	ld a, [wLoadedMusic + 1]
	cp b
	jr nz, PlayMusic
	ld a, [wActiveChannels]
	and (1 << CHAN5) | (1 << CHAN6) | (1 << CHAN7) | (1 << CHAN8)
	jr z, PlayMusic
	jp Func_3f8d
; 0x302ce

; plays music if different from the one currently playing
; if the ID is the same, then set flag in noise channels
; bc = sound ID
_PlayNewMusic_SetNoise:: ; 302ce (c:42ce)
; only start playing music if it's not
; the same as the loaded one
	ld a, [wLoadedMusic + 0]
	cp c
	jr nz, PlayMusic
	ld a, [wLoadedMusic + 1]
	cp b
	jr nz, PlayMusic

; same as wLoadedMusic
	ld a, [wActiveChannels]
	and (1 << CHAN5) | (1 << CHAN6) | (1 << CHAN7) | (1 << CHAN8)
	jr z, .asm_302e4
	jp Func_3f8d

.asm_302e4
	xor a
	ld [w3d025], a
	call SetMusicChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl]
	and CHANNEL_FLAGS_6 | CHANNEL_FLAGS_5 ; CHANNEL_FLAGS
	jr z, .next_ch
	set CHANNEL_FLAGS_ACTIVE_F, [hl]
.next_ch
	call NextChannel
	jr nz, .loop_chs
	jp Func_3f8d
; 0x30302

; loads the sound data of wCurSoundID
; bc = sound ID
GetSound: ; 30302 (c:4302)
; check if sound ID is within the valid values
	ld a, b
	ld [wCurSoundID + 1], a
	cp HIGH(NUM_SOUNDS)
	ld a, c
	jr z, .check_low_byte
	jr c, .ok
.invalid_sound
	pop hl
	jp Func_3f8d
.check_low_byte
	cp LOW(NUM_SOUNDS)
	jr nc, .invalid_sound

.ok
; get pointer to its header data
	ld [wCurSoundID + 0], a
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl ; *8
	ld bc, SoundHeaders - $8
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld a, [hli]
	ld [wSoundBank], a
	inc hl
	ld a, [hli]
	ld [wSoundPriority], a
	ld a, [hli]
	ld [wStartChannel], a
	ld a, [hl]
	ld [wNumChannels], a
	inc de
	inc de
	ld a, e
	ld [wAudioCmdPtr + 0], a
	ld a, d
	ld [wAudioCmdPtr + 1], a
	ret
; 0x30341

LoadChannelWithSound: ; 30341 (c:4341)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, CHANNEL_FLAGS_ACTIVE | CHANNEL_FLAGS_5
	ld [hli], a ; CHANNEL_FLAGS
	inc hl
	ld a, [wAudioCmdPtr + 0]
	ld [hli], a ; CHANNEL_CMD_PTR
	ld a, [wAudioCmdPtr + 1]
	ld [hli], a
	ld a, [wSoundBank]
	ld [hli], a ; CHANNEL_SOUND_BANK
	inc hl
	ld a, [wCurSoundID + 0]
	ld [hli], a ; CHANNEL_SOUND_ID
	ld a, [wCurSoundID + 1]
	ld [hli], a
	ld a, [wSoundPriority]
	ld [hli], a ; CHANNEL_PRIORITY
	; fallthrough

; decrements wNumChannels
; and advances wAudioCmdPtr to the next pointer
SkipLoadingChannel: ; 30366 (c:4366)
	ld hl, wNumChannels
	dec [hl]
	ret z
	ld hl, wAudioCmdPtr
	ld a, $2
	add [hl]
	ld [hli], a
	ld a, 0
	adc [hl]
	ld [hl], a
	rra ; reset z
	ret
; 0x30378

InitChannel: ; 30378 (c:4378)
	ld a, %11000000
	ld [hli], a
	xor a
	ld [hli], a ; CHANNEL_DURATION
	ld a, [hli] ; CHANNEL_CMD_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hld] ; CHANNEL_SOUND_BANK
	ld [wSoundBank], a
	call ReadAudioCommands_2Bytes
	ld a, b
	ld [hld], a
	ld [hl], c ; CHANNEL_CMD_PTR
	ld bc, CHANNEL_PITCH - CHANNEL_CMD_PTR
	add hl, bc
	xor a
	ld [hli], a ; CHANNEL_PITCH
	ld [hli], a ; CHANNEL_UNK_0A
	ld [hli], a ; CHANNEL_UNK_0B
	ld [hli], a ; CHANNEL_TIMBRE
	ld [hli], a ; CHANNEL_LENGTH
	ld [hli], a ; CHANNEL_SWEEP
	ld a, $ff
	ld [hli], a ; CHANNEL_FADE_IN_SPEED
	ld [hli], a ; CHANNEL_FADE_OUT_SPEED
	xor a
	ld [hli], a ; CHANNEL_ACTIVE_COMMAND
	ld [hli], a ; CHANNEL_PITCH_OFFSET
	ld [hli], a ; CHANNEL_UNK_13
	ld [hli], a
	ld a, $ff
	ld [hli], a ; CHANNEL_UNK_15
	ld a, $40
	ld [hli], a ; CHANNEL_UNK_16
	xor a
	ld [hli], a ; CHANNEL_SO1
	ld [hli], a ; CHANNEL_SO2
	ld [hli], a ; CHANNEL_UNK_19
	ld a, $02
	ld [hli], a ; CHANNEL_UNK_1A
	xor a
	ld [hli], a ; CHANNEL_UNK_1B
	ld [hli], a
	ld [hli], a ; CHANNEL_UNK_1D
	ld [hli], a ; CHANNEL_UNK_2E
	ld a, $17
	ld [hli], a ; CHANNEL_VIBRATO_SPEED
	xor a
	ld [hli], a ; CHANNEL_UNK_VIBRATO_VALUE
	ld [hli], a ; CHANNEL_VIBRATO_AMPLITUDE
	ld [hli], a ; CHANNEL_UNK_22
	ld [hli], a ; CHANNEL_VIBRATO_DISABLED
	ld [hli], a ; CHANNEL_UNK_24
	ld [hli], a
	ld [hli], a ; CHANNEL_UNK_26
	ld [hli], a ; CHANNEL_UNK_27
	ld [hli], a ; CHANNEL_UNK_28
	ld [hli], a ; CHANNEL_UNK_29
	ld [hli], a ; CHANNEL_VIBRATO_DELAY
	ld [hli], a ; CHANNEL_VIBRATO_COUNTER
	ld [hli], a ; CHANNEL_UNK_2C
	ld [hli], a
	ld [hli], a ; CHANNEL_SO_FLAGS
	ld [hli], a ; CHANNEL_UNK_2F
	ld a, $ff
	ld [hli], a ; CHANNEL_UNK_30
	ret
; 0x303c9

; bc = sound ID
Func_303c9:: ; 303c9 (c:43c9)
	ld a, b
	or c
	jp z, TurnSFXOff

	ld a, c
	ld [wCurSoundID + 0], a
	ld a, b
	ld [wCurSoundID + 1], a
	call SetSFXChannels
.asm_303d9
	ld a, [wCurChannelPtr + 0]
	ld c, a
	ld a, [wCurChannelPtr + 1]
	ld b, a
	ld a, [bc]
	bit CHANNEL_FLAGS_ACTIVE_F, a
	jr z, .asm_303f9
	ld hl, $6
	add hl, bc
	ld a, [wCurSoundID + 0]
	cp [hl]
	jr nz, .asm_303f9
	inc hl
	ld a, [wCurSoundID + 1]
	cp [hl]
	jr nz, .asm_303f9
	xor a
	ld [bc], a
.asm_303f9
	call NextChannel
	jr nz, .asm_303d9
	jp Func_3f8d
; 0x30401

TurnSFXOff: ; 30401 (c:4401)
	call SetSFXChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	xor a
	ld [hl], a ; CHANNEL_FLAGS
	call NextChannel
	jr nz, .loop_chs
	jp Func_3f8d
; 0x30416

Func_30416:: ; 30416 (c:4416)
	call TurnMusicOff
	jp Func_3f8d
; 0x3041c

Func_3041c: ; 3041c (c:441c)
	xor a
	ld [w3d020], a
	; fallthrough

TurnMusicOff: ; 30420 (c:4420)
	ld a, $ff
	ld [w3d025], a
	call SetMusicChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	res CHANNEL_FLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
	call NextChannel
	jr nz, .loop_chs
	ret
; 0x30438

	INCROM $30438, $30490

PointerTable_30490: ; 30490 (c:4490)
	dw Func_30802
	dw Func_30829
	dw Func_30930
	dw Func_3094b
	dw Func_3097a
	dw Func_308f1
	dw Func_309b6
; 0x3049e

Func_3049e:: ; 3049e (c:449e)
	call Func_304a4
	jp Func_3f8d
; 0x304a4

Func_304a4: ; 304a4 (c:44a4)
	; return if a >= $7
	cp $7
	ret nc

	push af
	ld hl, wCurSoundID
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a ; w3d03a
	ld a, d
	ld [hli], a ; w3d03b
	xor a
	ld [hl], a ; wNumChannels
	pop af

	ld bc, PointerTable_30490
	jp JumpToPointerInTable
; 0x304bc

Func_304bc: ; 304bc (c:44bc)
	call Func_304fa
.loop_chs
	rrc d
	jr nc, .next_ch
	bit CHANNEL_FLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
	jr z, .next_ch
	ld a, [wNumChannels]
	or [hl]
	ld [hl], a
	push hl
	add hl, bc
	ld a, [wCurSoundID + 1]
	ld [hl], a
	pop hl
.next_ch
	call AddChannelStructLengthToHL
	jr nz, .loop_chs
	ret
; 0x304d9

Func_304d9: ; 304d9 (c:44d9)
	call Func_304fa
.loop_chs
	rrc d
	jr nc, .next_ch
	bit CHANNEL_FLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
	jr z, .next_ch
	ld a, [wNumChannels]
	or [hl]
	ld [hl], a
	push hl
	add hl, bc
	ld a, [wCurSoundID + 0]
	ld [hli], a
	ld a, [wCurSoundID + 1]
	ld [hld], a
	pop hl
.next_ch
	call AddChannelStructLengthToHL
	jr nz, .loop_chs
	ret
; 0x304fa

; output:
; - d = (w3d03a low nibble << 4) | w3d03b low nibble
; - e = number of channels
; - hl = wChannel1
Func_304fa: ; 304fa (c:44fa)
	ld a, [w3d03b]
	and $0f
	ld d, a ; low nibble
	ld a, [w3d03a]
	swap a
	and $f0 ; *16
	or d
	ld d, a
	ld e, NUM_CHANNELS
	ld hl, wChannel1
	ret
; 0x3050f

AddChannelStructLengthToHL: ; 3050f (c:450f)
	ld a, CHANNEL_STRUCT_LENGTH
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec e
	ret
; 0x30519

	INCROM $30519, $30527

Func_30527: ; 30527 (c:4527)
	ld a, [w3d025]
	and a
	ret nz
	ld a, [w3d020]
	and a
	ret z
	ld hl, w3d021
	dec [hl]
	ret nz

	ld [hli], a
	ld a, [hl] ; w3d022
	sub $04
	jp c, Func_3041c
	ld [hl], a
	ld b, a
	ld a, $02
	lb de, $00, $ff
	jp Func_304a4
; 0x30547

Func_30547: ; 30547 (c:4547)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl] ; CHANNEL_FLAGS
	cp CHANNEL_FLAGS_ACTIVE | CHANNEL_FLAGS_6
	ret c
	ld [w3d019], a
	jp Func_30651
; 0x30559

UpdateChannel: ; 30559 (c:4559)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl]
	bit CHANNEL_FLAGS_ACTIVE_F, a
	ret z ; not active
	bit CHANNEL_FLAGS_6_F, a
	jr nz, .skip_init
	push hl
	call InitChannel
	pop hl
	ld a, [hl]
.skip_init
	ld [w3d019], a
	inc hl
	ld a, [hl] ; CHANNEL_DURATION
	and a
	jr z, .do_audio_cmds
	dec [hl]
	inc hl
	jr Func_305cf

.do_audio_cmds
	inc hl
	ld a, [hli] ; CHANNEL_CMD_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli] ; CHANNEL_SOUND_BANK
	ld [wSoundBank], a
	; fallthrough

DoAudioCommand: ; 30584 (c:4584)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_ACTIVE_COMMAND
	add hl, bc
	call ReadAudioCommands_2Bytes
	bit 7, c
	jr nz, .has_argument

; previous cmd
	ld a, c
	ld [wAudioCmdArg], a
	dec de
	ld a, [hl]
	jr .asm_305a9

.has_argument
	ld a, b
	ld [wAudioCmdArg], a
	ld a, c
	cp $be
	jr c, .asm_305a9 ; if < $be
	ld [hl], a ; CHANNEL_ACTIVE_COMMAND
.asm_305a9
	cp $d0
	jp nc, Func_30a14 ; if >= $d0
	sub $b1
	jp c, Func_3073f
	ld bc, PointerTable_306d1
	; fallthrough

; bc = pointer table
; a = index to jump to
JumpToPointerInTable: ; 305b6 (c:45b6)
	sla a ; *2
	add c
	ld c, a
	ld a, 0
	adc b
	ld b, a
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	jp hl
; 0x305c4

AudioCmd_ClearFlags: ; 305c4 (c:45c4)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	xor a
	ld [hli], a
	ret
; 0x305cf

Func_305cf: ; 305cf (c:45cf)
	ld bc, CHANNEL_VIBRATO_COUNTER - CHANNEL_CMD_PTR
	add hl, bc
	ld a, [hl]
	and a
	jr z, .counter_done
	; still counting down vibrato delay
	dec [hl]
	ld bc, CHANNEL_UNK_VIBRATO_VALUE - CHANNEL_VIBRATO_COUNTER
	add hl, bc
	ld a, $40
	jr .write_vibrato_value
.counter_done
	ld bc, CHANNEL_VIBRATO_SPEED - CHANNEL_VIBRATO_COUNTER
	add hl, bc
	ld a, [hli]
	add [hl] ; CHANNEL_UNK_VIBRATO_VALUE
.write_vibrato_value
	ld [hl], a ; CHANNEL_UNK_VIBRATO_VALUE
	sla a
	jr nc, .got_vibrato_value
	cpl
.got_vibrato_value
	ld [wVibratoValue], a

	ld bc, CHANNEL_VIBRATO_AMPLITUDE - CHANNEL_UNK_VIBRATO_VALUE
	add hl, bc
	ld a, [hli]
	add [hl] ; CHANNEL_UNK_22
	jr z, .asm_3060c
	ld c, a
	ld a, [wVibratoValue]
	ld b, a
	push hl
	push bc
	call Func_30fee
	pop bc
	ld b, h
	pop hl
	inc hl
	ld a, [hli] ; CHANNEL_VIBRATO_DISABLED
	cp FALSE
	jr z, .calculate_vibrato
	jr .skip_vibrato

.asm_3060c
	lb bc, $0, $0
	inc hl
	ld a, [hli] ; CHANNEL_VIBRATO_DISABLED
	cp FALSE
	jr z, .asm_30629
	jr .skip_vibrato

.calculate_vibrato
	ld a, b
	srl c
	sub c
	ld c, a ; = b - c / 2
	ld a, 0
	sbc a
	sla c
	rla
	sla c
	rla
	sla c
	rla
	ld b, a ; *8
.asm_30629
	ld a, c
	cp [hl] ; CHANNEL_UNK_24
	jr z, .asm_30636
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld [hl], c
.asm_30636
	inc hl
	ld a, b
	cp [hl] ; CHANNEL_UNK_25
	jr z, .asm_30644
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld [hl], b
.asm_30644
	jr .skip_vibrato ; unnecessary jump

.skip_vibrato
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [w3d019]
;	fallthrough

; hl = channel
Func_30651: ; 30651 (c:4651)
	bit 2, a
	jr z, .asm_30691
	ld bc, CHANNEL_UNK_1D
	add hl, bc
	ld e, [hl]
	ld a, 0
	sla e
	sbc a
	ld d, a ; (e > $80) ? $ff : $00
	ld bc, CHANNEL_UNK_1B - CHANNEL_UNK_1D
	add hl, bc
	ld a, [hli]
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a

	ld bc, CHANNEL_UNK_13 - CHANNEL_UNK_1B
	add hl, bc
	ld a, [hli]
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a

	ld bc, CHANNEL_VIBRATO_DISABLED - CHANNEL_UNK_13
	add hl, bc
	ld a, [hli]
	cp $00
	jr nz, .asm_30683
	ld a, [hli] ; CHANNEL_UNK_24
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a

.asm_30683
	ld bc, CHANNEL_UNK_2C - CHANNEL_UNK_24
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d
	ld bc, -(CHANNEL_UNK_2C + 1)
	add hl, bc
	ld a, [w3d019]

.asm_30691
	bit 0, a
	jr z, .asm_306a8
	ld bc, CHANNEL_SO1
	add hl, bc
	ld a, [hli]
	add [hl] ; CHANNEL_SO2
	ld e, a
	ld bc, CHANNEL_SO_FLAGS - CHANNEL_SO2
	add hl, bc
	ld [hl], e
	ld bc, -CHANNEL_SO_FLAGS
	add hl, bc
	ld a, [w3d019]

.asm_306a8
	bit 1, a
	jr z, .done
	ld bc, CHANNEL_UNK_15
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl] ; CHANNEL_UNK_16
	call Func_31012
	add $0f
	and $f0
	cp $40
	jr c, .no_cap
	ld a, $ff
.no_cap
	rlca
	rlca
	ld e, a
	ld bc, CHANNEL_UNK_2F - CHANNEL_UNK_16
	add hl, bc
	ld [hl], e
	ld bc, -CHANNEL_UNK_2F
	add hl, bc

	ld a, [w3d019]
.done
	ld [hl], a
	ret
; 0x306d1

PointerTable_306d1: ; 306d1 (c:46d1)
	dw AudioCmd_ClearFlags           ; b1
	dw AudioCmd_Jump                 ; b2
	dw AudioCmd_Call                 ; b3
	dw AudioCmd_Ret                  ; b4
	dw AudioCmd_Loop                 ; b5
	dw Func_30a0d                    ; b6
	dw Func_30a0d                    ; b7
	dw Func_30a0d                    ; b8
	dw AudioCmd_ClearFlags           ; b9
	dw AudioCmd_ClearFlags           ; ba
	dw AudioCmd_ClearFlags           ; bb
	dw AudioCmd_SetTempo             ; bc
	dw AudioCmd_SetPitchOffset       ; bd
	dw AudioCmd_SetWave              ; be
	dw AudioCmd_SetChannelUnk15      ; bf
	dw Func_3093e                    ; c0
	dw Func_3087f                    ; c1
	dw Func_308be                    ; c2
	dw AudioCmd_SetVibratoSpeed      ; c3
	dw AudioCmd_SetVibratoDelay      ; c4
	dw AudioCmd_SetVibratoAmplitude  ; c5
	dw AudioCmd_SetChannelVibratoDisabled      ; c6
	dw Func_30a0d                    ; c7
	dw Func_30a0d                    ; c8
	dw Func_30980                    ; c9
	dw AudioCmd_SetChannelUnk1e      ; ca
	dw Func_30a0d                    ; cb
	dw AudioCmd_ClearFlags           ; cc
	dw Func_30727                    ; cd
	dw Func_30a10                    ; ce
	dw Func_30b4d                    ; cf
; 0x3070f

PointerTable_3070f: ; 3070f (c:470f)
	dw AudioCmd_ClearFlags           ; 00
	dw AudioCmd_SetChannelTimbre     ; 01
	dw AudioCmd_SetChannelFadeInSpeed ; 02
	dw Func_309e8                    ; 03
	dw Func_30a03                    ; 04
	dw AudioCmd_SetChannelFadeOutSpeed ; 05
	dw AudioCmd_SetChannelUnk27      ; 06
	dw AudioCmd_SetChannelUnk28      ; 07
	dw Func_30a0d                    ; 08
	dw Func_30a0d                    ; 09
	dw AudioCmd_SetChannelDuration   ; 0a
	dw AudioCmd_SetChannelSweep      ; 0b
; 0x30727

Func_30727: ; 30727 (c:4727)
	ld a, [wAudioCmdArg]
	inc de
	cp $0c
	jp nc, AudioCmd_ClearFlags
	ld b, a
	call ReadAudioCommands_1Byte
	ld a, c
	ld [wAudioCmdArg], a
	ld a, b
	ld bc, PointerTable_3070f
	jp JumpToPointerInTable
; 0x3073f

Func_3073f: ; 3073f (c:473f)
	add $31
	jp z, DoAudioCommand ; $80

	add LOW(Data_3102b)
	ld l, a
	ld a, 0
	adc HIGH(Data_3102b)
	ld h, a
	ld b, [hl]
	dec b

	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	inc hl
	ld a, b
	ld [hli], a ; CHANNEL_DURATION
	ld a, e
	ld [hli], a ; CHANNEL_CMD_PTR
	ld a, d
	ld [hld], a
	jp Func_305cf
; 0x30760

AudioCmd_Call: ; 30760 (c:4760)
; audiocmd_call
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_UNK_26
	add hl, bc
	ld a, [hl]
	cp $0a
	jp nc, AudioCmd_ClearFlags
	inc a
	inc a
	ld [hl], a
	ld c, a
	ld b, $00
	add hl, bc
	ld bc, $a
	add hl, bc
	inc de
	inc de
	ld a, e
	ld [hli], a
	ld [hl], d
	dec de
	dec de
;	fallthrough

AudioCmd_Jump: ; 30784 (c:4784)
; audiocmd_jump
	call ReadAudioCommands_2Bytes
	ld e, c
	ld d, b
	jp DoAudioCommand
; 0x3078c

AudioCmd_Ret: ; 3078c (c:478c)
; audiocmd_ret
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_UNK_26
	add hl, bc
	ld a, [hl]
	and a
	jp z, DoAudioCommand
	dec a
	dec a
	ld [hl], a
	ld c, a
	ld b, $00
	add hl, bc
	ld bc, $c
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	jp DoAudioCommand
; 0x307ae

AudioCmd_Loop: ; 307ae (c:47ae)
; audiocmd_loop
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_UNK_29
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	and a
	jr z, AudioCmd_Jump ; if arg == 0
	inc [hl]
	cp [hl]
	jr nz, AudioCmd_Jump ; if arg != CHANNEL_UNK_29 + 1
	xor a
	ld [hl], a
	inc de
	inc de
	jp DoAudioCommand
; 0x307cc

AudioCmd_SetTempo: ; 307cc (c:47cc)
; tempo
	ld hl, wAudioEngineFlags
	bit 5, [hl]
	ld hl, wMusicTempo
	jr z, .not_set
	ld hl, wSFXTempo
.not_set
	ld a, [wAudioCmdArg]
	inc de
	ld [hl], a
	call Func_307e4
	jp DoAudioCommand
; 0x307e4

Func_307e4: ; 307e4 (c:47e4)
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	call Func_30fee
	ld a, h
	cp $40
	jr c, .no_cap
	ld a, $3f
	ld l, $ff
.no_cap
	sla l
	rla
	sla l
	rla ; *4
	and a
	jr nz, .asm_307ff
	inc a ; at least 1
.asm_307ff
	pop hl
	ld [hl], a
	ret
; 0x30802

Func_30802: ; 30802 (c:4802)
	ld a, [w3d03b]
	and a
	jr z, .asm_30812
	ld hl, w3d006
	ld a, [wCurSoundID + 1]
	ld [hld], a
	call Func_307e4
.asm_30812
	ld a, [w3d03a]
	and a
	jr z, .asm_30822
	ld hl, w3d00b
	ld a, [wCurSoundID + 1]
	ld [hld], a
	call Func_307e4
.asm_30822
	ret
; 0x30823

AudioCmd_SetPitchOffset: ; 30823 (c:4823)
; pitch_offset
	ld bc, CHANNEL_PITCH_OFFSET
	jp SetChannelProperty
; 0x30829

Func_30829: ; 30829 (c:4829)
	ld a, [wNumChannels]
	set 2, a
	ld [wNumChannels], a
	ld bc, CHANNEL_UNK_13
	jp Func_304d9
; 0x30837

AudioCmd_SetWave: ; 30837 (c:4837)
; wave
	ld a, [wAudioCmdArg]
	inc de
	cp $28
	jr z, .asm_30867

	call GetWave

	ld a, [wCurChannelPtr + 0]
	add CHANNEL_TIMBRE
	ld c, a
	ld a, [wCurChannelPtr + 1]
	adc 0
	ld b, a

	ld a, [hli] ; timbre
	ld [bc], a
	inc bc
	ld a, [hli] ; duration
	ld [bc], a
	inc bc
	ld a, [hli] ; sweep
	ld [bc], a
	inc bc
	ld a, [hli] ; fade in speed
	ld [bc], a
	inc bc
	ld a, [hli] ; fade out speed
	ld [bc], a

	ld a, [w3d019]
	res 4, a
	ld [w3d019], a
	jp DoAudioCommand

.asm_30867
	ld a, [w3d019]
	set 4, a
	ld [w3d019], a
	jp DoAudioCommand
; 0x30872

GetWave: ; 30872 (c:4872)
	ld l, a
	ld h, $00
	add hl, hl ; *2
	ld c, l
	ld b, h
	add hl, hl ; *4
	add hl, bc ; *6
	ld bc, Waves
	add hl, bc
	ret
; 0x3087f

Func_3087f: ; 3087f (c:487f)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_UNK_19
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	rlca
	sub $80
	ld [hli], a
	ld b, a
	ld a, [hli]
	ld c, a
;	fallthrough

Func_30896: ; 30896 (c:4896)
	push hl
	sla b
	jr c, .asm_308a2
	call Func_30fee
	ld c, l
	ld b, h
	jr .asm_308af
.asm_308a2
	ld a, b
	cpl
	ld b, a
	call Func_30fee
	dec hl
	ld a, l
	cpl
	ld c, a
	ld a, h
	cpl
	ld b, a
.asm_308af
	pop hl
	ld a, c
	ld [hli], a
	ld [hl], b
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	jp DoAudioCommand
; 0x308be

Func_308be: ; 308be (c:48be)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_UNK_1A
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	ld [hld], a
	ld c, a
	ld a, [hli]
	ld b, a
	inc hl
	jr Func_30896
; 0x308d5

AudioCmd_SetVibratoSpeed: ; 308d5 (c:48d5)
; vibrato_speed
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_VIBRATO_SPEED
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	ld [hli], a
	sla a
	jr nz, .asm_308ee
	ccf
	rra
	rra
	ld [hl], a ; CHANNEL_UNK_VIBRATO_VALUE
.asm_308ee
	jp DoAudioCommand
; 0x308f1

Func_308f1: ; 308f1 (c:48f1)
	ld a, [wCurSoundID + 1]
	sla a
	jr z, .asm_308fe
	ld bc, CHANNEL_VIBRATO_SPEED
	jp Func_304bc
.asm_308fe
	rra
	ld [wCurSoundID + 0], a
	rra
	xor $40
	ld [wCurSoundID + 1], a
	ld bc, CHANNEL_VIBRATO_SPEED
	jp Func_304d9
; 0x3090e

AudioCmd_SetVibratoDelay: ; 3090e (c:490e)
; vibrato_delay
	ld bc, CHANNEL_VIBRATO_DELAY
	jr SetChannelProperty
; 0x30913

AudioCmd_SetChannelUnk15: ; 30913 (c:4913)
; audiocmd_bf
	ld a, [w3d019]
	set 1, a
	ld [w3d019], a

	ld bc, CHANNEL_UNK_15
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	rlca
	ld [hl], a
	jp DoAudioCommand
; 0x30930

Func_30930: ; 30930 (c:4930)
	ld a, [wNumChannels]
	set 1, a
	ld [wNumChannels], a
	ld bc, CHANNEL_UNK_16
	jp Func_304bc
; 0x3093e

Func_3093e: ; 3093e (c:493e)
	ld a, [w3d019]
	set 0, a
	ld [w3d019], a
	ld bc, CHANNEL_SO1
	jr Func_3098b
; 0x3094b

Func_3094b: ; 3094b (c:494b)
	ld a, [wNumChannels]
	set 0, a
	ld [wNumChannels], a
	ld bc, CHANNEL_SO2
	jp Func_304bc
; 0x30959

AudioCmd_SetVibratoAmplitude: ; 30959 (c:4959)
; vibrato_amplitude
	ld bc, CHANNEL_VIBRATO_AMPLITUDE
;	fallthrough

SetChannelProperty: ; 3095c (c:495c)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	ld [hl], a
	jp DoAudioCommand
; 0x3096d

AudioCmd_SetChannelVibratoDisabled: ; 3096d (c:496d)
; set_vibrato_disabled
	ld a, [w3d019]
	or %111
	ld [w3d019], a
	ld bc, CHANNEL_VIBRATO_DISABLED
	jr SetChannelProperty
; 0x3097a

Func_3097a: ; 3097a (c:497a)
	ld bc, CHANNEL_UNK_22
	jp Func_304bc
; 0x30980

Func_30980: ; 30980 (c:4980)
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld bc, CHANNEL_UNK_1D
; 0x3098b

Func_3098b: ; 3098b (c:498b)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	rlca
	sub $80
	ld [hl], a
	jp DoAudioCommand
; 0x3099f

AudioCmd_SetChannelUnk1e: ; 3099f (c:499f)
; audiocmd_ca
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld bc, CHANNEL_UNK_1E
	jr SetChannelProperty
; 0x309ac

AudioCmd_SetChannelUnk27: ; 309ac (c:49ac)
; audiocmd_d6
	ld bc, CHANNEL_UNK_27
	jr SetChannelProperty
; 0x309b1

AudioCmd_SetChannelUnk28: ; 309b1 (c:49b1)
; audiocmd_d7
	ld bc, CHANNEL_UNK_28
	jr SetChannelProperty
; 0x309b6

Func_309b6: ; 309b6 (c:49b6)
	ld bc, CHANNEL_UNK_27
	jp Func_304d9
; 0x309bc

AudioCmd_SetChannelTimbre: ; 309bc (c:49bc)
; set_timbre
	ld bc, CHANNEL_TIMBRE
	jr SetChannelProperty
; 0x309c1

AudioCmd_SetChannelDuration: ; 309c1 (c:49c1)
; set_duration
	ld bc, CHANNEL_LENGTH
	jr SetChannelProperty
; 0x309c6

AudioCmd_SetChannelSweep: ; 309c6 (c:49c6)
; set_sweep
	ld bc, CHANNEL_SWEEP
	jr SetChannelProperty
; 0x309cb

AudioCmd_SetChannelFadeInSpeed: ; 309cb (c:49cb)
; fade_in
	ld bc, CHANNEL_FADE_IN_SPEED
;	fallthrough

Func_309ce: ; 309ce (c:49ce)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	swap a
	and $f0
	ld b, a
	ld a, [hl]
	and $0f
	or b
	ld [hl], a
	jp DoAudioCommand
; 0x309e8

Func_309e8: ; 309e8 (c:49e8)
	ld bc, CHANNEL_FADE_IN_SPEED
;	fallthrough

Func_309eb: ; 309eb (c:49eb)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	and $0f
	ld b, a
	ld a, [hl]
	and $f0
	or b
	ld [hl], a
	jp DoAudioCommand
; 0x30a03

Func_30a03: ; 30a03 (c:4a03)
	ld bc, CHANNEL_FADE_OUT_SPEED
	jr Func_309ce
; 0x30a08

AudioCmd_SetChannelFadeOutSpeed: ; 30a08 (c:4a08)
	ld bc, CHANNEL_FADE_OUT_SPEED
	jr Func_309eb
; 0x30a0d

Func_30a0d: ; 30a0d (c:4a0d)
	jp AudioCmd_ClearFlags
; 0x30a10

Func_30a10: ; 30a10 (c:4a10)
	ld b, $00
	jr Func_30a1f
; 0x30a14

Func_30a14: ; 30a14 (c:4a14)
	sub $cf
	add LOW(Data_3102b)
	ld l, a
	ld a, 0
	adc HIGH(Data_3102b)
	ld h, a
	ld b, [hl]
;	fallthrough

Func_30a1f: ; 30a1f (c:4a1f)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, b
	ld bc, CHANNEL_UNK_0B
	add hl, bc
	ld [hld], a
	ld b, $00
	ld a, [wAudioCmdArg]
	jr .got_arg

.loop_args
	inc de
	call ReadAudioCommands_1Byte
	ld a, c
.got_arg
	bit 7, a
	jr nz, .done_args
	cp $24
	jr nc, .pitch ; if >= $24
	cp $20
	jr c, .asm_30a5a ; if < $20
	bit 5, b
	jr nz, .done_args
	set 5, b
	inc hl
	add [hl] ; CHANNEL_UNK_0B
	ld [hld], a
	jr .loop_args

.pitch
	bit 7, b
	jr nz, .done_args
	set 7, b
	dec hl
	ld [hli], a ; CHANNEL_PITCH
	jr .loop_args

.asm_30a5a
	bit 6, b
	jr nz, .done_args
	set 6, b
	rlca
	rlca
	rlca
	or %111
	ld [hl], a ; CHANNEL_UNK_0A
	jr .loop_args

.done_args
	push de
	dec hl
	ld a, [hl] ; CHANNEL_PITCH
	ld bc, CHANNEL_PITCH_OFFSET - CHANNEL_PITCH
	add hl, bc
	add [hl] ; add pitch offset
	ld [w3d03a], a
	ld [w3d03b], a
	ld bc, CHANNEL_VIBRATO_DELAY - CHANNEL_PITCH_OFFSET
	add hl, bc
	ld a, [hli]
	ld [hld], a ; CHANNEL_VIBRATO_COUNTER

	ld bc, CHANNEL_TIMBRE - CHANNEL_VIBRATO_DELAY
	add hl, bc
	ld a, [w3d019]
	bit 4, a
	jr z, .asm_30aa5
	push hl
	ld e, l
	ld d, h
	ld a, [w3d03a]
	add $04
	call GetWave
	ld a, [hli]
	ld [de], a ; CHANNEL_TIMBRE
	inc de
	ld a, [hli]
	ld [de], a ; CHANNEL_LENGTH
	inc de
	ld a, [hli]
	ld [de], a ; CHANNEL_SWEEP
	inc de
	ld a, [hli]
	ld [de], a ; CHANNEL_FADE_IN_SPEED
	inc de
	ld a, [hli]
	ld [de], a ; CHANNEL_FADE_OUT_SPEED
	ld a, [hl]
	ld [w3d03b], a
	pop hl
.asm_30aa5

; set Track1 if (CHANNEL_TIMBRE < $08)
; set Track2 if ($8  <= CHANNEL_TIMBRE < $10)
; set Track3 if ($10 <= CHANNEL_TIMBRE < $40)
; set Track3 if (CHANNEL_TIMBRE >= $40)

	ld a, [hl] ; CHANNEL_TIMBRE
	cp $10
	jr nc, .track3_or_track4 ; if >= $10
	cp $8
	jr nc, .track2 ; if >= $8
; track1
	call SetTrack1
	jr .got_track
.track2
	call SetTrack2
	jr .got_track
.track3_or_track4
	cp $40
	jr nc, .track4 ; if >= $40
; track3
	call SetTrack3
	jr .got_track
.track4
	call SetTrack4

.got_track
	ld a, [wNumAudioChannels]
	ld hl, wAudioEngineFlags
	bit 5, [hl]
	jr z, .asm_30ad0
	set 7, a
.asm_30ad0
	ld [wCurSoundID + 1], a
	ld e, a
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_PRIORITY
	add hl, bc
	ld a, [hl]
	ld [wCurSoundID + 0], a
	ld d, a

	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld a, [hli] ; TRACK_UNK00
	and a
	jr z, .UpdateTrack
	bit 5, a
	jr nz, .asm_30af7
	jr .UpdateTrack

.asm_30af7
	ld a, [hli] ; TRACK_UNK01
	cp d
	jr c, .UpdateTrack
	jr nz, .skip
	ld a, e
	cp [hl] ; TRACK_UNK02
	jr c, .skip

.UpdateTrack
	call TurnSoundRegisterOff
	ld a, [wCurChannelPtr + 0]
	ld e, a
	ld a, [wCurChannelPtr + 1]
	ld d, a
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a

	ld a, $f0
	ld [hli], a ; TRACK_UNK00
	ld a, [wCurSoundID + 0]
	ld [hli], a ; TRACK_UNK01
	ld a, [wCurSoundID + 1]
	ld [hli], a ; TRACK_UNK02
	ld a, [w3d03a]
	ld [hli], a ; TRACK_UNK03
	ld a, e
	ld [hli], a ; TRACK_CHANNEL
	ld a, d
	ld [hli], a
	ld a, CHANNEL_UNK_0A
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	ld a, [de]
	ld [hli], a ; TRACK_UNK06
	inc de
	ld a, [de]
	ld [hli], a ; TRACK_DURATION
	inc de
	ld a, [de]
	ld [hli], a ; TRACK_TIMBRE
	inc de
	ld a, [de]
	ld [hli], a ; TRACK_LENGTH
	inc de
	ld a, [de]
	ld [hli], a ; TRACK_SWEEP
	inc de
	ld a, [de]
	ld [hli], a ; TRACK_FADE_IN_SPEED
	inc de
	ld a, [de]
	ld [hli], a ; TRACK_FADE_OUT_SPEED
	xor a
	ld [hli], a ; TRACK_UNK0D
	ld a, [w3d03b]
	ld [hl], a ; TRACK_UNK0E
.skip
	pop de
	jp DoAudioCommand
; 0x30b4d

Func_30b4d: ; 30b4d (c:4b4d)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_PITCH
	add hl, bc
	ld a, [wAudioCmdArg]
	bit 7, a
	jr nz, .asm_30b66
	cp $24
	jr c, .asm_30b66
	inc de
	ld [hl], a
.asm_30b66
	ld a, [hl]
	ld bc, CHANNEL_PITCH_OFFSET - CHANNEL_PITCH
	add hl, bc
	add [hl]
	ld [w3d03a], a

	push de
	call SetAllTracks
	ld a, [wNumAudioChannels]
	ld hl, wAudioEngineFlags
	bit 5, [hl]
	jr z, .asm_30b7f
	set 7, a
.asm_30b7f
	ld e, a
	ld a, [w3d03a]
	ld d, a

.loop_tracks
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld a, [hli] ; TRACK_UNK00
	bit 5, a
	jr z, .next_track
	inc hl
	ld a, [hli] ; TRACK_UNK02
	cp e
	jr nz, .next_track
	ld a, [hl] ; TRACK_UNK03
	cp d
	jr nz, .next_track
	ld bc, TRACK_DURATION - TRACK_UNK03
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .next_track
	call Func_30be3
	jr .done
.next_track
	call NextTrack
	jr nz, .loop_tracks

.done
	pop de
	jp DoAudioCommand
; 0x30bb0

Func_30bb0: ; 30bb0 (c:4bb0)
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	bit 7, [hl] ; TRACK_UNK00
	ret z
	inc hl
	inc hl
	bit 7, [hl] ; TRACK_UNK02
	ret z
	jr Func_30bd2

Func_30bc2: ; 30bc2 (c:4bc2)
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	bit 7, [hl] ; TRACK_UNK00
	ret z
	inc hl
	inc hl
	bit 7, [hl] ; TRACK_UNK02
	ret nz
	; fallthrough

Func_30bd2: ; 30bd2 (c:4bd2)
	inc hl
	inc hl
	ld a, [hli] ; TRACK_CHANNEL
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	cp $c0
	jr c, Func_30bf2
	inc hl
	ld a, [hl] ; TRACK_DURATION
	and a
	ret z
	dec [hl]
	ret nz
;	fallthrough

Func_30be3: ; 30be3 (c:4be3)
	ld bc, TRACK_UNK00 - TRACK_DURATION
	add hl, bc
	ld a, [hl]
	bit 6, a
	jr nz, Func_30bf6
	or %1010000
	and %11011111
	ld [hl], a
	ret
; 0x30bf2

Func_30bf2: ; 30bf2 (c:4bf2)
	ld bc, TRACK_UNK00 - (TRACK_CHANNEL + 2)
	add hl, bc
	; fallthrough

Func_30bf6: ; 30bf6 (c:4bf6)
	xor a
	ld [hl], a
	jp TurnSoundRegisterOff
; 0x30bfb

Func_30bfb: ; 30bfb (c:4bfb)
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld a, [hl]
	bit 7, a
	ret z

	ld b, a
	push hl
	ld de, TRACK_CHANNEL
	add hl, de
	ld a, [hli]
	ld [wCurChannelPtr + 0], a
	ld e, a
	ld a, [hli]
	ld [wCurChannelPtr + 1], a
	ld d, a
	ld a, [de]
	cp CHANNEL_FLAGS_ACTIVE | CHANNEL_FLAGS_6
	jr nc, .asm_30c1f
	pop hl
	jr Func_30bf6

.asm_30c1f
	ld [w3d019], a
	bit 6, b
	jr nz, .asm_30c46
	ld de, TRACK_FREQUENCY - (TRACK_CHANNEL + 2)
	add hl, de
	ld a, [w3d01a]
	and a
	jr nz, .asm_30c31
	inc [hl]
.asm_30c31
	inc [hl]
	pop hl
	bit 5, b
	jr z, .asm_30c3e
	bit 4, b
	jr nz, .asm_30c95
	jp .asm_30ce9
.asm_30c3e
	bit 4, b
	jp nz, .asm_30d22
	jp .asm_30d70

.asm_30c46
	pop hl
	res 6, [hl]

	bit 5, [hl]
	jr z, .fade_out

	push hl
	call SetTimbre
	pop hl

	ld a, [w3d019]
	or %111
	ld [w3d019], a
	call .Func_30dc6

; fade in
	ld bc, TRACK_FADE_IN_SPEED
	add hl, bc
	ld a, [hl]
	ld bc, TRACK_VOLUME_ENVELOPE - TRACK_FADE_IN_SPEED
	add hl, bc
	swap a
	cpl
	rrca
	and %111 ; bits 7, 6, and 5 of TRACK_FADE_IN_SPEED
	jr z, .asm_30cba
	or %1000 ; amplify
	ld [hli], a ; TRACK_VOLUME_ENVELOPE
	xor a
	ld [hli], a ; TRACK_FREQUENCY low
	jp .asm_30d9d

.fade_out
	ld bc, TRACK_FADE_OUT_SPEED
	add hl, bc
	ld b, [hl]
	ld de, TRACK_VOLUME_ENVELOPE - TRACK_FADE_OUT_SPEED
	add hl, de
	ld a, [hl]
	and $f0
	jp z, .asm_30d3b ; if mute setting
	ld c, a
	ld a, b
	cpl
	rrca
	and %111
	jp z, .asm_30d3b
	or c
	ld [hli], a
	xor a
	ld [hli], a
	jp .asm_30d95

.asm_30c95
	ld a, [w3d019]
	bit 1, a
	call nz, .Func_30dc6

	ld bc, TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld a, [hli]
	and %111 ; length
	dec a
	cp [hl] ; TRACK_FREQUENCY
	jr nc, .asm_30cb3 ; if (length - 1) >= freq lo
	xor a
	ld [hld], a ; TRACK_FREQUENCY
	ld a, [hl] ; TRACK_VOLUME_ENVELOPE
	add $10
	jr c, .asm_30cba
	call .Func_30e1b
	ld [hli], a
.asm_30cb3
	dec hl
	ld a, [hld]
	cp [hl]
	jp c, .asm_30d84
	inc hl
.asm_30cba
	ld bc, TRACK_FADE_IN_SPEED - TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld b, [hl]
	ld de, TRACK_UNK10 - TRACK_FADE_IN_SPEED
	add hl, de
	ld c, [hl]
	push bc
	ld bc, TRACK_UNK00 - TRACK_UNK10
	add hl, bc
	res 4, [hl]
	call .Func_30deb
	ld d, a
	ld bc, TRACK_VOLUME_ENVELOPE
	add hl, bc
	pop bc
	ld a, b
	cpl
	rrca
	and %111
	jr nz, .asm_30ce2
	call .CheckEnvelopeValue
	jr z, .asm_30d3b
	ld a, d
	ld c, d
.asm_30ce2
	or c
	ld [hli], a ; TRACK_VOLUME_ENVELOPE
	xor a
	ld [hli], a ; TRACK_FREQUENCY lo
	jp .asm_30d95

.asm_30ce9
	ld a, [w3d019]
	bit 1, a
	call nz, .Func_30deb
	ld bc, TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld a, [hli]
	and %111
	jr z, .asm_30d1b
	dec a
	cp [hl]
	jr nc, .asm_30d09
	xor a
	ld [hld], a
	ld a, [hl]
	sub $10
	jr c, .asm_30d11
	call .Func_30e1b
	ld [hli], a
.asm_30d09
	dec hl
	dec hl
	ld a, [hli]
	or $0f
	cp [hl]
	jr c, .asm_30d84
.asm_30d11
	call .CheckEnvelopeValue
	jr z, .asm_30d3b
	dec hl
.asm_30d17
	ld a, [hli]
	ld [hl], a
	jr .asm_30d95

.asm_30d1b
	dec hl
	ld a, [hld]
	xor [hl]
	jr nz, .asm_30d17
	jr .asm_30d9d

.asm_30d22
	ld bc, TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld a, [hli]
	and $07
	dec a
	cp [hl]
	jr nc, .asm_30d84
	xor a
	ld [hld], a
	ld a, [hl]
	sub $10
	jr c, .asm_30d3b
	call .Func_30e1b
	ld [hl], a
	jr .asm_30d84
	dec hl

.asm_30d3b
	push hl
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_UNK_2F
	add hl, bc
	ld b, [hl]
	ld de, CHANNEL_UNK_27 - CHANNEL_UNK_2F
	add hl, de
	ld a, [hli]
	ld c, a
	ld d, [hl] ; CHANNEL_UNK_28
	pop hl
	ld a, b
	and a
	jr z, .asm_30d77
	ld a, c
	and a
	jr z, .asm_30d77
	ld a, d
	and a
	jr z, .asm_30d77
	call Func_31012
	add $0f
	and $f0
	ld [hli], a
	ld [hl], d
	ld bc, -18
	add hl, bc
	ld a, [hl]
	and $8f
	ld [hl], a
	jr .asm_30d95

.asm_30d70
	ld bc, TRACK_FREQUENCY
	add hl, bc
	dec [hl]
	jr nz, .asm_30d9d
.asm_30d77
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	xor a
	ld [hl], a
	jp TurnSoundRegisterOff

.asm_30d84
	ld a, [wCurSoundRegister]
	cp LOW(rNR32)
	jr z, .asm_30d9d
	ld a, [w3d019]
	res 1, a
	ld [w3d019], a
	jr .asm_30d9d

.asm_30d95
	ld a, [w3d019]
	set 1, a
	ld [w3d019], a

.asm_30d9d
	ld a, [w3d019]
	bit 2, a
	jr z, .skip_frequency
	call SetFrequency
	ld a, [w3d019]
.skip_frequency

	bit 0, a
	jr z, .skip_so
	call SetSoundOutput
	ld a, [w3d019]
.skip_so

	bit 1, a
	ret z ; skip envelope
	jp SetVolumeEnvelope

.CheckEnvelopeValue
	ld bc, TRACK_FADE_OUT_SPEED - TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld a, [hl]
	ld bc, TRACK_VOLUME_ENVELOPE - TRACK_FADE_OUT_SPEED
	add hl, bc
	and $f0
	ret

.Func_30dc6
	push hl
	ld bc, TRACK_UNK06
	add hl, bc
	ld c, [hl]
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld de, CHANNEL_UNK_2F
	add hl, de
	ld b, [hl]
	call Func_31012
	add $0f
	and $f0
	pop hl
	ld de, TRACK_UNK10
	add hl, de
	ld [hl], a
	ld de, TRACK_UNK00 - TRACK_UNK10
	add hl, de
	ret

.Func_30deb
	push hl
	ld bc, TRACK_FADE_OUT_SPEED
	add hl, bc
	ld b, [hl]
	ld de, TRACK_UNK06 - TRACK_FADE_OUT_SPEED
	add hl, de
	ld c, [hl]
	call Func_31012
	add $0f
	ld c, a
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld de, CHANNEL_UNK_2F
	add hl, de
	ld b, [hl]
	call Func_31012
	add $0f
	and $f0
	pop hl
	ld de, TRACK_UNK10
	add hl, de
	ld [hl], a
	ld de, -TRACK_UNK10
	add hl, de
	ret

.Func_30e1b
	ld b, a
	ld a, [wCurSoundRegister]
	cp LOW(rNR32)
	ld a, b
	ret nz ; not sound3
	xor [hl]
	and $c0
	jr z, .asm_30e30
	ld a, [w3d019]
	set 1, a
	ld [w3d019], a
.asm_30e30
	ld a, b
	ret
; 0x30e32

SetTimbre: ; 30e32 (c:4e32)
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld bc, TRACK_TIMBRE
	add hl, bc
	ld a, [wCurSoundRegister]
	ld c, a
	cp LOW(rNR32)
	jr c, .rect_sound
	jr z, .sound3

; noise
	; if bit 0 is set, sets polynomial counter step to 7
	; otherwise sets it to 15
	ld a, [hli]
	rlca
	rlca
	rlca
	and %1000
	ld b, a
	inc c
	ld a, [$ff00+c] ; rNR43
	and %11110111 ; all but polynomial counter steps
	or b
	ld [$ff00+c], a
	ld a, [hl]
	and a
	jr z, .no_noise_duration
	cpl
	inc a ; -a
	ldh [rNR41], a
	ld a, %01000000 ; counter
.no_noise_duration
	or %10000000 ; restart
	ldh [rNR44], a
	ret

.rect_sound
	ld a, [hli] ; duty cycle
	rrca
	rrca
	and %11000000
	ld b, a
	ld a, [hli] ; duration
	and a
	jr z, .no_rect_duration
	cpl
	inc a ; -a
	and %00111111
	or b
	ld b, a
	ld a, %01000000
.no_rect_duration
	inc c
	inc c
	ld [$ff00+c], a ; freq hi
	dec c
	dec c
	dec c
	ld a, b
	ld [$ff00+c], a ; length / duty cycle
	dec c
	ld a, [hl]
	ld [$ff00+c], a ; sweep
	ret

.sound3
	ld a, [hli]
	sub WAVEFORM_SINE
	ld b, a
	ld a, [hl] ; TRACK_LENGTH
	and a
	jr z, .no_sound3_duration
	cpl
	inc a ; -a
	ldh [rNR31], a
	ld a, %01000000 ; counter
.no_sound3_duration
	ldh [rNR34], a

	ld a, [wCurWaveSample]
	cp b
	ret z ; no need to load
	ld a, b
	ld [wCurWaveSample], a
	ld l, b
	ld h, $00
	add hl, hl ; *2
	add hl, hl ; *4
	add hl, hl ; *8
	add hl, hl ; *16
	ld bc, WaveSamples
	add hl, bc

	ld c, LOW(_AUD3WAVERAM)
	ld b, $10
.loop_wave_sample
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop_wave_sample
	ret
; 0x30eb1

SetFrequency: ; 30eb1 (c:4eb1)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_UNK_2C
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]

	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld de, TRACK_UNK0E
	add hl, de
	ld a, [hl]
	add b
	ld b, a

	ld a, [wCurSoundRegister]
	cp LOW(rNR32)
	jr c, .rect_sound
	jr nz, .noise

; sound3
	ld a, b
	add $0c
	ld b, a
.rect_sound
	push hl
	ld a, b
	call Func_30fd1
	ld b, a
	call Func_30fee
	ld bc, $ff
	add hl, bc
	ld l, h
	ld h, $00
	add hl, de

	ld a, [wCurSoundRegister]
	ld c, a
	inc c
	ld a, l
	ld [$ff00+c], a ; freq lo
	inc c
	ld a, [$ff00+c] ; freq hi
	and %01000000
	jr z, .length_counter
	or h
	ld [$ff00+c], a
	jr .asm_30f0b
.length_counter
	or h
	ld [$ff00+c], a ; freq hi
	ld b, a
	ld a, [wCurSoundRegister]
	ld c, a
	dec c
	ld a, [$ff00+c] ; length
	and %11000000
	ld [$ff00+c], a
	ld a, b
.asm_30f0b
	pop hl
	ld bc, TRACK_FREQUENCY + 1 - TRACK_UNK0E
	add hl, bc
	or %10000000
	ld [hl], a
	ret

.noise
	ld c, a
	inc c
	ld a, b
	sub $0d
	cpl
	ld b, a
	and %11
	ld d, a
	ld a, b
	cp $c0
	jr c, .asm_30f2b
	and %00111100
	rlca
	rlca
	or d
	or %100
	ld d, a
.asm_30f2b
	ld a, [$ff00+c]
	and %1000
	or d
	ld [$ff00+c], a
	inc c
	ld a, [$ff00+c]
	or %10000000 ; initialise
	ld [$ff00+c], a
	ret
; 0x30f36

SetSoundOutput: ; 30f36 (c:4f36)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_SO_FLAGS
	add hl, bc
	ld a, [wCurSoundRegister]
	cp LOW(rNR22)
	jr c, .sound1
	jr z, .sound2
	cp LOW(rNR42)
	jr c, .sound3

; sound4
	lb de, %01110111, %10001000
	jr .asm_30f61
.sound1
	lb de, %11101110, %00010001
	jr .asm_30f61
.sound2
	lb de, %11011101, %00100010
	jr .asm_30f61
.sound3
	lb de, %10111011, %01000100

.asm_30f61
	bit 7, [hl]
	jr nz, .asm_30f6d
	bit 6, [hl]
	jr z, .asm_30f77
	ld a, $0f ; SO1
	jr .apply_so_mask
.asm_30f6d
	bit 6, [hl]
	jr nz, .asm_30f77
	ld a, $f0 ; SO2
	jr .apply_so_mask
.apply_so_mask
	and e
	ld e, a

.asm_30f77
	ld c, LOW(rNR51)
	ld a, [$ff00+c]
	and d
	or e
	ld [$ff00+c], a
	ret
; 0x30f7e

SetVolumeEnvelope: ; 30f7e (c:4f7e)
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld bc, TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [wCurSoundRegister]
	ld c, a
	cp LOW(rNR32)
	jr c, .rect
	jr z, .sound3

; noise
	ld a, b
	ld [$ff00+c], a
	ldh a, [rNR44]
	or %10000000 ; initialise
	ldh [rNR44], a
	ret

.rect
	ld a, b
	ld [$ff00+c], a
	inc c
	inc c
	inc hl
	ld a, [hl]
	ld [$ff00+c], a ; freq hi
	ret

.sound3
; if flags 7 and 6 are:
; - %00 -> %00 (muted)
; - %01 -> %11 (shifted 2 bits)
; - %10 -> %10 (shifted 1 bit)
; - %11 -> %01 (unmodified)
	ld a, b
	sub $40
	xor %11000000
	rrca
	ld [$ff00+c], a

	ldh a, [rNR30]
	rla
	ret c ; sound is on
	ld a, %10000000 ; enable
	ldh [rNR30], a
	inc hl
	ld a, [hl]
	ldh [rNR34], a ; freq hi
	ret
; 0x30fbb

TurnSoundRegisterOff: ; 30fbb (c:4fbb)
	ld a, [wCurSoundRegister]
	ld c, a
	cp LOW(rNR32)
	jr z, .sound3
	ld a, %00001000 ; envelope up
	ld [$ff00+c], a
	inc c
	inc c
	ld a, %10000000 ; initialise
	ld [$ff00+c], a
	ret

.sound3
	ld a, $00 ; sound off
	ldh [rNR30], a
	ret
; 0x30fd1

Func_30fd1: ; 30fd1 (c:4fd1)
	sub $24
	jr nc, .no_underflow
	xor a
.no_underflow
	cp $78
	jr c, .no_cap
	; cap to $77
	ld a, $77
.no_cap
	ld d, $00
	ld e, a
	add e ; *2
	add e ; *3
	rl d
	ld e, a
	ld hl, Data_3105c
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ret
; 0x30fee

; returns hl = b * c * some multiplier
; the higher c, the higher the slope
Func_30fee: ; 30fee (c:4fee)
	ld h, b
	ld l, $00
	ld b, l
	add hl, hl
	jr nc, .asm_30ff6
	add hl, bc
.asm_30ff6
	add hl, hl
	jr nc, .asm_30ffa
	add hl, bc
.asm_30ffa
	add hl, hl
	jr nc, .asm_30ffe
	add hl, bc
.asm_30ffe
	add hl, hl
	jr nc, .asm_31002
	add hl, bc
.asm_31002
	add hl, hl
	jr nc, .asm_31006
	add hl, bc
.asm_31006
	add hl, hl
	jr nc, .asm_3100a
	add hl, bc
.asm_3100a
	add hl, hl
	jr nc, .asm_3100e
	add hl, bc
.asm_3100e
	add hl, hl
	ret nc
	add hl, bc
	ret
; 0x31012

Func_31012: ; 31012 (c:5012)
	ld a, c
	and $f0
	swap a
	ld c, a
	ld a, b
	and $f0
	add a
	jr nc, .asm_3101f
	add c
.asm_3101f
	add a
	jr nc, .asm_31023
	add c
.asm_31023
	add a
	jr nc, .asm_31027
	add c
.asm_31027
	add a
	ret nc
	add c
	ret
; 0x3102b

Data_3102b: ; 3102b (c:502b)
	db  0 ; 80 | cf
	db  1 ; 81 | d0
	db  2 ; 82 | d1
	db  3 ; 83 | d2
	db  4 ; 84 | d3
	db  5 ; 85 | d4
	db  6 ; 86 | d5
	db  7 ; 87 | d6
	db  8 ; 88 | d7
	db  9 ; 89 | d8
	db 10 ; 8a | d9
	db 11 ; 8b | da
	db 12 ; 8c | db
	db 13 ; 8d | dc
	db 14 ; 8e | dd
	db 15 ; 8f | de
	db 16 ; 90 | df
	db 17 ; 91 | d0
	db 18 ; 92 | d1
	db 19 ; 93 | d2
	db 20 ; 94 | d3
	db 21 ; 95 | d4
	db 22 ; 96 | d5
	db 23 ; 97 | d6
	db 24 ; 98 | d7
	db 28 ; 99 | d8
	db 30 ; 9a | d9
	db 32 ; 9b | da
	db 36 ; 9c | db
	db 40 ; 9d | dc
	db 42 ; 9e | dd
	db 44 ; 9f | de
	db 48 ; a0 | df
	db 52 ; a1 | d0
	db 54 ; a2 | d1
	db 56 ; a3 | d2
	db 60 ; a4 | d3
	db 64 ; a5 | d4
	db 66 ; a6 | d5
	db 68 ; a7 | d6
	db 72 ; a8 | d7
	db 76 ; a9 | d8
	db 78 ; aa | d9
	db 80 ; ab | da
	db 84 ; ac | db
	db 88 ; ad | dc
	db 90 ; ae | dd
	db 92 ; af | de
	db 96 ; b0 | df
; 0x3105c

Data_3105c: ; 3105c (c:505c)
	dwb  $2c, $70 ; C_0
	dwb  $9d, $6a ; C#0
	dwb $107, $64 ; D_0
	dwb $16b, $5f ; D#0
	dwb $1c9, $59 ; E_0
	dwb $223, $54 ; F_0
	dwb $277, $50 ; F#0
	dwb $2c7, $4b ; G_0
	dwb $312, $47 ; G#0
	dwb $358, $43 ; A_0
	dwb $39b, $3f ; A#0
	dwb $3da, $3c ; B_0
	dwb $416, $38 ; C_1
	dwb $44e, $35 ; C#1
	dwb $483, $32 ; D_1
	dwb $4b5, $30 ; D#1
	dwb $4e4, $2d ; E_1
	dwb $511, $2a ; F_1
	dwb $53b, $28 ; F#1
	dwb $563, $26 ; G_1
	dwb $589, $24 ; G#1
	dwb $5ac, $22 ; A_1
	dwb $5cd, $20 ; A#1
	dwb $5ed, $1e ; B_1
	dwb $60b, $1c ; C_2
	dwb $627, $1b ; C#2
	dwb $642, $19 ; D_2
	dwb $65b, $18 ; D#2
	dwb $672, $16 ; E_2
	dwb $689, $15 ; F_2
	dwb $69e, $14 ; F#2
	dwb $6b2, $13 ; G_2
	dwb $6c4, $12 ; G#2
	dwb $6d6, $11 ; A_2
	dwb $6e7, $10 ; A#2
	dwb $6f6, $0f ; B_2
	dwb $705, $0e ; C_3
	dwb $714, $0d ; C#3
	dwb $721, $0d ; D_3
	dwb $72d, $0c ; D#3
	dwb $739, $0b ; E_3
	dwb $744, $0b ; F_3
	dwb $74f, $0a ; F#3
	dwb $759, $09 ; G_3
	dwb $762, $09 ; G#3
	dwb $76b, $08 ; A_3
	dwb $773, $08 ; A#3
	dwb $77b, $08 ; B_3
	dwb $783, $07 ; C_4
	dwb $78a, $07 ; C#4
	dwb $790, $06 ; D_4
	dwb $797, $06 ; D#4
	dwb $79d, $06 ; E_4
	dwb $7a2, $05 ; F_4
	dwb $7a7, $05 ; F#4
	dwb $7ac, $05 ; G_4
	dwb $7b1, $04 ; G#4
	dwb $7b5, $04 ; A_4
	dwb $7ba, $04 ; A#4
	dwb $7be, $04 ; B_4
	dwb $7c1, $04 ; C_5
	dwb $7c5, $03 ; C#5
	dwb $7c8, $03 ; D_5
	dwb $7cb, $03 ; D#5
	dwb $7ce, $03 ; E_5
	dwb $7d1, $03 ; F_5
	dwb $7d4, $03 ; F#5
	dwb $7d6, $02 ; G_5
	dwb $7d9, $02 ; G#5
	dwb $7db, $02 ; A_5
	dwb $7dd, $02 ; A#5
	dwb $7df, $02 ; B_5
	dwb $7e1, $02 ; C_6
	dwb $7e2, $02 ; C#6
	dwb $7e4, $02 ; D_6
	dwb $7e6, $01 ; D#6
	dwb $7e8, $01 ; E_6
	dwb $7e9, $01 ; F_6
	dwb $7ea, $01 ; F#6
	dwb $7eb, $01 ; G_6
	dwb $7ec, $01 ; G#6
	dwb $7ed, $01 ; A_6
	dwb $7ee, $01 ; A#6
	dwb $7ef, $01 ; B_6
	dwb $7f0, $01 ; C_7
	dwb $7f1, $01 ; C#7
	dwb $7f2, $01 ; D_7
	dwb $7f3, $01 ; D#7
	dwb $7f4, $01 ; E_7
	dwb $7f4, $01 ; F_7
	dwb $7f5, $01 ; F#7
	dwb $7f6, $01 ; G_7
	dwb $7f6, $01 ; G#7
	dwb $7f7, $01 ; A_7
	dwb $7f7, $01 ; A#7
	dwb $7f8, $01 ; B_7
	dwb $7f8, $01 ; C_8
	dwb $7f9, $01 ; C#8
	dwb $7f9, $01 ; D_8
	dwb $7f9, $01 ; D#8
	dwb $7fa, $01 ; E_8
	dwb $7fa, $01 ; F_8
	dwb $7fa, $01 ; F#8
	dwb $7fb, $01 ; G_8
	dwb $7fb, $01 ; G#8
	dwb $7fb, $01 ; A_8
	dwb $7fc, $01 ; A#8
	dwb $7fc, $01 ; B_8
	dwb $7fc, $01 ; C_9
	dwb $7fc, $01 ; C#9
	dwb $7fd, $01 ; D_9
	dwb $7fd, $01 ; D#9
	dwb $7fd, $01 ; E_9
	dwb $7fd, $01 ; F_9
	dwb $7fd, $01 ; F#9
	dwb $7fd, $01 ; G_9
	dwb $7fe, $01 ; G#9
	dwb $7fe, $01 ; A_9
	dwb $7fe, $01 ; A#9
	dwb $7fe, $01 ; B_9
; 0x311c4

Waves: ; 311c4 (c:51c4)
	db WAVEFORM_SQUARE_1_2_SAWTOOTH, $00, $00, $ff, $ff, $3c ; $00
	db $00,                          $00, $00, $fb, $28, $3c ; $01
	db $00,                          $00, $00, $f0, $10, $3c ; $02
	db $01,                          $00, $00, $ff, $ff, $3c ; $03
	db $01,                          $00, $00, $fb, $28, $3c ; $04
	db $01,                          $00, $00, $f0, $10, $3c ; $05
	db $02,                          $00, $00, $ff, $ff, $3c ; $06
	db $02,                          $00, $00, $fb, $28, $3c ; $07
	db $02,                          $00, $00, $f0, $10, $3c ; $08
	db $02,                          $00, $00, $f1, $13, $3c ; $09
	db $00,                          $00, $00, $ff, $ff, $3c ; $0a
	db $00,                          $00, $00, $fc, $18, $3c ; $0b
	db $00,                          $00, $00, $f0, $10, $3c ; $0c
	db $01,                          $00, $00, $ff, $ff, $3c ; $0d
	db $01,                          $00, $00, $fc, $10, $3c ; $0e
	db $01,                          $00, $00, $f0, $18, $3c ; $0f
	db $02,                          $00, $00, $ff, $ff, $3c ; $10
	db $02,                          $00, $00, $fc, $18, $3c ; $11
	db $02,                          $00, $00, $f0, $10, $3c ; $12
	db $02,                          $00, $00, $f1, $13, $3c ; $13
	db $08,                          $00, $00, $ff, $ff, $3c ; $14
	db $08,                          $00, $00, $fc, $18, $3c ; $15
	db $08,                          $00, $00, $f0, $10, $3c ; $16
	db $09,                          $00, $00, $ff, $ff, $3c ; $17
	db $09,                          $00, $00, $fc, $18, $3c ; $18
	db $09,                          $00, $00, $f0, $10, $3c ; $19
	db $0a,                          $00, $00, $ff, $ff, $3c ; $1a
	db $0a,                          $00, $00, $fc, $18, $3c ; $1b
	db $0a,                          $00, $00, $f0, $10, $3c ; $1c
	db $0a,                          $00, $00, $f1, $13, $3c ; $1d
	db WAVEFORM_SINE,                $00, $00, $f6, $24, $3c ; $1e
	db WAVEFORM_TRIANGLE,            $00, $00, $f6, $24, $3c ; $1f
	db WAVEFORM_SAWTOOTH,            $00, $00, $f6, $24, $3c ; $20
	db WAVEFORM_STEP,                $00, $00, $f6, $24, $3c ; $21
	db WAVEFORM_SQUARE_1_8,          $00, $00, $f6, $24, $3c ; $22
	db WAVEFORM_SQUARE_2_8,          $00, $00, $f6, $24, $3c ; $23
	db WAVEFORM_SQUARE_3_8,          $00, $00, $f6, $24, $3c ; $24
	db WAVEFORM_SQUARE_4_8,          $00, $00, $f6, $24, $3c ; $25
	db WAVEFORM_SQUARE_1_2_SAWTOOTH, $00, $00, $f6, $24, $3c ; $26
	db WAVEFORM_SQUARE_1_2_SAWTOOTH, $00, $00, $f6, $24, $3c ; $27
	db $41,                          $0a, $00, $ff, $ff, $31 ; $28
	db $41,                          $00, $00, $f0, $10, $4f ; $29
	db $40,                          $08, $00, $ff, $ff, $3e ; $2a
	db $41,                          $06, $00, $ff, $ff, $41 ; $2b
	db $41,                          $06, $00, $ff, $ff, $4f ; $2c
	db $40,                          $00, $00, $fd, $0f, $3c ; $2d
	db $41,                          $02, $00, $ff, $ff, $4c ; $2e
	db $40,                          $00, $00, $fd, $0f, $3c ; $2f
	db $40,                          $0c, $00, $ff, $ff, $4f ; $30
	db $40,                          $24, $00, $ff, $ff, $4f ; $31
	db $02,                          $00, $15, $f6, $00, $3c ; $32
	db $02,                          $00, $24, $ff, $ff, $3c ; $33
	db $02,                          $00, $3c, $ff, $ff, $3c ; $34
	db $02,                          $00, $1c, $fc, $0c, $3c ; $35
	db $02,                          $00, $15, $ff, $ff, $3c ; $36
	db $02,                          $00, $37, $ff, $ff, $3c ; $37
	db $00,                          $00, $75, $ff, $ff, $3c ; $38
	db $00,                          $00, $7d, $ff, $ff, $3c ; $39
	db $02,                          $00, $3f, $ff, $ff, $3c ; $3a
	db $00,                          $00, $1d, $ff, $ff, $3c ; $3b
	db $00,                          $00, $17, $ff, $ff, $3c ; $3c
	db $01,                          $00, $45, $ff, $ff, $3c ; $3d
	db $02,                          $00, $25, $ff, $ff, $3c ; $3e
	db $02,                          $00, $1a, $ff, $ff, $3c ; $3f
	db $02,                          $00, $15, $fa, $4c, $3c ; $40
	db $02,                          $00, $6c, $ff, $ff, $3c ; $41
	db $01,                          $00, $15, $ff, $ff, $3c ; $42
	db $02,                          $00, $47, $ff, $ff, $3c ; $43
	db $02,                          $00, $27, $ff, $ff, $3c ; $44
	db $02,                          $00, $1d, $fc, $0c, $3c ; $45
	db $00,                          $00, $00, $fa, $4c, $3c ; $46
	db $01,                          $00, $00, $fa, $4c, $3c ; $47
	db $02,                          $00, $00, $fa, $4c, $3c ; $48
	db $00,                          $00, $00, $fc, $0c, $3c ; $49
	db $01,                          $00, $00, $fc, $0c, $3c ; $4a
	db $02,                          $00, $00, $fc, $0c, $3c ; $4b
	db $00,                          $00, $00, $cf, $fa, $3c ; $4c
	db $01,                          $00, $00, $cf, $fa, $3c ; $4d
	db $02,                          $00, $00, $cf, $fa, $3c ; $4e
	db $02,                          $00, $5c, $f0, $10, $3c ; $4f
	db $08,                          $00, $00, $fa, $4c, $3c ; $50
	db $09,                          $00, $00, $fa, $4c, $3c ; $51
	db $0a,                          $00, $00, $fa, $4c, $3c ; $52
	db $08,                          $00, $00, $fc, $0c, $3c ; $53
	db $09,                          $00, $00, $fc, $0c, $3c ; $54
	db $0a,                          $00, $00, $fc, $0c, $3c ; $55
	db $08,                          $00, $00, $cf, $fa, $3c ; $56
	db $09,                          $00, $00, $cf, $fa, $3c ; $57
	db $0a,                          $00, $00, $cf, $fa, $3c ; $58
	db $02,                          $00, $45, $f0, $10, $3c ; $59
	db WAVEFORM_SAWTOOTH,            $00, $00, $ff, $ff, $3c ; $5a
	db WAVEFORM_SAWTOOTH,            $00, $00, $fc, $0c, $3c ; $5b
	db WAVEFORM_SQUARE_1_8,          $00, $00, $cf, $fa, $3c ; $5c
	db WAVEFORM_SQUARE_2_8,          $00, $00, $ff, $ff, $3c ; $5d
	db WAVEFORM_SQUARE_2_8,          $00, $00, $fa, $4c, $3c ; $5e
	db WAVEFORM_SQUARE_2_8,          $00, $00, $cf, $fa, $3c ; $5f
	db WAVEFORM_SQUARE_4_8,          $00, $00, $ff, $ff, $3c ; $60
	db WAVEFORM_SQUARE_4_8,          $00, $00, $fa, $4c, $3c ; $61
	db WAVEFORM_SQUARE_4_8,          $00, $00, $cf, $fa, $3c ; $62
	db WAVEFORM_SPIKY,               $00, $00, $ff, $ff, $3c ; $63
	db WAVEFORM_TRIANGLE,            $00, $00, $ff, $ff, $3c ; $64
	db $40,                          $00, $00, $ff, $ff, $3c ; $65
	db $40,                          $00, $00, $fa, $4c, $3c ; $66
	db $40,                          $00, $00, $fc, $0c, $3c ; $67
	db $40,                          $00, $00, $cf, $fa, $3c ; $68
	db $40,                          $00, $00, $e8, $18, $3c ; $69
	db $41,                          $00, $00, $ff, $ff, $3c ; $6a
	db $41,                          $00, $00, $f6, $24, $3c ; $6b
	db $41,                          $00, $00, $fc, $0c, $3c ; $6c
	db $41,                          $00, $00, $cf, $fa, $3c ; $6d
	db $02,                          $00, $1d, $ff, $ff, $3c ; $6e
	db WAVEFORM_SQUISHED_SINE,       $00, $00, $ff, $ff, $3c ; $6f
	db $00,                          $00, $00, $fa, $6c, $3c ; $70
	db $01,                          $00, $00, $fa, $6c, $3c ; $71
	db $02,                          $00, $00, $fa, $6c, $3c ; $72
	db $08,                          $00, $00, $fa, $6c, $3c ; $73
	db $09,                          $00, $00, $fa, $6c, $3c ; $74
	db $0a,                          $00, $00, $fa, $6c, $3c ; $75
	db WAVEFORM_SQUARE_1_8,          $00, $00, $fa, $6c, $3c ; $76
	db WAVEFORM_SQUARE_2_8,          $00, $00, $fa, $6c, $3c ; $77
	db WAVEFORM_SQUARE_4_8,          $00, $00, $fa, $6c, $3c ; $78
	db WAVEFORM_SPIKY,               $00, $00, $fa, $4c, $3c ; $79
	db WAVEFORM_SQUARE_1_8,          $00, $00, $ff, $ff, $3c ; $7a
; 0x314a6

WaveSamples: ; 314a6 (c:54a6)
; These are streams of 32 nibbles (4-bit values) used as wave patterns.
; Plot them as a line chart to see the wave's shape.
	dn  0,  0,  1,  1,  2,  3,  5,  6,  8,  9, 10, 12, 13, 14, 14, 15, 15, 15, 14, 14, 13, 12, 10,  9,  8,  6,  5,  3,  2,  1,  1,  0 ; WAVEFORM_SINE
	dn  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0 ; WAVEFORM_TRIANGLE
	dn 15, 15, 14, 14, 13, 13, 12, 12, 11, 11, 10, 10,  9,  9,  8,  8,  7,  7,  6,  6,  5,  5,  4,  4,  3,  3,  2,  2,  1,  1,  0,  0 ; WAVEFORM_SAWTOOTH
	dn 15, 14, 13, 12, 11, 10,  9,  9,  8,  8,  8,  8,  8,  8,  8,  8,  7,  7,  7,  7,  7,  7,  7,  7,  6,  6,  5,  4,  3,  2,  1,  0 ; WAVEFORM_STEP
	dn 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_1_8
	dn 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_2_8
	dn 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_3_8
	dn 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_4_8
	dn 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0, 15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1 ; WAVEFORM_SQUARE_1_2_SAWTOOTH
	dn 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1 ; WAVEFORM_SQUARE_1_4_SAWTOOTH
	dn  7,  7,  7,  7,  5,  1, 10,  2,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SPIKY
	dn  7, 10, 12, 14, 15, 15, 15,  8,  7,  9,  9,  7,  7,  7,  7,  5,  5,  6,  6,  4,  4,  4,  4,  3,  3,  2,  2,  2,  2,  1,  1,  0 ; WAVEFORM_SQUISHED_SINE
; 0x31566

MACRO music
	assert \5 < CHAN5, "Invalid channel for music"

	dw \1 ; sound ptr
	db \2 ; sound bank
	db \3 ; unknown
	db \4 ; priority
	db \5 ; channel start number
	db \6 ; number of channels used
	db $00 ; padding
ENDM

MACRO sfx
	assert \5 >= CHAN5, "Invalid channel for SFX"

	dw \1 ; sound ptr
	db \2 ; sound bank
	db \3 ; unknown
	db \4 ; priority
	db \5 - CHAN5 ; channel start number
	db \6 ; number of channels used
	db $00 ; padding
ENDM

MACRO filler_sounds
REPT \1
	music $6a98, $0c, $00, 100, CHAN1, 4
ENDR
ENDM

SoundHeaders: ; 3155e (c:555e)
	music Music_OutOfTheWoodsDay, $0c, $00, 100, CHAN1, 4 ; MUSIC_OUT_OF_THE_WOODS_DAY
	music $6d27, $0c, $00, 100, CHAN1, 3 ; MUSIC_OUT_OF_THE_WOODS_NIGHT
	music $6eed, $0c, $00, 100, CHAN1, 2 ; MUSIC_FOREST_OF_FEAR
	music $72e7, $0c, $00, 100, CHAN1, 3 ; MUSIC_THE_WARPED_VOID
	music $75af, $0c, $00, 100, CHAN1, 3 ; MUSIC_DESERT_RUINS
	music $77f9, $0c, $00, 100, CHAN1, 3 ; MUSIC_THE_FRIGID_SEA
	music $7b2e, $0c, $00, 100, CHAN1, 4 ; MUSIC_THE_PEACEFUL_VILLAGE_DAY
	music $7dd5, $0c, $00, 100, CHAN1, 3 ; MUSIC_THE_PEACEFUL_VILLAGE_NIGHT
	music $4391, $0d, $00, 100, CHAN1, 3 ; MUSIC_ABOVE_THE_CLOUDS_DAY
	music $481c, $0d, $00, 100, CHAN1, 3 ; MUSIC_ABOVE_THE_CLOUDS_NIGHT
	music $4a50, $0d, $00, 100, CHAN1, 3 ; MUSIC_THE_VOLCANOS_BASE_NIGHT
	music $4d69, $0d, $00, 100, CHAN1, 3 ; MUSIC_THE_VOLCANOS_BASE_DAY
	music $5179, $0d, $00, 100, CHAN1, 3 ; MUSIC_THE_WEST_CRATER
	music $547a, $0d, $00, 100, CHAN1, 4 ; MUSIC_THE_VAST_PLAIN_DAY
	music $5718, $0d, $00, 100, CHAN1, 4 ; MUSIC_THE_VAST_PLAIN_NIGHT
	music $5a63, $0d, $00, 100, CHAN1, 4 ; MUSIC_BANK_OF_THE_WILD_RIVER
	music $5f44, $0d, $00, 100, CHAN1, 4 ; MUSIC_THE_TIDAL_COAST
	music $64c6, $0d, $00, 100, CHAN1, 4 ; MUSIC_CAVE_OF_FLAMES
	music $67cb, $0d, $00, 100, CHAN1, 4 ; MUSIC_THE_POOL_OF_RAIN_DAY
	music $6997, $0d, $00, 100, CHAN1, 4 ; MUSIC_THE_POOL_OF_RAIN_NIGHT
	music $7450, $0d, $00, 100, CHAN1, 4 ; MUSIC_CREDITS
	music $75c1, $0d, $00, 100, CHAN1, 3 ; MUSIC_HOT_WARIO
	music $76e0, $0d, $00, 100, CHAN1, 3 ; MUSIC_FAT_WARIO
	music $7829, $0d, $00, 100, CHAN1, 3 ; MUSIC_BOUNCY_WARIO
	music $7901, $0d, $00, 100, CHAN1, 2 ; MUSIC_ZOMBIE_WARIO
	music $79e5, $0d, $00, 100, CHAN1, 3 ; MUSIC_FLAT_WARIO
	music $7b78, $0d, $00, 100, CHAN1, 3 ; MUSIC_CRAZY_WARIO
	music $7cf0, $0d, $00, 100, CHAN1, 3 ; MUSIC_INVISIBLE_WARIO
	music $7df8, $0d, $00, 100, CHAN1, 3 ; MUSIC_SNOWMAN_WARIO
	music $7f41, $0d, $00, 100, CHAN1, 3 ; MUSIC_OWL_WARIO
	music $41e6, $0e, $00, 100, CHAN1, 2 ; MUSIC_BALL_O_STRING_WARIO
	music $4351, $0e, $00, 100, CHAN1, 3 ; MUSIC_VAMPIRE_WARIO
	music $46f6, $0e, $00, 100, CHAN1, 4 ; MUSIC_OVERWORLD_DAY
	music $4951, $0e, $00, 100, CHAN1, 3 ; MUSIC_OVERWORLD_NIGHT
	music $4a63, $0e, $00, 100, CHAN1, 3 ; MUSIC_LEVEL_CLEAR_NO_TREASURE
	music $4b5e, $0e, $00, 100, CHAN1, 4 ; MUSIC_TREASURE_FANFARE
	music $4bd6, $0e, $00, 100, CHAN1, 2 ; MUSIC_PAUSE_MENU
	music $4f13, $0e, $00, 100, CHAN1, 3 ; MUSIC_GOLF
	music $5308, $0e, $00, 100, CHAN1, 4 ; MUSIC_BOSS_BATTLE
	music $54cc, $0e, $00, 100, CHAN1, 4 ; MUSIC_LEVEL_CLEAR_GOT_TREASURE
	music $55e1, $0e, $00, 100, CHAN1, 2 ; MUSIC_BOSS_DEFEAT
	music $5641, $0e, $00, 100, CHAN1, 3 ; MUSIC_GAME_OVER
	music $56bc, $0e, $00, 100, CHAN1, 4 ; MUSIC_GOLF_CLEARED
	music $57f2, $0e, $00, 100, CHAN1, 3 ; MUSIC_MUSIC_BOXES
	music $58b4, $0e, $00, 100, CHAN1, 2 ; MUSIC_45
	music $5991, $0e, $00, 100, CHAN1, 2 ; MUSIC_ACTION_HELP
	music $5ba8, $0e, $00, 100, CHAN1, 4 ; MUSIC_GOLF_MENU
	music $5d53, $0e, $00, 100, CHAN1, 3 ; MUSIC_48
	music $5db7, $0e, $00, 100, CHAN1, 3 ; MUSIC_49
	music $5f11, $0e, $00, 100, CHAN1, 2 ; MUSIC_THE_TEMPLE
	music $62ef, $0e, $00, 100, CHAN1, 4 ; MUSIC_TITLE_SCREEN
	music $6641, $0e, $00, 100, CHAN1, 3 ; MUSIC_INTRO
	music $6c2b, $0e, $00, 100, CHAN1, 4 ; MUSIC_HIDDEN_FIGURE_BATTLE_1
	music $7152, $0e, $00, 100, CHAN1, 4 ; MUSIC_PERFECT
	music $72a6, $0e, $00, 100, CHAN1, 3 ; MUSIC_TREASURE_COLLECTION
	music $748d, $0e, $00, 100, CHAN1, 3 ; MUSIC_EPILOGUE
	music $74e5, $0e, $00, 100, CHAN1, 3 ; MUSIC_HIDDEN_FIGURE_REVEAL
	music $7834, $0e, $00, 100, CHAN1, 4 ; MUSIC_HIDDEN_FIGURE_BATTLE_2
	filler_sounds 198

	sfx $785b, $0e, $00, 220, CHAN5, 1 ; SFX_JUMP
	sfx $792e, $0e, $00, 237, CHAN8, 1 ; SFX_GROUND_SHAKE
	sfx $793f, $0e, $00, 236, CHAN5, 1 ; SFX_BUMP
	sfx $7958, $0e, $00, 226, CHAN8, 1 ; SFX_WALK
	sfx $7981, $0e, $00, 236, CHAN8, 1 ; SFX_BLOCK_BREAK
	sfx $79bc, $0e, $00, 236, CHAN8, 1 ; SFX_006
	sfx $79d3, $0e, $00, 235, CHAN8, 1 ; SFX_ATTACK
	sfx $79f7, $0e, $00, 235, CHAN5, 2 ; SFX_ATTACK_POWERED_UP
	sfx $7a24, $0e, $00, 235, CHAN5, 1 ; SFX_REGULAR_COIN
	sfx $7a44, $0e, $00, 230, CHAN5, 1 ; SFX_ROLL
	sfx $7a55, $0e, $00, 230, CHAN8, 1 ; SFX_ZIP_LINE_SLIDE
	sfx $7a68, $0e, $00, 237, CHAN5, 1 ; SFX_SLIDE
	sfx $7aa6, $0e, $00, 235, CHAN5, 2 ; SFX_SPLASH
	sfx $7ac7, $0e, $00, 228, CHAN5, 1 ; SFX_00E
	sfx $7add, $0e, $00, 210, CHAN5, 1 ; SFX_00F
	sfx $7af2, $0e, $00, 228, CHAN8, 1 ; SFX_LAND
	sfx $7b05, $0e, $00, 200, CHAN5, 1 ; SFX_011
	sfx $7b38, $0e, $00, 255, CHAN5, 1 ; SFX_RECOVERY
	sfx $7b70, $0e, $00, 237, CHAN7, 1 ; SFX_STING
	sfx $7b83, $0e, $00, 239, CHAN5, 1 ; SFX_014
	sfx $7b94, $0e, $00, 210, CHAN5, 1 ; SFX_GRAB
	sfx $7ba5, $0e, $00, 239, CHAN5, 1 ; SFX_016
	sfx $7bcf, $0e, $00, 238, CHAN5, 2 ; SFX_017
	sfx $7bfd, $0e, $00, 230, CHAN8, 1 ; SFX_018
	sfx $7c0e, $0e, $00, 236, CHAN5, 1 ; SFX_019
	sfx $7c21, $0e, $00, 239, CHAN7, 1 ; SFX_01A
	sfx $7c85, $0e, $00, 220, CHAN5, 2 ; SFX_01B
	sfx $7caa, $0e, $00, 200, CHAN5, 1 ; SFX_FLAT_WALK
	sfx $7cbb, $0e, $00, 220, CHAN5, 1 ; SFX_01D
	sfx $7ccc, $0e, $00, 221, CHAN8, 1 ; SFX_01E
	sfx $7ce1, $0e, $00, 228, CHAN8, 1 ; SFX_01F
	sfx $7d04, $0e, $00, 221, CHAN8, 1 ; SFX_020
	sfx $7d1d, $0e, $00, 220, CHAN8, 1 ; SFX_HANG_GRAB
	sfx $7d2f, $0e, $00, 229, CHAN5, 1 ; SFX_022
	sfx $7d60, $0e, $00, 220, CHAN5, 1 ; SFX_023
	sfx $7dcc, $0e, $00, 236, CHAN5, 1 ; SFX_024
	sfx $7dea, $0e, $00, 240, CHAN5, 1 ; SFX_025
	sfx $7e15, $0e, $00, 221, CHAN5, 1 ; SFX_PUFF_RAISE
	sfx $7e44, $0e, $00, 220, CHAN8, 1 ; SFX_027
	sfx $7e63, $0e, $00, 226, CHAN5, 1 ; SFX_028
	sfx $7e7e, $0e, $00, 226, CHAN8, 1 ; SFX_ZOMBIE_WALK
	sfx $7eaf, $0e, $00, 226, CHAN8, 1 ; SFX_02A
	sfx $7fc4, $0e, $00, 220, CHAN5, 1 ; SFX_02B
	sfx $7fd5, $0e, $00, 220, CHAN5, 1 ; SFX_02C
	sfx $7fee, $0e, $00, 220, CHAN5, 1 ; SFX_FULLY_CHARGED_THROW
	sfx $4015, $0f, $00, 232, CHAN5, 1 ; SFX_02E
	sfx $402a, $0f, $00, 236, CHAN5, 1 ; SFX_02F
	sfx $403d, $0f, $00, 220, CHAN5, 1 ; SFX_PIPE
	sfx $40ae, $0f, $00, 255, CHAN5, 2 ; SFX_MUSICAL_COIN
	sfx $414f, $0f, $00, 255, CHAN5, 2 ; SFX_KEY
	sfx $4166, $0f, $00, 237, CHAN5, 1 ; SFX_GROUND_POUND
	sfx $41ac, $0f, $00, 237, CHAN5, 2 ; SFX_034
	sfx $41c8, $0f, $00, 221, CHAN8, 1 ; SFX_035
	sfx $41ea, $0f, $00, 228, CHAN8, 1 ; SFX_036
	sfx $4206, $0f, $00, 220, CHAN5, 1 ; SFX_WATER_SURFACE
	sfx $4228, $0f, $00, 220, CHAN5, 2 ; SFX_CLIMB
	sfx $4253, $0f, $00, 220, CHAN5, 1 ; SFX_039
	sfx $4296, $0f, $00, 220, CHAN5, 1 ; SFX_03A
	sfx $42ad, $0f, $00, 230, CHAN5, 1 ; SFX_FAT_WALK
	sfx $42d4, $0f, $00, 220, CHAN5, 1 ; SFX_03C
	sfx $4329, $0f, $00, 220, CHAN5, 1 ; SFX_03D
	sfx $4374, $0f, $00, 220, CHAN5, 1 ; SFX_03E
	sfx $43dc, $0f, $00, 220, CHAN5, 2 ; SFX_03F
	sfx $43f1, $0f, $00, 236, CHAN8, 1 ; SFX_040
	sfx $4418, $0f, $00, 220, CHAN5, 1 ; SFX_041
	sfx $4452, $0f, $00, 220, CHAN5, 1 ; SFX_042
	sfx $44a9, $0f, $00, 220, CHAN5, 1 ; SFX_043
	sfx $4520, $0f, $00, 220, CHAN8, 1 ; SFX_044
	sfx $4597, $0f, $00, 220, CHAN5, 3 ; SFX_045
	sfx $4617, $0f, $00, 220, CHAN5, 3 ; SFX_046
	sfx $4683, $0f, $00, 220, CHAN5, 1 ; SFX_047
	sfx $4718, $0f, $00, 239, CHAN5, 2 ; SFX_048
	sfx $472d, $0f, $00, 220, CHAN5, 1 ; SFX_049
	sfx $4741, $0f, $00, 200, CHAN5, 1 ; SFX_CROUCH_WALK
	sfx $477c, $0f, $00, 240, CHAN5, 1 ; SFX_COLOUR_COIN
	sfx $47eb, $0f, $00, 239, CHAN5, 2 ; SFX_04C
	filler_sounds 20

	sfx $480f, $0f, $00, 239, CHAN8, 1 ; SFX_061
	sfx $482a, $0f, $00, 237, CHAN8, 1 ; SFX_062
	sfx $484c, $0f, $00, 239, CHAN8, 1 ; SFX_063
	sfx $48a1, $0f, $00, 220, CHAN5, 1 ; SFX_064
	sfx $48b7, $0f, $00, 221, CHAN8, 1 ; SFX_065
	sfx $48cc, $0f, $00, 220, CHAN5, 1 ; SFX_066
	sfx $48eb, $0f, $00, 220, CHAN5, 1 ; SFX_067
	sfx $4906, $0f, $00, 220, CHAN8, 1 ; SFX_068
	sfx $4919, $0f, $00, 220, CHAN5, 1 ; SFX_069
	sfx $493b, $0f, $00, 220, CHAN5, 1 ; SFX_06A
	sfx $4952, $0f, $00, 220, CHAN5, 1 ; SFX_06B
	sfx $49c0, $0f, $00, 220, CHAN5, 1 ; SFX_06C
	sfx $49d5, $0f, $00, 220, CHAN8, 1 ; SFX_06D
	sfx $49f3, $0f, $00, 220, CHAN8, 1 ; SFX_06E
	sfx $4a12, $0f, $00, 220, CHAN5, 1 ; SFX_06F
	sfx $4a2d, $0f, $00, 220, CHAN5, 1 ; SFX_070
	sfx $4a46, $0f, $00, 220, CHAN8, 1 ; SFX_071
	sfx $4a7d, $0f, $00, 220, CHAN8, 1 ; SFX_072
	sfx $4a92, $0f, $00, 227, CHAN8, 1 ; SFX_073
	sfx $4ad0, $0f, $00, 221, CHAN5, 1 ; SFX_074
	sfx $4af1, $0f, $00, 220, CHAN5, 1 ; SFX_075
	sfx $4b0a, $0f, $00, 235, CHAN8, 1 ; SFX_076
	sfx $4b30, $0f, $00, 220, CHAN7, 1 ; SFX_077
	sfx $4b44, $0f, $00, 240, CHAN8, 1 ; SFX_078
	sfx $4b7a, $0f, $00, 227, CHAN8, 1 ; SFX_079
	sfx $4b97, $0f, $00, 227, CHAN8, 1 ; SFX_07A
	sfx $4bae, $0f, $00, 227, CHAN8, 1 ; SFX_07B
	sfx $4c84, $0f, $00, 220, CHAN5, 2 ; SFX_07C
	sfx $4c9d, $0f, $00, 221, CHAN8, 1 ; SFX_07D
	sfx $4cb2, $0f, $00, 239, CHAN5, 1 ; SFX_07E
	sfx $4ce7, $0f, $00, 220, CHAN5, 1 ; SFX_07F
	sfx $4d08, $0f, $00, 220, CHAN8, 1 ; SFX_080
	sfx $4d77, $0f, $00, 227, CHAN5, 1 ; SFX_081
	sfx $4e0a, $0f, $00, 220, CHAN5, 2 ; SFX_082
	sfx $4e5a, $0f, $00, 220, CHAN5, 2 ; SFX_083
	sfx $4e7b, $0f, $00, 220, CHAN5, 1 ; SFX_084
	sfx $4e90, $0f, $00, 220, CHAN7, 1 ; SFX_085
	sfx $4ead, $0f, $00, 220, CHAN5, 1 ; SFX_086
	sfx $4ec2, $0f, $00, 220, CHAN8, 1 ; SFX_087
	sfx $4f36, $0f, $00, 220, CHAN5, 2 ; SFX_088
	sfx $4f57, $0f, $00, 227, CHAN8, 1 ; SFX_089
	sfx $4fd5, $0f, $00, 227, CHAN5, 2 ; SFX_08A
	sfx $5000, $0f, $00, 220, CHAN5, 1 ; SFX_08B
	sfx $502d, $0f, $00, 227, CHAN8, 1 ; SFX_08C
	sfx $508c, $0f, $00, 220, CHAN5, 1 ; SFX_08D
	sfx $50f9, $0f, $00, 239, CHAN5, 1 ; SFX_08E
	sfx $511e, $0f, $00, 220, CHAN8, 1 ; SFX_08F
	filler_sounds 17

	sfx $5163, $0f, $00, 234, CHAN8, 1 ; SFX_0A1
	sfx $51b3, $0f, $00, 234, CHAN5, 2 ; SFX_0A2
	sfx $51c6, $0f, $00, 239, CHAN5, 1 ; SFX_0A3
	sfx $51f5, $0f, $00, 239, CHAN7, 1 ; SFX_0A4
	sfx $5206, $0f, $00, 220, CHAN5, 1 ; SFX_0A5
	sfx $524b, $0f, $00, 220, CHAN7, 1 ; SFX_0A6
	sfx $52a8, $0f, $00, 239, CHAN7, 1 ; SFX_0A7
	sfx $52f2, $0f, $00, 239, CHAN5, 2 ; SFX_0A8
	sfx $5355, $0f, $00, 239, CHAN7, 1 ; SFX_0A9
	sfx $5385, $0f, $00, 239, CHAN5, 2 ; SFX_0AA
	sfx $53a9, $0f, $00, 239, CHAN5, 1 ; SFX_0AB
	sfx $54ba, $0f, $00, 239, CHAN5, 1 ; SFX_0AC
	sfx $54d0, $0f, $00, 220, CHAN5, 1 ; SFX_0AD
	sfx $54e7, $0f, $00, 220, CHAN5, 1 ; SFX_0AE
	sfx $54fe, $0f, $00, 220, CHAN5, 1 ; SFX_0AF
	sfx $5643, $0f, $00, 220, CHAN5, 2 ; SFX_0B0
	sfx $5684, $0f, $00, 239, CHAN5, 1 ; SFX_0B1
	sfx $5726, $0f, $00, 239, CHAN5, 2 ; SFX_0B2
	sfx $575b, $0f, $00, 239, CHAN5, 1 ; SFX_0B3
	sfx $5830, $0f, $00, 239, CHAN5, 1 ; SFX_0B4
	sfx $586d, $0f, $00, 238, CHAN5, 2 ; SFX_0B5
	sfx $58ac, $0f, $00, 238, CHAN5, 2 ; SFX_0B6
	sfx $58eb, $0f, $00, 239, CHAN5, 2 ; SFX_0B7
	sfx $592a, $0f, $00, 239, CHAN5, 2 ; SFX_0B8
	sfx $594b, $0f, $00, 220, CHAN5, 1 ; SFX_0B9
	sfx $596d, $0f, $00, 220, CHAN5, 2 ; SFX_0BA
	sfx $59b3, $0f, $00, 220, CHAN5, 2 ; SFX_0BB
	sfx $59ef, $0f, $00, 239, CHAN5, 1 ; SFX_0BC
	sfx $5a97, $0f, $00, 239, CHAN5, 1 ; SFX_0BD
	sfx $5aca, $0f, $00, 239, CHAN7, 1 ; SFX_0BE
	sfx $5b17, $0f, $00, 239, CHAN7, 1 ; SFX_0BF
	sfx $5b76, $0f, $00, 239, CHAN7, 1 ; SFX_0C0
	sfx $5b96, $0f, $00, 238, CHAN5, 2 ; SFX_0C1
	sfx $5be8, $0f, $00, 230, CHAN5, 1 ; SFX_0C2
	sfx $5bf9, $0f, $00, 219, CHAN5, 1 ; SFX_0C3
	sfx $5c0a, $0f, $00, 220, CHAN5, 1 ; SFX_0C4
	sfx $5c1d, $0f, $00, 220, CHAN5, 1 ; SFX_0C5
	sfx $5c34, $0f, $00, 220, CHAN5, 1 ; SFX_0C6
	sfx $5cbc, $0f, $00, 239, CHAN5, 2 ; SFX_0C7
	sfx $5dd1, $0f, $00, 220, CHAN5, 1 ; SFX_0C8
	sfx $5de4, $0f, $00, 220, CHAN5, 1 ; SFX_0C9
	sfx $5e42, $0f, $00, 240, CHAN5, 2 ; SFX_0CA
	sfx $5e7c, $0f, $00, 239, CHAN8, 1 ; SFX_0CB
	sfx $5f77, $0f, $00, 220, CHAN5, 2 ; SFX_0CC
	sfx $6032, $0f, $00, 220, CHAN5, 3 ; SFX_0CD
	sfx $60c1, $0f, $00, 240, CHAN5, 2 ; SFX_0CE
	sfx $617f, $0f, $00, 220, CHAN5, 2 ; SFX_0CF
	sfx $623a, $0f, $00, 239, CHAN5, 1 ; SFX_0D0
	sfx $629e, $0f, $00, 239, CHAN5, 2 ; SFX_0D1
	filler_sounds 15

	sfx $62b7, $0f, $00, 255, CHAN5, 1 ; SFX_0E1
	sfx $62c8, $0f, $00, 220, CHAN5, 1 ; SFX_0E2
	sfx $62e8, $0f, $00, 220, CHAN5, 1 ; SFX_0E3
	sfx $6303, $0f, $00, 251, CHAN5, 1 ; SFX_0E4
	sfx $6333, $0f, $00, 230, CHAN5, 2 ; SFX_0E5
	sfx $6356, $0f, $00, 227, CHAN6, 1 ; SFX_0E6
	sfx $6376, $0f, $00, 220, CHAN5, 1 ; SFX_0E7
	sfx $6412, $0f, $00, 220, CHAN5, 1 ; SFX_0E8
	sfx $6440, $0f, $00, 220, CHAN5, 1 ; SFX_0E9
	sfx $646e, $0f, $00, 220, CHAN5, 1 ; SFX_0EA
	sfx $64bf, $0f, $00, 220, CHAN5, 2 ; SFX_0EB
	sfx $64d4, $0f, $00, 220, CHAN7, 1 ; SFX_0EC
	sfx $6506, $0f, $00, 220, CHAN8, 1 ; SFX_0ED
	sfx $6558, $0f, $00, 220, CHAN5, 1 ; SFX_0EE
	sfx $657b, $0f, $00, 237, CHAN5, 1 ; SFX_0EF
	sfx $65b4, $0f, $00, 220, CHAN5, 1 ; SFX_0F0
	sfx $65c9, $0f, $00, 237, CHAN5, 1 ; SFX_0F1
	sfx $65dc, $0f, $00, 220, CHAN5, 1 ; SFX_0F2
	sfx $65ef, $0f, $00, 220, CHAN8, 1 ; SFX_0F3
	sfx $6610, $0f, $00, 220, CHAN5, 1 ; SFX_0F4
	sfx $663d, $0f, $00, 220, CHAN8, 1 ; SFX_0F5
	sfx $6654, $0f, $00, 220, CHAN8, 1 ; SFX_PLANE1
	sfx $666b, $0f, $00, 220, CHAN8, 1 ; SFX_PLANE2
	sfx $6682, $0f, $00, 220, CHAN8, 1 ; SFX_PLANE3
	sfx $66a5, $0f, $00, 220, CHAN8, 1 ; SFX_PLANE_EXPLOSION
	sfx $673f, $0f, $00, 239, CHAN5, 3 ; SFX_0FA
	filler_sounds 6

	sfx $678c, $0f, $00, 220, CHAN8, 1 ; SFX_101
	sfx $67c1, $0f, $00, 220, CHAN5, 1 ; SFX_102
	sfx $67da, $0f, $00, 220, CHAN8, 1 ; SFX_103
	sfx $6839, $0f, $00, 220, CHAN5, 1 ; SFX_104
	sfx $6972, $0f, $00, 220, CHAN5, 2 ; SFX_105
	sfx $6988, $0f, $00, 237, CHAN7, 1 ; SFX_106
	sfx $69a1, $0f, $00, 219, CHAN5, 1 ; SFX_107
	sfx $6a09, $0f, $00, 220, CHAN5, 1 ; SFX_108
	sfx $6a29, $0f, $00, 220, CHAN5, 2 ; SFX_109
	sfx $6a4d, $0f, $00, 220, CHAN8, 1 ; SFX_10A
	sfx $6a5e, $0f, $00, 220, CHAN5, 1 ; SFX_10B
	sfx $6ac5, $0f, $00, 220, CHAN8, 1 ; SFX_10C
	sfx $6ae2, $0f, $00, 236, CHAN5, 1 ; SFX_10D
	sfx $6b57, $0f, $00, 220, CHAN5, 2 ; SFX_10E
	sfx $6b72, $0f, $00, 220, CHAN8, 1 ; SFX_10F
	sfx $6ba2, $0f, $00, 220, CHAN5, 2 ; SFX_110
	sfx $6bba, $0f, $00, 220, CHAN8, 1 ; SFX_111
	sfx $6c49, $0f, $00, 220, CHAN5, 3 ; SFX_112
	sfx $6c70, $0f, $00, 220, CHAN5, 1 ; SFX_113
	sfx $6c86, $0f, $00, 220, CHAN8, 1 ; SFX_114
	sfx $6c9c, $0f, $00, 220, CHAN8, 1 ; SFX_115
	sfx $6cb2, $0f, $00, 220, CHAN8, 1 ; SFX_116
	sfx $6cf5, $0f, $00, 220, CHAN5, 2 ; SFX_117
	sfx $6d32, $0f, $00, 220, CHAN5, 2 ; SFX_118
	sfx $6d7c, $0f, $00, 220, CHAN5, 1 ; SFX_119
	sfx $6d9d, $0f, $00, 220, CHAN5, 1 ; SFX_11A
	sfx $6ef2, $0f, $00, 220, CHAN5, 2 ; SFX_11B
	sfx $6f2d, $0f, $00, 220, CHAN5, 1 ; SFX_11C
	sfx $6f94, $0f, $00, 220, CHAN5, 1 ; SFX_11D
	sfx $6fcb, $0f, $00, 220, CHAN5, 2 ; SFX_11E
	sfx $7009, $0f, $00, 220, CHAN5, 2 ; SFX_11F
	sfx $7042, $0f, $00, 220, CHAN5, 2 ; SFX_120
	sfx $707f, $0f, $00, 220, CHAN5, 2 ; SFX_121
	sfx $70a4, $0f, $00, 220, CHAN5, 1 ; SFX_122
	sfx $70cd, $0f, $00, 220, CHAN5, 1 ; SFX_123
	sfx $70fe, $0f, $00, 220, CHAN8, 1 ; SFX_124
	sfx $710f, $0f, $00, 220, CHAN8, 1 ; SFX_125
	sfx $7120, $0f, $00, 220, CHAN8, 1 ; SFX_126
	sfx $7154, $0f, $00, 220, CHAN6, 2 ; SFX_127
	sfx $71a7, $0f, $00, 220, CHAN5, 1 ; SFX_128
	sfx $71c0, $0f, $00, 239, CHAN8, 1 ; SFX_129
	sfx $71d9, $0f, $00, 220, CHAN8, 1 ; SFX_12A
	sfx $71ea, $0f, $00, 220, CHAN7, 1 ; SFX_12B
	sfx $720a, $0f, $00, 220, CHAN5, 2 ; SFX_12C
	sfx $7229, $0f, $00, 220, CHAN8, 1 ; SFX_12D
	sfx $72a5, $0f, $00, 220, CHAN5, 4 ; SFX_12E
	sfx $72c9, $0f, $00, 220, CHAN8, 1 ; SFX_12F
	sfx $72de, $0f, $00, 220, CHAN8, 1 ; SFX_130
	sfx $72f3, $0f, $00, 220, CHAN8, 1 ; SFX_131
	sfx $7308, $0f, $00, 220, CHAN5, 1 ; SFX_132
	sfx $731b, $0f, $00, 220, CHAN7, 1 ; SFX_133
	sfx $732c, $0f, $00, 220, CHAN5, 1 ; SFX_134
	sfx $734d, $0f, $00, 220, CHAN5, 1 ; SFX_135
	sfx $7362, $0f, $00, 236, CHAN6, 1 ; SFX_136
	sfx $7375, $0f, $00, 226, CHAN8, 1 ; SFX_137
	sfx $738e, $0f, $00, 220, CHAN8, 1 ; SFX_138
; 0x32726

	pitch_offset $00
	tempo $37
	wave $63
	vibrato_speed $14
	vibrato_delay $05
	vibrato_amplitude $0a
	set_vibrato_disabled FALSE
	audiocmd_bf $6c
	audio_wait_96
	audio_wait_96
	audiocmd_bf $6c
	wave $63
	note NOTE_DURATION_92, A_1, 24
	audio_wait_18
	fade_out $86
	fade_in $37
	audio_wait_12

	INCROM $32745, $32a98

Music_OutOfTheWoodsDay: ; 32a98 (c:6a98)
	db $4, $2
	dw $6726 ; channel1
	dw $685e ; channel2
	dw $6918 ; channel3
	dw $6a09 ; channel4

	INCROM $32aa2, $33de9

REPT $217
	db $00
ENDR
