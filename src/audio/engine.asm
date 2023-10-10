_InitAudio::
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

	ld a, AUDENA_ON
	ldh [rAUDENA], a
	ld a, $00
	ldh [rAUDTERM], a
	ld a, %1000
	ldh [rAUD1ENV], a
	ldh [rAUD2ENV], a
	ldh [rAUD4ENV], a
	ld a, AUDHIGH_RESTART
	ldh [rAUD1HIGH], a
	ldh [rAUD2HIGH], a
	ldh [rAUD4GO], a
	ld a, AUD3ENA_OFF
	ldh [rAUD3ENA], a
	ld a, $ff
	ldh [rAUDTERM], a
	ld a, MAX_VOLUME
	ldh [rAUDVOL], a
	ld a, $00
	ld [wAudioEngineFlags], a

	jp SwitchBackFromAudioBank

Func_3007a::
	push bc
	push de
	call Func_30527

	ld hl, wAudioEngineFlags
	set AUDIOENG_UNK5_F, [hl]

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
	res AUDIOENG_UNK5_F, [hl]

	ld hl, w3d00c
	ld a, [hli]
	add [hl] ; w3d00d
	ld [hli], a
	ld a, 0
	adc [hl]
	ld [hld], a
	ld a, [hli] ; w3d00d
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
	and CHANFLAGS_ACTIVE | CHANFLAGS_6 | CHANFLAGS_5 | CHANFLAGS_UPDATE_PERCUSSION | CHANFLAGS_3
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

SetSFXChannels:
	ld de, wChannels
	ld a, NUM_SFX_CHANS
	jr SetAudioChannels

SetMusicChannels:
	ld de, wMusicChannels
	ld a, NUM_MUSIC_CHANS
	jr SetAudioChannels

	ld de, wChannel1
	ld a, NUM_CHANNELS
	; fallthrough

SetAudioChannels:
	ld hl, wNumAudioChannels
	ld [hli], a
	ld a, e
	ld [hli], a ; wCurChannelPtr
	ld [hl], d
	ret

; adds CHANNEL_STRUCT_LENGTH to wCurChannelPtr
; to point to the next channel
; decrements wNumAudioChannels
NextChannel:
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

SetTrack1:
	ld de, wTrack1
	ld a, 1
	ld c, LOW(rAUD1ENV)
	jr SetTrack

SetTrack2:
	ld de, wTrack2
	ld a, 1
	ld c, LOW(rAUD2ENV)
	jr SetTrack

SetTrack3:
	ld de, wTrack3
	ld a, 1
	ld c, LOW(rAUD3LEVEL)
	jr SetTrack

SetTrack4:
	ld de, wTrack4
	ld a, 1
	ld c, LOW(rAUD4ENV)
	jr SetTrack

SetAllTracks:
	ld de, wTrack1
	ld a, NUM_TRACKS
	ld c, LOW(rAUD1ENV)
	; fallthrough

; a = number of tracks
; de = pointer to first track
; c = sound register for this track
SetTrack:
	ld hl, wNumTracks
	ld [hli], a
	ld a, e
	ld [hli], a ; wCurTrackPtr
	ld a, d
	ld [hli], a
	ld [hl], c ; wCurSoundRegister
	ret

NextTrack:
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

; bc = sound ID
_PlaySFX::
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
	bit CHANFLAGS_ACTIVE_F, [hl]
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
	bit CHANFLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
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

; bc = sound ID
PlayMusic::
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

; bc = sound ID
Func_302b8::
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

; plays music if different from the one currently playing
; if the ID is the same, then set flag in noise channels
; bc = sound ID
_PlayNewMusic_SetNoise::
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

.asm_302e4::
	xor a
	ld [w3d025], a
	call SetMusicChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl]
	and CHANFLAGS_6 | CHANFLAGS_5 ; CHANNEL_FLAGS
	jr z, .next_ch
	set CHANFLAGS_ACTIVE_F, [hl]
.next_ch
	call NextChannel
	jr nz, .loop_chs
	jp Func_3f8d

; loads the sound data of wCurSoundID
; bc = sound ID
GetSound:
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

LoadChannelWithSound:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, CHANFLAGS_ACTIVE | CHANFLAGS_5
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
SkipLoadingChannel:
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

InitChannel:
	ld a, CHANFLAGS_6 | CHANFLAGS_ACTIVE
	ld [hli], a ; CHANNEL_FLAGS
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
	ld [hli], a ; CHANNEL_FADE_IN_ENVELOPE
	ld [hli], a ; CHANNEL_FADE_OUT_ENVELOPE
	xor a
	ld [hli], a ; CHANNEL_ACTIVE_COMMAND
	ld [hli], a ; CHANNEL_SEMITONE_OFFSET
	ld [hli], a ; CHANNEL_UNK_13
	ld [hli], a
	ld a, $ff
	ld [hli], a ; CHANNEL_VOLUME
	ld a, $40
	ld [hli], a ; CHANNEL_UNK_16
	xor a
	ld [hli], a ; CHANNEL_SO1
	ld [hli], a ; CHANNEL_SO2
	ld [hli], a ; CHANNEL_PITCH_OFFSET
	ld a, $02
	ld [hli], a ; CHANNEL_PITCH_OFFSET_MULT
	xor a
	ld [hli], a ; CHANNEL_PITCH_PRODUCT
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
	ld [hli], a ; CHANNEL_FREQUENCY
	ld [hli], a
	ld [hli], a ; CHANNEL_SO_FLAGS
	ld [hli], a ; CHANNEL_UNK_2F
	ld a, $ff
	ld [hli], a ; CHANNEL_UNK_30
	ret

; bc = sound ID
Func_303c9::
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
	bit CHANFLAGS_ACTIVE_F, a
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

TurnSFXOff:
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

Func_30416::
	call TurnMusicOff
	jp Func_3f8d

Func_3041c:
	xor a
	ld [w3d020], a
	; fallthrough

TurnMusicOff:
	ld a, $ff
	ld [w3d025], a
	call SetMusicChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	res CHANFLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
	call NextChannel
	jr nz, .loop_chs
	ret

Func_30438::
	ld a, [wActiveChannels]
	and $0f
	ld d, a
	ld a, [wActiveChannels]
	and $f0
	swap a
	ld e, a
	jp Func_3f8d

Func_30449::
	and a
	jr nz, .asm_3045d
	ld a, [wActiveChannels]
	and $f0
	jr z, .asm_30461
	ld a, [wLoadedMusic + 0]
	ld c, a
	ld a, [wLoadedMusic + 1]
	ld b, a
	jr .asm_30485
.asm_3045d
	cp $05
	jr c, .asm_30466
.asm_30461
	ld bc, $0
	jr .asm_30485
.asm_30466
	ld bc, .channel_pointers - $2
	sla a
	add c
	ld c, a
	ld a, $00
	adc b
	ld b, a
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	ld bc, $0
	bit 7, [hl]
	jr z, .asm_30485
	ld bc, $6
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_30485
	jp Func_3f8d

.channel_pointers
	dw wChannel1
	dw wChannel2
	dw wChannel3
	dw wChannel4

PointerTable_30490:
	dw Func_30802
	dw Func_30829
	dw Func_30930
	dw Func_3094b
	dw Func_3097a
	dw Func_308f1
	dw Func_309b6

Func_3049e::
	call Func_304a4
	jp Func_3f8d

Func_304a4:
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

Func_304bc:
	call Func_304fa
.loop_chs
	rrc d
	jr nc, .next_ch
	bit CHANFLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
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

Func_304d9:
	call Func_304fa
.loop_chs
	rrc d
	jr nc, .next_ch
	bit CHANFLAGS_ACTIVE_F, [hl] ; CHANNEL_FLAGS
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

; output:
; - d = (w3d03a low nibble << 4) | w3d03b low nibble
; - e = NUM_CHANNELS
; - hl = wChannels
Func_304fa:
	ld a, [w3d03b]
	and $0f
	ld d, a ; low nibble
	ld a, [w3d03a]
	swap a
	and $f0 ; *16
	or d
	ld d, a
	ld e, NUM_CHANNELS
	ld hl, wChannels
	ret

AddChannelStructLengthToHL:
	ld a, CHANNEL_STRUCT_LENGTH
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec e
	ret

Func_30519::
	ld [w3d020], a
	ld [w3d021], a
	ld a, $40
	ld [w3d022], a
	jp Func_3f8d

Func_30527:
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

Func_30547:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl] ; CHANNEL_FLAGS
	cp CHANFLAGS_ACTIVE | CHANFLAGS_6
	ret c
	ld [wCurChannelFlags], a
	jp Func_30651

UpdateChannel:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl]
	bit CHANFLAGS_ACTIVE_F, a
	ret z ; not active
	bit CHANFLAGS_6_F, a
	jr nz, .skip_init
	push hl
	call InitChannel
	pop hl
	ld a, [hl]
.skip_init
	ld [wCurChannelFlags], a
	inc hl
	ld a, [hl] ; CHANNEL_DURATION
	and a
	jr z, .do_audio_cmds
	dec [hl]
	inc hl
	jr UpdateVibrato

.do_audio_cmds
	inc hl
	ld a, [hli] ; CHANNEL_CMD_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli] ; CHANNEL_SOUND_BANK
	ld [wSoundBank], a
	; fallthrough

DoAudioCommand:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_ACTIVE_COMMAND
	add hl, bc
	call ReadAudioCommands_2Bytes
	bit 7, c
	jr nz, .new_cmd

; previous cmd
	ld a, c
	ld [wAudioCmdArg], a
	dec de
	ld a, [hl]
	jr .got_cmd

.new_cmd
	ld a, b
	ld [wAudioCmdArg], a
	ld a, c
	cp $be
	jr c, .got_cmd ; if < $be
	ld [hl], a ; CHANNEL_ACTIVE_COMMAND

.got_cmd
	cp $d0
	jp nc, Func_30a14 ; if >= $d0
	sub $b1
	jp c, Func_3073f
	ld bc, PointerTable_306d1
	; fallthrough

; bc = pointer table
; a = index to jump to
JumpToPointerInTable:
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

AudioCmd_ClearFlags:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	xor a
	ld [hli], a
	ret

UpdateVibrato:
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
	call MultiplyBByC
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
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_FREQUENCY_F, a
	ld [wCurChannelFlags], a
	ld [hl], c
.asm_30636
	inc hl
	ld a, b
	cp [hl] ; CHANNEL_UNK_25
	jr z, .asm_30644
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_FREQUENCY_F, a
	ld [wCurChannelFlags], a
	ld [hl], b
.asm_30644
	jr .skip_vibrato ; unnecessary jump

.skip_vibrato
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [wCurChannelFlags]
;	fallthrough

; hl = channel
Func_30651:
	bit CHANFLAGS_UPDATE_FREQUENCY_F, a
	jr z, .asm_30691
	ld bc, CHANNEL_UNK_1D
	add hl, bc
	ld e, [hl]
	ld a, 0
	sla e
	sbc a
	ld d, a ; (e > $80) ? $ff : $00

	ld bc, CHANNEL_PITCH_PRODUCT - CHANNEL_UNK_1D
	add hl, bc
	ld a, [hli]
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a

	ld bc, CHANNEL_UNK_13 - CHANNEL_PITCH_PRODUCT
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
	cp FALSE
	jr nz, .asm_30683
	ld a, [hli] ; CHANNEL_UNK_24
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a

.asm_30683
	ld bc, CHANNEL_FREQUENCY - CHANNEL_UNK_24
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d

	ld bc, -(CHANNEL_FREQUENCY + 1)
	add hl, bc
	ld a, [wCurChannelFlags]

.asm_30691
	bit CHANFLAGS_UPDATE_SO_F, a
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
	ld a, [wCurChannelFlags]

.asm_306a8
	bit CHANFLAGS_UPDATE_VOLUME_F, a
	jr z, .done
	ld bc, CHANNEL_VOLUME
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl] ; CHANNEL_UNK_16
	call MultiplyBByC_Short
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

	ld a, [wCurChannelFlags]
.done
	ld [hl], a
	ret

PointerTable_306d1:
	dw AudioCmd_ClearFlags                ; b1
	dw AudioCmd_Jump                      ; b2
	dw AudioCmd_Call                      ; b3
	dw AudioCmd_Ret                       ; b4
	dw AudioCmd_Loop                      ; b5
	dw InvalidAudioCmd                    ; b6
	dw InvalidAudioCmd                    ; b7
	dw InvalidAudioCmd                    ; b8
	dw AudioCmd_ClearFlags                ; b9
	dw AudioCmd_ClearFlags                ; ba
	dw AudioCmd_ClearFlags                ; bb
	dw AudioCmd_SetTempo                  ; bc
	dw AudioCmd_SetSemitoneOffset         ; bd
	dw AudioCmd_SetWave                   ; be
	dw AudioCmd_SetChannelVolume          ; bf
	dw Func_3093e                         ; c0
	dw AudioCmd_SetPitchOffset            ; c1
	dw AudioCmd_SetPitchOffsetMultiplier  ; c2
	dw AudioCmd_SetVibratoSpeed           ; c3
	dw AudioCmd_SetVibratoDelay           ; c4
	dw AudioCmd_SetVibratoAmplitude       ; c5
	dw AudioCmd_SetChannelVibratoDisabled ; c6
	dw InvalidAudioCmd                    ; c7
	dw InvalidAudioCmd                    ; c8
	dw Func_30980                         ; c9
	dw AudioCmd_SetChannelUnk1e           ; ca
	dw InvalidAudioCmd                    ; cb
	dw AudioCmd_ClearFlags                ; cc
	dw Func_30727                         ; cd
	dw Func_30a10                         ; ce
	dw Func_30b4d                         ; cf

PointerTable_3070f:
	dw AudioCmd_ClearFlags           ; 00
	dw AudioCmd_SetChannelTimbre     ; 01
	dw AudioCmd_SetChannelFadeInEnvelope ; 02
	dw Func_309e8                    ; 03
	dw Func_30a03                    ; 04
	dw AudioCmd_SetChannelFadeOutEnvelope ; 05
	dw AudioCmd_SetChannelUnk27      ; 06
	dw AudioCmd_SetChannelUnk28      ; 07
	dw InvalidAudioCmd                    ; 08
	dw InvalidAudioCmd                    ; 09
	dw AudioCmd_SetChannelDuration   ; 0a
	dw AudioCmd_SetChannelSweep      ; 0b

Func_30727:
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

Func_3073f:
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
	jp UpdateVibrato

AudioCmd_Call:
; audio_call
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

AudioCmd_Jump:
; audio_jump
	call ReadAudioCommands_2Bytes
	ld e, c
	ld d, b
	jp DoAudioCommand

AudioCmd_Ret:
; audio_ret
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

AudioCmd_Loop:
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

AudioCmd_SetTempo:
; tempo
	ld hl, wAudioEngineFlags
	bit AUDIOENG_UNK5_F, [hl]
	ld hl, wMusicTempo
	jr z, .not_set
	ld hl, wSFXTempo
.not_set
	ld a, [wAudioCmdArg]
	inc de
	ld [hl], a
	call Func_307e4
	jp DoAudioCommand

Func_307e4:
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	call MultiplyBByC
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

Func_30802:
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

AudioCmd_SetSemitoneOffset:
; semitone_offset
	ld bc, CHANNEL_SEMITONE_OFFSET
	jp SetChannelProperty

Func_30829:
	ld a, [wNumChannels]
	set 2, a
	ld [wNumChannels], a
	ld bc, CHANNEL_UNK_13
	jp Func_304d9

AudioCmd_SetWave:
; wave
	ld a, [wAudioCmdArg]
	inc de
	cp WAVE_28
	jr z, .percussion

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
	ld a, [hli] ; fade in envelope
	ld [bc], a
	inc bc
	ld a, [hli] ; fade out envelope
	ld [bc], a

	ld a, [wCurChannelFlags]
	res CHANFLAGS_UPDATE_PERCUSSION_F, a
	ld [wCurChannelFlags], a
	jp DoAudioCommand

.percussion
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_PERCUSSION_F, a
	ld [wCurChannelFlags], a
	jp DoAudioCommand

GetWave:
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

AudioCmd_SetPitchOffset:
; pitch_offset
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_PITCH_OFFSET
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	rlca
	sub $80
	ld [hli], a
	ld b, a
	ld a, [hli] ; CHANNEL_PITCH_OFFSET_MULT
	ld c, a
;	fallthrough

; b = pitch offset
; c = pitch offset multiplier
CalculatePitchProduct:
	push hl
	sla b
	jr c, .negative
	call MultiplyBByC
	ld c, l
	ld b, h
	jr .got_product
.negative
	ld a, b
	cpl
	ld b, a
	call MultiplyBByC
	dec hl
	ld a, l
	cpl
	ld c, a
	ld a, h
	cpl
	ld b, a

.got_product
	pop hl
	ld a, c
	ld [hli], a ; CHANNEL_PITCH_PRODUCT
	ld [hl], b
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_FREQUENCY_F, a
	ld [wCurChannelFlags], a
	jp DoAudioCommand

AudioCmd_SetPitchOffsetMultiplier:
; pitch_offset_mult
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_PITCH_OFFSET_MULT
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	ld [hld], a
	ld c, a
	ld a, [hli] ; CHANNEL_PITCH_OFFSET
	ld b, a
	inc hl
	jr CalculatePitchProduct

AudioCmd_SetVibratoSpeed:
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

Func_308f1:
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

AudioCmd_SetVibratoDelay:
; vibrato_delay
	ld bc, CHANNEL_VIBRATO_DELAY
	jr SetChannelProperty

AudioCmd_SetChannelVolume:
; volume
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_VOLUME_F, a
	ld [wCurChannelFlags], a

	ld bc, CHANNEL_VOLUME
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

Func_30930:
	ld a, [wNumChannels]
	set 1, a
	ld [wNumChannels], a
	ld bc, CHANNEL_UNK_16
	jp Func_304bc

Func_3093e:
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_SO_F, a
	ld [wCurChannelFlags], a
	ld bc, CHANNEL_SO1
	jr Func_3098b

Func_3094b:
	ld a, [wNumChannels]
	set 0, a
	ld [wNumChannels], a
	ld bc, CHANNEL_SO2
	jp Func_304bc

AudioCmd_SetVibratoAmplitude:
; vibrato_amplitude
	ld bc, CHANNEL_VIBRATO_AMPLITUDE
;	fallthrough

SetChannelProperty:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [wAudioCmdArg]
	inc de
	ld [hl], a
	jp DoAudioCommand

AudioCmd_SetChannelVibratoDisabled:
; vibrato_disabled
	ld a, [wCurChannelFlags]
	or CHANFLAGS_UPDATE_SO | CHANFLAGS_UPDATE_VOLUME | CHANFLAGS_UPDATE_FREQUENCY
	ld [wCurChannelFlags], a
	ld bc, CHANNEL_VIBRATO_DISABLED
	jr SetChannelProperty

Func_3097a:
	ld bc, CHANNEL_UNK_22
	jp Func_304bc

Func_30980:
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_FREQUENCY_F, a
	ld [wCurChannelFlags], a
	ld bc, CHANNEL_UNK_1D
;	fallthrough

Func_3098b:
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

AudioCmd_SetChannelUnk1e:
; audiocmd_ca
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_FREQUENCY_F, a
	ld [wCurChannelFlags], a
	ld bc, CHANNEL_UNK_1E
	jr SetChannelProperty

AudioCmd_SetChannelUnk27:
; audiocmd_d6
	ld bc, CHANNEL_UNK_27
	jr SetChannelProperty

AudioCmd_SetChannelUnk28:
; audiocmd_d7
	ld bc, CHANNEL_UNK_28
	jr SetChannelProperty

Func_309b6:
	ld bc, CHANNEL_UNK_27
	jp Func_304d9

AudioCmd_SetChannelTimbre:
; set_timbre
	ld bc, CHANNEL_TIMBRE
	jr SetChannelProperty

AudioCmd_SetChannelDuration:
; set_duration
	ld bc, CHANNEL_LENGTH
	jr SetChannelProperty

AudioCmd_SetChannelSweep:
; set_sweep
	ld bc, CHANNEL_SWEEP
	jr SetChannelProperty

AudioCmd_SetChannelFadeInEnvelope:
; fade_in
	ld bc, CHANNEL_FADE_IN_ENVELOPE
;	fallthrough

Func_309ce:
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

Func_309e8:
	ld bc, CHANNEL_FADE_IN_ENVELOPE
;	fallthrough

Func_309eb:
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

Func_30a03:
	ld bc, CHANNEL_FADE_OUT_ENVELOPE
	jr Func_309ce

AudioCmd_SetChannelFadeOutEnvelope:
	ld bc, CHANNEL_FADE_OUT_ENVELOPE
	jr Func_309eb

InvalidAudioCmd:
	jp AudioCmd_ClearFlags

Func_30a10:
	ld b, $00
	jr Func_30a1f

Func_30a14:
	sub $cf
	add LOW(Data_3102b)
	ld l, a
	ld a, 0
	adc HIGH(Data_3102b)
	ld h, a
	ld b, [hl]
;	fallthrough

Func_30a1f:
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
	ld bc, CHANNEL_SEMITONE_OFFSET - CHANNEL_PITCH
	add hl, bc
	add [hl] ; add pitch offset
	ld [w3d03a], a
	ld [w3d03b], a
	ld bc, CHANNEL_VIBRATO_DELAY - CHANNEL_SEMITONE_OFFSET
	add hl, bc
	ld a, [hli]
	ld [hld], a ; CHANNEL_VIBRATO_COUNTER
	ld bc, CHANNEL_TIMBRE - CHANNEL_VIBRATO_DELAY
	add hl, bc

	ld a, [wCurChannelFlags]
	bit CHANFLAGS_UPDATE_PERCUSSION_F, a
	jr z, .asm_30aa5
	push hl
	ld e, l
	ld d, h
	ld a, [w3d03a]
	add $4
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
	ld [de], a ; CHANNEL_FADE_IN_ENVELOPE
	inc de
	ld a, [hli]
	ld [de], a ; CHANNEL_FADE_OUT_ENVELOPE
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
	bit AUDIOENG_UNK5_F, [hl]
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
	ld a, [hli] ; TRACK_FLAGS
	and a
	jr z, .UpdateTrack
	bit TRACKFLAGS_5_F, a
	jr nz, .asm_30af7
	jr .UpdateTrack

.asm_30af7
	ld a, [hli] ; TRACK_PRIORITY
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

	ld a, TRACKFLAGS_4 | TRACKFLAGS_5 | TRACKFLAGS_6 | TRACKFLAGS_7
	ld [hli], a ; TRACK_FLAGS
	ld a, [wCurSoundID + 0]
	ld [hli], a ; TRACK_PRIORITY
	ld a, [wCurSoundID + 1]
	ld [hli], a ; TRACK_UNK02
	ld a, [w3d03a]
	ld [hli], a ; TRACK_UNK03
	ld a, e
	ld [hli], a ; TRACK_CHANNEL_PTR
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
	ld [hli], a ; TRACK_FADE_IN_ENVELOPE
	inc de
	ld a, [de]
	ld [hli], a ; TRACK_FADE_OUT_ENVELOPE
	xor a
	ld [hli], a ; TRACK_UNK0D
	ld a, [w3d03b]
	ld [hl], a ; TRACK_UNK0E
.skip
	pop de
	jp DoAudioCommand

Func_30b4d:
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
	ld [hl], a ; CHANNEL_PITCH
.asm_30b66
	ld a, [hl] ; CHANNEL_PITCH
	ld bc, CHANNEL_SEMITONE_OFFSET - CHANNEL_PITCH
	add hl, bc
	add [hl]
	ld [w3d03a], a

	push de
	call SetAllTracks
	ld a, [wNumAudioChannels]
	ld hl, wAudioEngineFlags
	bit AUDIOENG_UNK5_F, [hl]
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
	ld a, [hli] ; TRACK_FLAGS
	bit TRACKFLAGS_5_F, a
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

Func_30bb0:
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	bit TRACKFLAGS_7_F, [hl] ; TRACK_FLAGS
	ret z
	inc hl
	inc hl
	bit 7, [hl] ; TRACK_UNK02
	ret z
	jr Func_30bd2

Func_30bc2:
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	bit TRACKFLAGS_7_F, [hl] ; TRACK_FLAGS
	ret z
	inc hl
	inc hl
	bit 7, [hl] ; TRACK_UNK02
	ret nz
	; fallthrough

Func_30bd2:
	inc hl
	inc hl
	ld a, [hli] ; TRACK_CHANNEL_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	cp TRACKFLAGS_6 | TRACKFLAGS_7
	jr c, Func_30bf2
	inc hl
	ld a, [hl] ; TRACK_DURATION
	and a
	ret z
	dec [hl]
	ret nz
;	fallthrough

Func_30be3:
	ld bc, TRACK_FLAGS - TRACK_DURATION
	add hl, bc
	ld a, [hl] ; TRACK_FLAGS
	bit TRACKFLAGS_6_F, a
	jr nz, Func_30bf6
	or TRACKFLAGS_4 | TRACKFLAGS_6
	and $ff ^ TRACKFLAGS_5
	ld [hl], a
	ret

Func_30bf2:
	ld bc, TRACK_FLAGS - (TRACK_CHANNEL_PTR + 2)
	add hl, bc
	; fallthrough

Func_30bf6:
	xor a
	ld [hl], a
	jp TurnSoundRegisterOff

Func_30bfb:
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld a, [hl]
	bit 7, a
	ret z

	ld b, a
	push hl
	ld de, TRACK_CHANNEL_PTR
	add hl, de
	ld a, [hli]
	ld [wCurChannelPtr + 0], a
	ld e, a
	ld a, [hli]
	ld [wCurChannelPtr + 1], a
	ld d, a
	ld a, [de]
	cp CHANFLAGS_ACTIVE | CHANFLAGS_6
	jr nc, .asm_30c1f
	pop hl
	jr Func_30bf6

.asm_30c1f
	ld [wCurChannelFlags], a
	bit CHANFLAGS_6_F, b
	jr nz, .asm_30c46
	ld de, TRACK_FREQUENCY - (TRACK_CHANNEL_PTR + 2)
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

	ld a, [wCurChannelFlags]
	or CHANFLAGS_UPDATE_SO | CHANFLAGS_UPDATE_VOLUME | CHANFLAGS_UPDATE_FREQUENCY
	ld [wCurChannelFlags], a
	call .Func_30dc6

; fade in
	ld bc, TRACK_FADE_IN_ENVELOPE
	add hl, bc
	ld a, [hl]
	ld bc, TRACK_VOLUME_ENVELOPE - TRACK_FADE_IN_ENVELOPE
	add hl, bc
	swap a
	cpl
	rrca
	and %111 ; bits 7, 6, and 5 of TRACK_FADE_IN_ENVELOPE
	jr z, .asm_30cba
	or %1000 ; amplify
	ld [hli], a ; TRACK_VOLUME_ENVELOPE
	xor a
	ld [hli], a ; TRACK_FREQUENCY low
	jp .asm_30d9d

.fade_out
	ld bc, TRACK_FADE_OUT_ENVELOPE
	add hl, bc
	ld b, [hl]
	ld de, TRACK_VOLUME_ENVELOPE - TRACK_FADE_OUT_ENVELOPE
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
	ld a, [wCurChannelFlags]
	bit CHANFLAGS_UPDATE_VOLUME_F, a
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
	ld bc, TRACK_FADE_IN_ENVELOPE - TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld b, [hl]
	ld de, TRACK_VOLUME - TRACK_FADE_IN_ENVELOPE
	add hl, de
	ld c, [hl]
	push bc
	ld bc, TRACK_FLAGS - TRACK_VOLUME
	add hl, bc
	res TRACKFLAGS_4_F, [hl]
	call .Func_30deb
	ld d, a
	ld bc, TRACK_VOLUME_ENVELOPE
	add hl, bc
	pop bc
	ld a, b
	cpl
	rrca
	and %111 ; bits 3, 2, and 1 of TRACK_FADE_IN_ENVELOPE
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
	ld a, [wCurChannelFlags]
	bit CHANFLAGS_UPDATE_VOLUME_F, a
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
	call MultiplyBByC_Short
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
	cp LOW(rAUD3LEVEL)
	jr z, .asm_30d9d
	ld a, [wCurChannelFlags]
	res CHANFLAGS_UPDATE_VOLUME_F, a
	ld [wCurChannelFlags], a
	jr .asm_30d9d

.asm_30d95
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_VOLUME_F, a
	ld [wCurChannelFlags], a

.asm_30d9d
	ld a, [wCurChannelFlags]
	bit CHANFLAGS_UPDATE_FREQUENCY_F, a
	jr z, .skip_frequency
	call SetFrequency
	ld a, [wCurChannelFlags]
.skip_frequency

	bit CHANFLAGS_UPDATE_SO_F, a
	jr z, .skip_so
	call SetSoundOutput
	ld a, [wCurChannelFlags]
.skip_so

	bit 1, a
	ret z ; skip envelope
	jp SetVolumeEnvelope

.CheckEnvelopeValue
	ld bc, TRACK_FADE_OUT_ENVELOPE - TRACK_VOLUME_ENVELOPE
	add hl, bc
	ld a, [hl]
	ld bc, TRACK_VOLUME_ENVELOPE - TRACK_FADE_OUT_ENVELOPE
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
	call MultiplyBByC_Short
	add $0f
	and $f0
	pop hl
	ld de, TRACK_VOLUME
	add hl, de
	ld [hl], a
	ld de, TRACK_FLAGS - TRACK_VOLUME
	add hl, de
	ret

.Func_30deb
	push hl
	ld bc, TRACK_FADE_OUT_ENVELOPE
	add hl, bc
	ld b, [hl]
	ld de, TRACK_UNK06 - TRACK_FADE_OUT_ENVELOPE
	add hl, de
	ld c, [hl]
	call MultiplyBByC_Short
	add $0f
	ld c, a
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld de, CHANNEL_UNK_2F
	add hl, de
	ld b, [hl]
	call MultiplyBByC_Short
	add $0f
	and $f0
	pop hl
	ld de, TRACK_VOLUME
	add hl, de
	ld [hl], a
	ld de, TRACK_FLAGS - TRACK_VOLUME
	add hl, de
	ret

.Func_30e1b
	ld b, a
	ld a, [wCurSoundRegister]
	cp LOW(rAUD3LEVEL)
	ld a, b
	ret nz ; not sound3
	xor [hl]
	and $c0
	jr z, .asm_30e30
	ld a, [wCurChannelFlags]
	set CHANFLAGS_UPDATE_VOLUME_F, a
	ld [wCurChannelFlags], a
.asm_30e30
	ld a, b
	ret

SetTimbre:
	ld a, [wCurTrackPtr + 0]
	ld l, a
	ld a, [wCurTrackPtr + 1]
	ld h, a
	ld bc, TRACK_TIMBRE
	add hl, bc
	ld a, [wCurSoundRegister]
	ld c, a
	cp LOW(rAUD3LEVEL)
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
	ld a, [$ff00+c] ; rAUD4POLY
	and $ff ^ AUD4POLY_7STEP
	or b
	ld [$ff00+c], a
	ld a, [hl] ; duration
	and a
	jr z, .no_noise_duration
	cpl
	inc a ; -a
	ldh [rAUD4LEN], a
	ld a, %01000000 ; counter
.no_noise_duration
	or AUDHIGH_RESTART
	ldh [rAUD4GO], a
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
	ldh [rAUD3LEN], a
	ld a, %01000000 ; counter
.no_sound3_duration
	ldh [rAUD3HIGH], a

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

SetFrequency:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_FREQUENCY
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
	cp LOW(rAUD3LEVEL)
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
	call MultiplyBByC
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
	and AUDHIGH_LENGTH_ON
	jr z, .length_counter
	or h
	ld [$ff00+c], a
	jr .skip_length
.length_counter
	or h
	ld [$ff00+c], a ; freq hi
	ld b, a
	ld a, [wCurSoundRegister]
	ld c, a
	dec c
	ld a, [$ff00+c] ; length
	and %11000000 ; clear length data
	ld [$ff00+c], a
	ld a, b
.skip_length
	pop hl
	ld bc, TRACK_FREQUENCY + 1 - TRACK_UNK0E
	add hl, bc
	or AUDHIGH_RESTART
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
	and AUD4POLY_7STEP
	or d
	ld [$ff00+c], a
	inc c
	ld a, [$ff00+c]
	or %10000000 ; initialise
	ld [$ff00+c], a
	ret

SetSoundOutput:
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, CHANNEL_SO_FLAGS
	add hl, bc
	ld a, [wCurSoundRegister]
	cp LOW(rAUD2ENV)
	jr c, .sound1
	jr z, .sound2
	cp LOW(rAUD4ENV)
	jr c, .sound3

; sound4
	lb de, $ff ^ (AUDTERM_4_RIGHT | AUDTERM_4_LEFT), AUDTERM_4_RIGHT | AUDTERM_4_LEFT
	jr .asm_30f61
.sound1
	lb de, $ff ^ (AUDTERM_1_RIGHT | AUDTERM_1_LEFT), AUDTERM_1_RIGHT | AUDTERM_1_LEFT
	jr .asm_30f61
.sound2
	lb de, $ff ^ (AUDTERM_2_RIGHT | AUDTERM_2_LEFT), AUDTERM_2_RIGHT | AUDTERM_2_LEFT
	jr .asm_30f61
.sound3
	lb de, $ff ^ (AUDTERM_3_RIGHT | AUDTERM_3_LEFT), AUDTERM_3_RIGHT | AUDTERM_3_LEFT

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
	ld c, LOW(rAUDTERM)
	ld a, [$ff00+c]
	and d
	or e
	ld [$ff00+c], a
	ret

SetVolumeEnvelope:
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
	cp LOW(rAUD3LEVEL)
	jr c, .rect
	jr z, .sound3

; noise
	ld a, b
	ld [$ff00+c], a
	ldh a, [rAUD4GO]
	or AUDHIGH_RESTART
	ldh [rAUD4GO], a
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

	ldh a, [rAUD3ENA]
	rla
	ret c ; sound is on
	ld a, AUD3ENA_ON
	ldh [rAUD3ENA], a
	inc hl
	ld a, [hl]
	ldh [rAUD3HIGH], a ; freq hi
	ret

TurnSoundRegisterOff:
	ld a, [wCurSoundRegister]
	ld c, a
	cp LOW(rAUD3LEVEL)
	jr z, .sound3
	ld a, %00001000 ; envelope up
	ld [$ff00+c], a
	inc c
	inc c
	ld a, %10000000 ; initialise
	ld [$ff00+c], a
	ret

.sound3
	ld a, AUD3ENA_OFF
	ldh [rAUD3ENA], a
	ret

Func_30fd1:
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

; returns hl = b * c
MultiplyBByC:
	ld h, b
	ld l, $00
	ld b, l

REPT 7
	add hl, hl
	jr nc, :+
	add hl, bc
:
ENDR
	add hl, hl
	ret nc
	add hl, bc
	ret

; returns a = high nybble b * high nybble c, 
MultiplyBByC_Short:
	ld a, c
	and $f0 ; high nybble
	swap a
	ld c, a
	ld a, b
	and $f0 ; high nybble
REPT 3
	add a
	jr nc, :+
	add c
:
ENDR
	add a
	ret nc
	add c
	ret

Data_3102b:
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
	db 17 ; 91 | e0
	db 18 ; 92 | e1
	db 19 ; 93 | e2
	db 20 ; 94 | e3
	db 21 ; 95 | e4
	db 22 ; 96 | e5
	db 23 ; 97 | e6
	db 24 ; 98 | e7
	db 28 ; 99 | e8
	db 30 ; 9a | e9
	db 32 ; 9b | ea
	db 36 ; 9c | eb
	db 40 ; 9d | ec
	db 42 ; 9e | ed
	db 44 ; 9f | ee
	db 48 ; a0 | ef
	db 52 ; a1 | f0
	db 54 ; a2 | f1
	db 56 ; a3 | f2
	db 60 ; a4 | f3
	db 64 ; a5 | f4
	db 66 ; a6 | f5
	db 68 ; a7 | f6
	db 72 ; a8 | f7
	db 76 ; a9 | f8
	db 78 ; aa | f9
	db 80 ; ab | fa
	db 84 ; ac | fb
	db 88 ; ad | fc
	db 90 ; ae | fd
	db 92 ; af | fe
	db 96 ; b0 | ff

Data_3105c:
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
