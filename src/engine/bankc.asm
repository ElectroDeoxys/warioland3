_InitAudio: ; 30000 (c:4000)
	ld a, $ff
	ld [w3d000], a
	ld a, [w3d001]

	push af
	ld hl, w3d001
	ld b, $3f
	xor a
.asm_3000f
	ld [hli], a
	dec b
	jr nz, .asm_3000f
	pop af

	ld [w3d001], a

	ld a, $4a
	ld [w3d005], a
	ld [w3d007], a
	ld [w3d00a], a
	ld [w3d00c], a

	ld a, $40
	ld [w3d006], a
	ld [w3d00b], a

	ld a, $ff
	ld [w3d01d], a

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

	xor a
	ld b, $04
	ld de, $18
	ld hl, wAudioStruct1
.asm_30049
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_30049

	ld a, %10000000 ; all chs off
	ldh [rNR52], a
	ld a, $00
	ldh [rNR51], a
	ld a, $08
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
	ld [w3d000], a

	jp SwitchBackFromBankC
; 0x3007a

Func_3007a: ; 3007a (c:407a)
	push bc
	push de
	call Func_30527
	ld hl, w3d000
	set 5, [hl]
	ld hl, w3d007
	ld a, [hli]
	add [hl]
	ld [hli], a
	ld a, $00
	adc [hl]
	ld [hld], a
	ld a, [hli]
	sub $4a
	ld b, a
	ld a, [hl]
	sbc $00
	jr nc, .asm_300a4

	call SetMusicChannels
.asm_3009a
	call Func_30547
	call NextChannel
	jr nz, .asm_3009a
	jr .asm_300c8

.asm_300a4
	ld [hld], a
	ld [hl], b
	call Func_30193
.asm_300a9
	call Func_30bb0
	call Func_301a4
	jr nz, .asm_300a9
	call SetMusicChannels
.asm_300b4
	call Func_30559
	call NextChannel
	jr nz, .asm_300b4
	ld hl, $d008
	ld a, [hli]
	sub $4a
	ld b, a
	ld a, [hl]
	sbc $00
	jr nc, .asm_300a4
.asm_300c8
	ld hl, w3d000
	res 5, [hl]
	ld hl, w3d00c
	ld a, [hli]
	add [hl]
	ld [hli], a
	ld a, $00
	adc [hl]
	ld [hld], a
	ld a, [hli]
	sub $4a
	ld b, a
	ld a, [hl]
	sbc $00
	jr nc, .asm_300ed
	call SetNoiseChannels
.asm_300e3
	call Func_30547
	call NextChannel
	jr nz, .asm_300e3
	jr .asm_30111

.asm_300ed
	ld [hld], a
	ld [hl], b
	call Func_30193
.asm_300f2
	call Func_30bc2
	call Func_301a4
	jr nz, .asm_300f2
	call SetNoiseChannels
.asm_300fd
	call Func_30559
	call NextChannel
	jr nz, .asm_300fd
	ld hl, $d00d
	ld a, [hli]
	sub $4a
	ld b, a
	ld a, [hl]
	sbc $00
	jr nc, .asm_300ed
.asm_30111
	call Func_30193
.asm_30114
	call Func_30bfb
	call Func_301a4
	jr nz, .asm_30114
	ld a, [$d01a]
	and a
	jr nz, .asm_30124
	ld a, $0f
.asm_30124
	dec a
	ld [$d01a], a

	ld c, NUM_CHANNELS
	ld de, CHANNEL_STRUCT_LENGTH
	ld hl, wChannels
.loop_chs
	ld a, [hl]
	and $f8
	ld [hl], a
	rla
	rr b
	add hl, de
	dec c
	jr nz, .loop_chs
	ld a, b
	ld [w3d024], a
	pop de
	pop bc
	jp Func_3f8d
; 0x30144

SetMusicChannels: ; 30144 (c:4144)
	ld de, wChannel1
	ld a, NUM_MUSIC_CHANS
	jr SetAudioChannels

SetNoiseChannels: ; 3014b (c:414b)
	ld de, wChannel5
	ld a, NUM_NOISE_CHANS
	jr SetAudioChannels

	ld de, wChannel1
	ld a, $08
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
	ld a, $00
	adc [hl]
	ld [hl], a
	rra
	ret
; 0x3016f

Func_3016f: ; 3016f (c:416f)
	ld de, wAudioStruct1
	ld a, $01
	ld c, LOW(rNR12)
	jr Func_3019a

Func_30178: ; 30178 (c:4178)
	ld de, wAudioStruct2
	ld a, $01
	ld c, LOW(rNR22)
	jr Func_3019a

Func_30181: ; 30181 (c:4181)
	ld de, wAudioStruct3
	ld a, $01
	ld c, LOW(rNR32)
	jr Func_3019a

Func_3018a: ; 3018a (c:418a)
	ld de, wAudioStruct4
	ld a, $01
	ld c, LOW(rNR42)
	jr Func_3019a

Func_30193: ; 30193 (c:4193)
	ld de, wAudioStruct1
	ld a, $04
	ld c, LOW(rNR12)
	; fallthrough

Func_3019a: ; 3019a (c:419a)
	ld hl, w3d012
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hl], c
	ret
; 0x301a4

Func_301a4: ; 301a4 (c:41a4)
	ld hl, w3d012
	dec [hl]
	ret z
	inc hl
	ld a, $18
	add [hl]
	ld [hli], a
	ld a, $00
	adc [hl]
	ld [hli], a
	ld a, [hl]
	add $5
	ld [hl], a
	rra
	ret
; 0x301b8

; bc = sound ID
_PlaySFX: ; 301b8 (c:41b8)
	ld a, b
	or c
	jp z, TurnMusicOff
	call GetSound
	ld a, [wCurChannel]
	bit 7, a
	jr nz, .asm_30211

	ld b, a
	sub $04
	jr nc, .asm_3020e
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
	bit 7, [hl]
	jr z, .asm_30204
	ld bc, CHANNEL_UNK_08
	add hl, bc
	ld a, [w3d03e]
	cp [hl]
	jr nc, .asm_30204
	call Func_30366
	jr .asm_30207
.asm_30204
	call InitChannel
.asm_30207
	jr z, .asm_3020e
	call NextChannel
	jr nz, .loop_1
.asm_3020e
	jp Func_3f8d

.asm_30211
	call SetMusicChannels
	ld a, $01
	ld [w3d03b], a
	xor a
	ld [w3d03a], a
.loop_2
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	bit 7, [hl] ; CHANNEL_FLAGS1
	jr nz, .asm_30239
	call InitChannel
	jr z, .done
	ld a, [w3d03b]
	ld b, a
	ld a, [w3d03a]
	or b
	ld [w3d03a], a
.asm_30239
	ld a, [w3d03b]
	sla a
	ld [w3d03b], a
	call NextChannel
	jr nz, .loop_2

	call SetMusicChannels
	ld a, $01
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
	ld bc, CHANNEL_UNK_08
	add hl, bc
	ld a, [w3d03e]
	cp [hl]
	jr c, .asm_3026f
	call InitChannel
	jr z, .done
.asm_3026f
	ld a, [w3d03b]
	sla a
	ld [w3d03b], a
	call NextChannel
	jr nz, .loop_3

.done
	jp Func_3f8d
; 0x3027f

; bc = sound ID
_PlayMusic: ; 3027f (c:427f)
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
	call SetNoiseChannels
.loop_noise_chs
	call InitChannel
	jr z, .next_music_ch
	call NextChannel
	jr nz, .loop_noise_chs
	jr .done

; init music channels
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
Func_302b8: ; 302b8 (c:42b8)
	ld a, [wLoadedMusic + 0]
	cp c
	jr nz, _PlayMusic
	ld a, [wLoadedMusic + 1]
	cp b
	jr nz, _PlayMusic
	ld a, [w3d024]
	and $f0
	jr z, _PlayMusic
	jp Func_3f8d
; 0x302ce

; plays music if different from the one currently playing
; if the ID is the same, then set flag in noise channels
; bc = sound ID
_PlayNewMusic_SetNoise: ; 302ce (c:42ce)
; only start playing music if it's not
; the same as the loaded one
	ld a, [wLoadedMusic + 0]
	cp c
	jr nz, _PlayMusic
	ld a, [wLoadedMusic + 1]
	cp b
	jr nz, _PlayMusic

; same as wLoadedMusic
	ld a, [w3d024]
	and $f0
	jr z, .asm_302e4
	jp Func_3f8d

.asm_302e4
	xor a
	ld [w3d025], a
	call SetNoiseChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl]
	and %01100000 ; CHANNEL_FLAGS1
	jr z, .next_ch
	set 7, [hl]
.next_ch
	call NextChannel
	jr nz, .loop_chs
	jp Func_3f8d
; 0x30302

; loads the sound data of wCurSoundID
; bc = sound ID
GetSound: ; 30302 (c:4302)
	ld a, b
	ld [wCurSoundID + 1], a
	cp $02
	ld a, c
	jr z, .asm_30311
	jr c, .ok
.asm_3030d
	pop hl
	jp Func_3f8d
.asm_30311
	cp $39
	jr nc, .asm_3030d

.ok
	ld [wCurSoundID + 0], a
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl ; *8
	ld bc, Data_3155e
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [wSoundBank], a
	inc hl
	ld a, [hli]
	ld [w3d03e], a
	ld a, [hli]
	ld [wCurChannel], a
	ld a, [hl]
	ld [w3d03c], a
	inc de
	inc de
	ld a, e
	ld [w3d017 + 0], a
	ld a, d
	ld [w3d017 + 1], a
	ret
; 0x30341

InitChannel: ; 30341 (c:4341)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, $a0
	ld [hli], a ; CHANNEL_FLAGS1
	inc hl
	ld a, [w3d017 + 0]
	ld [hli], a ; CHANNEL_UNK_02
	ld a, [w3d017 + 1]
	ld [hli], a
	ld a, [wSoundBank]
	ld [hli], a ; CHANNEL_SOUND_BANK
	inc hl
	ld a, [wCurSoundID + 0]
	ld [hli], a ; CHANNEL_SOUND_ID
	ld a, [wCurSoundID + 1]
	ld [hli], a
	ld a, [w3d03e]
	ld [hli], a
	; fallthrough

Func_30366: ; 30366 (c:4366)
	ld hl, w3d03c
	dec [hl]
	ret z
	ld hl, w3d017
	ld a, $02
	add [hl]
	ld [hli], a
	ld a, $00
	adc [hl]
	ld [hl], a
	rra
	ret
; 0x30378

Func_30378: ; 30378 (c:4378)
	ld a, $c0
	ld [hli], a
	xor a
	ld [hli], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hld]
	ld [wSoundBank], a
	call Func_3fb5
	ld a, b
	ld [hld], a
	ld [hl], c
	ld bc, $7
	add hl, bc
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $17
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ret
; 0x303c9

Func_303c9: ; 303c9 (c:43c9)
	ld a, b
	or c
	jp z, TurnMusicOff
	ld a, c
	ld [wCurSoundID + 0], a
	ld a, b
	ld [wCurSoundID + 1], a
	call SetMusicChannels
.asm_303d9
	ld a, [wCurChannelPtr + 0]
	ld c, a
	ld a, [wCurChannelPtr + 1]
	ld b, a
	ld a, [bc]
	bit 7, a
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

TurnMusicOff: ; 30401 (c:4401)
	call SetMusicChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	xor a
	ld [hl], a ; CHANNEL_FLAGS1
	call NextChannel
	jr nz, .loop_chs
	jp Func_3f8d
; 0x30416

Func_30416: ; 30416 (c:4416)
	call TurnNoiseOff
	jp Func_3f8d
; 0x3041c

Func_3041c: ; 3041c (c:441c)
	xor a
	ld [w3d020], a
	; fallthrough

TurnNoiseOff: ; 30420 (c:4420)
	ld a, $ff
	ld [w3d025], a
	call SetNoiseChannels
.loop_chs
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	res 7, [hl] ; CHANNEL_FLAGS1
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

	INCROM $3049e, $304a4

Func_304a4: ; 304a4 (c:44a4)
	cp $07
	ret nc
	push af
	ld hl, wCurSoundID
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	xor a
	ld [hl], a
	pop af
	ld bc, PointerTable_30490
	jp Func_305b6
; 0x304bc

Func_304bc: ; 304bc (c:44bc)
	call Func_304fa
.asm_304bf
	rrc d
	jr nc, .asm_304d3
	bit 7, [hl]
	jr z, .asm_304d3
	ld a, [w3d03c]
	or [hl]
	ld [hl], a
	push hl
	add hl, bc
	ld a, [wCurSoundID + 1]
	ld [hl], a
	pop hl
.asm_304d3
	call Func_3050f
	jr nz, .asm_304bf
	ret
; 0x304d9

Func_304d9: ; 304d9 (c:44d9)
	call Func_304fa
.asm_304dc
	rrc d
	jr nc, .asm_304f4
	bit 7, [hl]
	jr z, .asm_304f4
	ld a, [w3d03c]
	or [hl]
	ld [hl], a
	push hl
	add hl, bc
	ld a, [wCurSoundID + 0]
	ld [hli], a
	ld a, [wCurSoundID + 1]
	ld [hld], a
	pop hl
.asm_304f4
	call Func_3050f
	jr nz, .asm_304dc
	ret
; 0x304fa

Func_304fa: ; 304fa (c:44fa)
	ld a, [w3d03b]
	and $0f
	ld d, a
	ld a, [w3d03a]
	swap a
	and $f0
	or d
	ld d, a
	ld e, $08
	ld hl, wChannel1
	ret
; 0x3050f

Func_3050f: ; 3050f (c:450f)
	ld a, CHANNEL_STRUCT_LENGTH
	add l
	ld l, a
	ld a, $00
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
	ld hl, $d021
	dec [hl]
	ret nz
	ld [hli], a
	ld a, [hl]
	sub $04
	jp c, Func_3041c
	ld [hl], a
	ld b, a
	ld a, $02
	ld de, $ff
	jp Func_304a4
; 0x30547

Func_30547: ; 30547 (c:4547)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl] ; CHANNEL_FLAGS1
	cp $c0
	ret c
	ld [w3d019], a
	jp Func_305cf.asm_30651
; 0x30559

Func_30559: ; 30559 (c:4559)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [hl]
	bit 7, a
	ret z
	bit 6, a
	jr nz, .asm_3056f
	push hl
	call Func_30378
	pop hl
	ld a, [hl]
.asm_3056f
	ld [w3d019], a
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_3057b
	dec [hl]
	inc hl
	jr Func_305cf
.asm_3057b
	inc hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [wSoundBank], a
	; fallthrough

Func_30584: ; 30584 (c:4584)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $11
	add hl, bc
	call Func_3fb5
	bit 7, c
	jr nz, .asm_3059f
	ld a, c
	ld [$d01f], a
	dec de
	ld a, [hl]
	jr .asm_305a9

.asm_3059f
	ld a, b
	ld [$d01f], a
	ld a, c
	cp $be
	jr c, .asm_305a9
	ld [hl], a
.asm_305a9
	cp $d0
	jp nc, Func_30a14
	sub $b1
	jp c, Func_3073f
	ld bc, PointerTable_306d1
	; fallthrough

Func_305b6: ; 305b6 (c:45b6)
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
	jp hl
; 0x305c4

Func_305c4: ; 305c4 (c:45c4)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	xor a
	ld [hli], a
	ret
; 0x305cf

Func_305cf: ; 305cf (c:45cf)
	ld bc, $29
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_305e0
	dec [hl]
	ld bc, -11
	add hl, bc
	ld a, $40
	jr .asm_305e6
.asm_305e0
	ld bc, -12
	add hl, bc
	ld a, [hli]
	add [hl]
.asm_305e6
	ld [hl], a
	sla a
	jr nc, .asm_305ec
	cpl
.asm_305ec
	ld [$d01e], a
	ld bc, $1
	add hl, bc
	ld a, [hli]
	add [hl]
	jr z, .asm_3060c
	ld c, a
	ld a, [$d01e]
	ld b, a
	push hl
	push bc
	call Func_30fee
	pop bc
	ld b, h
	pop hl
	inc hl
	ld a, [hli]
	cp $00
	jr z, .asm_30617
	jr .asm_30646
.asm_3060c
	ld bc, $0
	inc hl
	ld a, [hli]
	cp $00
	jr z, .asm_30629
	jr .asm_30646
.asm_30617
	ld a, b
	srl c
	sub c
	ld c, a
	ld a, $00
	sbc a
	sla c
	rla
	sla c
	rla
	sla c
	rla
	ld b, a
.asm_30629
	ld a, c
	cp [hl]
	jr z, .asm_30636
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld [hl], c
.asm_30636
	inc hl
	ld a, b
	cp [hl]
	jr z, .asm_30644
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld [hl], b
.asm_30644
	jr .asm_30646
.asm_30646
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, [w3d019]
.asm_30651
	bit 2, a
	jr z, .asm_30691
	ld bc, $1d
	add hl, bc
	ld e, [hl]
	ld a, $00
	sla e
	sbc a
	ld d, a
	ld bc, -2
	add hl, bc
	ld a, [hli]
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a
	ld bc, -8
	add hl, bc
	ld a, [hli]
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a
	ld bc, $10
	add hl, bc
	ld a, [hli]
	cp $00
	jr nz, .asm_30683
	ld a, [hli]
	add e
	ld e, a
	ld a, [hld]
	adc d
	ld d, a
.asm_30683
	ld bc, $8
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d
	ld bc, -45
	add hl, bc
	ld a, [w3d019]
.asm_30691
	bit 0, a
	jr z, .asm_306a8
	ld bc, $17
	add hl, bc
	ld a, [hli]
	add [hl]
	ld e, a
	ld bc, $16
	add hl, bc
	ld [hl], e
	ld bc, -46
	add hl, bc
	ld a, [w3d019]
.asm_306a8
	bit 1, a
	jr z, .asm_306cf
	ld bc, $15
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	call Func_31012
	add $0f
	and $f0
	cp $40
	jr c, .asm_306c0
	ld a, $ff
.asm_306c0
	rlca
	rlca
	ld e, a
	ld bc, $19
	add hl, bc
	ld [hl], e
	ld bc, -47
	add hl, bc
	ld a, [w3d019]
.asm_306cf
	ld [hl], a
	ret
; 0x306d1

PointerTable_306d1: ; 306d1 (c:46d1)
	dw Func_305c4
	dw Func_30784
	dw Func_30760
	dw Func_3078c
	dw Func_307ae
	dw Func_30a0d
	dw Func_30a0d
	dw Func_30a0d
	dw Func_305c4
	dw Func_305c4
	dw Func_305c4
	dw Func_307cc
	dw Func_30823
	dw Func_30837
	dw Func_30913
	dw Func_3093e
	dw Func_3087f
	dw Func_308be
	dw Func_308d5
	dw Func_3090e
	dw Func_30959
	dw Func_3096d
	dw Func_30a0d
	dw Func_30a0d
	dw Func_30980
	dw Func_3099f
	dw Func_30a0d
	dw Func_305c4
	dw Func_30727
	dw Func_30a10
	dw Func_30b4d
	dw Func_305c4
	dw Func_309bc
	dw Func_309cb
	dw Func_309e8
	dw Func_30a03
	dw Func_30a08
	dw Func_309ac
	dw Func_309b1
	dw Func_30a0d
	dw Func_30a0d
	dw Func_309c1
	dw Func_309c6
; 0x30727

Func_30727: ; 30727 (c:4727)
	ld a, [$d01f]
	inc de
	cp $0c
	jp nc, Func_305c4
	ld b, a
	call Func_3faa
	ld a, c
	ld [$d01f], a
	ld a, b
	ld bc, $470f
	jp Func_305b6
; 0x3073f

Func_3073f: ; 3073f (c:473f)
	add $31
	jp z, Func_30584
	add $2b
	ld l, a
	ld a, $00
	adc $50
	ld h, a
	ld b, [hl]
	dec b
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	inc hl
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	jp Func_305cf
; 0x30760

Func_30760: ; 30760 (c:4760)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $26
	add hl, bc
	ld a, [hl]
	cp $0a
	jp nc, Func_305c4
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

Func_30784: ; 30784 (c:4784)
	call Func_3fb5
	ld e, c
	ld d, b
	jp Func_30584
; 0x3078c

Func_3078c: ; 3078c (c:478c)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $26
	add hl, bc
	ld a, [hl]
	and a
	jp z, Func_30584
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
	jp Func_30584
; 0x307ae

Func_307ae: ; 307ae (c:47ae)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $29
	add hl, bc
	ld a, [$d01f]
	inc de
	and a
	jr z, Func_30784
	inc [hl]
	cp [hl]
	jr nz, Func_30784
	xor a
	ld [hl], a
	inc de
	inc de
	jp Func_30584
; 0x307cc

Func_307cc: ; 307cc (c:47cc)
	ld hl, w3d000
	bit 5, [hl]
	ld hl, w3d00a
	jr z, .asm_307d9
	ld hl, w3d005
.asm_307d9
	ld a, [$d01f]
	inc de
	ld [hl], a
	call Func_307e4
	jp Func_30584
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
	jr c, .asm_307f5
	ld a, $3f
	ld l, $ff
.asm_307f5
	sla l
	rla
	sla l
	rla
	and a
	jr nz, .asm_307ff
	inc a
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

Func_30823: ; 30823 (c:4823)
	ld bc, $12
	jp Func_3095c
; 0x30829

Func_30829: ; 30829 (c:4829)
	ld a, [w3d03c]
	set 2, a
	ld [w3d03c], a
	ld bc, $13
	jp Func_304d9
; 0x30837

Func_30837: ; 30837 (c:4837)
	ld a, [$d01f]
	inc de
	cp $28
	jr z, .asm_30867
	call Func_30872
	ld a, [wCurChannelPtr + 0]
	add $0c
	ld c, a
	ld a, [wCurChannelPtr + 1]
	adc $00
	ld b, a
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, [w3d019]
	res 4, a
	ld [w3d019], a
	jp Func_30584
.asm_30867
	ld a, [w3d019]
	set 4, a
	ld [w3d019], a
	jp Func_30584
; 0x30872

Func_30872: ; 30872 (c:4872)
	ld l, a
	ld h, $00
	add hl, hl ; *2
	ld c, l
	ld b, h
	add hl, hl ; *4
	add hl, bc ; *6
	ld bc, Data_311c4
	add hl, bc
	ret
; 0x3087f

Func_3087f: ; 3087f (c:487f)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $19
	add hl, bc
	ld a, [$d01f]
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
	jp Func_30584
; 0x308be

Func_308be: ; 308be (c:48be)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $1a
	add hl, bc
	ld a, [$d01f]
	inc de
	ld [hld], a
	ld c, a
	ld a, [hli]
	ld b, a
	inc hl
	jr Func_30896
; 0x308d5

Func_308d5: ; 308d5 (c:48d5)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $1f
	add hl, bc
	ld a, [$d01f]
	inc de
	ld [hli], a
	sla a
	jr nz, .asm_308ee
	ccf
	rra
	rra
	ld [hl], a
.asm_308ee
	jp Func_30584
; 0x308f1

Func_308f1: ; 308f1 (c:48f1)
	ld a, [wCurSoundID + 1]
	sla a
	jr z, .asm_308fe
	ld bc, $1f
	jp Func_304bc
.asm_308fe
	rra
	ld [wCurSoundID + 0], a
	rra
	xor $40
	ld [wCurSoundID + 1], a
	ld bc, $1f
	jp Func_304d9
; 0x3090e

Func_3090e: ; 3090e (c:490e)
	ld bc, $2a
	jr Func_3095c
; 0x30913

Func_30913: ; 30913 (c:4913)
	ld a, [w3d019]
	set 1, a
	ld [w3d019], a
	ld bc, $15
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [$d01f]
	inc de
	rlca
	ld [hl], a
	jp Func_30584
; 0x30930

Func_30930: ; 30930 (c:4930)
	ld a, [w3d03c]
	set 1, a
	ld [w3d03c], a
	ld bc, $16
	jp Func_304bc
; 0x3093e

Func_3093e: ; 3093e (c:493e)
	ld a, [w3d019]
	set 0, a
	ld [w3d019], a
	ld bc, $17
	jr Func_3098b
; 0x3094b

Func_3094b: ; 3094b (c:494b)
	ld a, [w3d03c]
	set 0, a
	ld [w3d03c], a
	ld bc, $18
	jp Func_304bc
; 0x30959

Func_30959: ; 30959 (c:4959)
	ld bc, $21
;	fallthrough

Func_3095c: ; 3095c (c:495c)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [$d01f]
	inc de
	ld [hl], a
	jp Func_30584
; 0x3096d

Func_3096d: ; 3096d (c:496d)
	ld a, [w3d019]
	or $07
	ld [w3d019], a
	ld bc, $23
	jr Func_3095c
; 0x3097a

Func_3097a: ; 3097a (c:497a)
	ld bc, $22
	jp Func_304bc
; 0x30980

Func_30980: ; 30980 (c:4980)
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld bc, $1d
; 0x3098b

Func_3098b: ; 3098b (c:498b)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [$d01f]
	inc de
	rlca
	sub $80
	ld [hl], a
	jp Func_30584
; 0x3099f

Func_3099f: ; 3099f (c:499f)
	ld a, [w3d019]
	set 2, a
	ld [w3d019], a
	ld bc, $1e
	jr Func_3095c
; 0x309ac

Func_309ac: ; 309ac (c:49ac)
	ld bc, $27
	jr Func_3095c
; 0x309b1

Func_309b1: ; 309b1 (c:49b1)
	ld bc, $28
	jr Func_3095c
; 0x309b6

Func_309b6: ; 309b6 (c:49b6)
	ld bc, $27
	jp Func_304d9
; 0x309bc

Func_309bc: ; 309bc (c:49bc)
	ld bc, $c
	jr Func_3095c
; 0x309c1

Func_309c1: ; 309c1 (c:49c1)
	ld bc, $d
	jr Func_3095c
; 0x309c6

Func_309c6: ; 309c6 (c:49c6)
	ld bc, $e
	jr Func_3095c
; 0x309cb

Func_309cb: ; 309cb (c:49cb)
	ld bc, $f
;	fallthrough

Func_309ce: ; 309ce (c:49ce)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [$d01f]
	inc de
	swap a
	and $f0
	ld b, a
	ld a, [hl]
	and $0f
	or b
	ld [hl], a
	jp Func_30584
; 0x309e8

Func_309e8: ; 309e8 (c:49e8)
	ld bc, $f
;	fallthrough

Func_309eb: ; 309eb (c:49eb)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	add hl, bc
	ld a, [$d01f]
	inc de
	and $0f
	ld b, a
	ld a, [hl]
	and $f0
	or b
	ld [hl], a
	jp Func_30584
; 0x30a03

Func_30a03: ; 30a03 (c:4a03)
	ld bc, $10
	jr Func_309ce
; 0x30a08

Func_30a08: ; 30a08 (c:4a08)
	ld bc, $10
	jr Func_309eb
; 0x30a0d

Func_30a0d: ; 30a0d (c:4a0d)
	jp Func_305c4
; 0x30a10

Func_30a10: ; 30a10 (c:4a10)
	ld b, $00
	jr Func_30a1f
; 0x30a14

Func_30a14: ; 30a14 (c:4a14)
	sub $cf
	add $2b
	ld l, a
	ld a, $00
	adc $50
	ld h, a
	ld b, [hl]
;	fallthrough

Func_30a1f: ; 30a1f (c:4a1f)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld a, b
	ld bc, $b
	add hl, bc
	ld [hld], a
	ld b, $00
	ld a, [$d01f]
	jr .asm_30a39
.asm_30a34
	inc de
	call Func_3faa
	ld a, c
.asm_30a39
	bit 7, a
	jr nz, .asm_30a68
	cp $24
	jr nc, .asm_30a50
	cp $20
	jr c, .asm_30a5a
	bit 5, b
	jr nz, .asm_30a68
	set 5, b
	inc hl
	add [hl]
	ld [hld], a
	jr .asm_30a34
.asm_30a50
	bit 7, b
	jr nz, .asm_30a68
	set 7, b
	dec hl
	ld [hli], a
	jr .asm_30a34
.asm_30a5a
	bit 6, b
	jr nz, .asm_30a68
	set 6, b
	rlca
	rlca
	rlca
	or $07
	ld [hl], a
	jr .asm_30a34
.asm_30a68
	push de
	dec hl
	ld a, [hl]
	ld bc, $9
	add hl, bc
	add [hl]
	ld [w3d03a], a
	ld [w3d03b], a
	ld bc, $18
	add hl, bc
	ld a, [hli]
	ld [hld], a
	ld bc, -30
	add hl, bc
	ld a, [w3d019]
	bit 4, a
	jr z, .asm_30aa5
	push hl
	ld e, l
	ld d, h
	ld a, [w3d03a]
	add $04
	call Func_30872
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	ld [w3d03b], a
	pop hl
.asm_30aa5

	ld a, [hl]
	cp $10
	jr nc, .asm_30ab8
	cp $08
	jr nc, .asm_30ab3
	call Func_3016f
	jr .asm_30ac4
.asm_30ab3
	call Func_30178
	jr .asm_30ac4
.asm_30ab8
	cp $40
	jr nc, .asm_30ac1
	call Func_30181
	jr .asm_30ac4
.asm_30ac1
	call Func_3018a
.asm_30ac4
	ld a, [wNumAudioChannels]
	ld hl, w3d000
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
	ld bc, $8
	add hl, bc
	ld a, [hl]
	ld [wCurSoundID + 0], a
	ld d, a
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	ld a, [hli]
	and a
	jr z, .asm_30b01
	bit 5, a
	jr nz, .asm_30af7
	jr .asm_30b01

.asm_30af7
	ld a, [hli]
	cp d
	jr c, .asm_30b01
	jr nz, .asm_30b49
	ld a, e
	cp [hl]
	jr c, .asm_30b49
.asm_30b01
	call Func_30fbb
	ld a, [wCurChannelPtr + 0]
	ld e, a
	ld a, [wCurChannelPtr + 1]
	ld d, a
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a

	ld a, $f0
	ld [hli], a
	ld a, [wCurSoundID + 0]
	ld [hli], a
	ld a, [wCurSoundID + 1]
	ld [hli], a
	ld a, [w3d03a]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $0a
	add e
	ld e, a
	ld a, $00
	adc d
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a ; duty cycle
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a ; sweep
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, [w3d03b]
	ld [hl], a
.asm_30b49
	pop de
	jp Func_30584
; 0x30b4d

Func_30b4d: ; 30b4d (c:4b4d)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $9
	add hl, bc
	ld a, [$d01f]
	bit 7, a
	jr nz, .asm_30b66
	cp $24
	jr c, .asm_30b66
	inc de
	ld [hl], a
.asm_30b66
	ld a, [hl]
	ld bc, $9
	add hl, bc
	add [hl]
	ld [w3d03a], a
	push de
	call Func_30193
	ld a, [wNumAudioChannels]
	ld hl, w3d000
	bit 5, [hl]
	jr z, .asm_30b7f
	set 7, a
.asm_30b7f
	ld e, a
	ld a, [w3d03a]
	ld d, a
.asm_30b84
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	ld a, [hli]
	bit 5, a
	jr z, .asm_30ba7
	inc hl
	ld a, [hli]
	cp e
	jr nz, .asm_30ba7
	ld a, [hl]
	cp d
	jr nz, .asm_30ba7
	ld bc, $4
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_30ba7
	call Func_30be3
	jr .asm_30bac
.asm_30ba7
	call Func_301a4
	jr nz, .asm_30b84
.asm_30bac
	pop de
	jp Func_30584
; 0x30bb0

Func_30bb0: ; 30bb0 (c:4bb0)
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	bit 7, [hl]
	ret z
	inc hl
	inc hl
	bit 7, [hl]
	ret z
	jr Func_30bd2

Func_30bc2: ; 30bc2 (c:4bc2)
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	bit 7, [hl]
	ret z
	inc hl
	inc hl
	bit 7, [hl]
	ret nz
	; fallthrough

Func_30bd2: ; 30bd2 (c:4bd2)
	inc hl
	inc hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	cp $c0
	jr c, Func_30bf2
	inc hl
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
;	fallthrough

Func_30be3: ; 30be3 (c:4be3)
	ld bc, -7
	add hl, bc
	ld a, [hl]
	bit 6, a
	jr nz, Func_30bf6
	or $50
	and $df
	ld [hl], a
	ret
; 0x30bf2

Func_30bf2: ; 30bf2 (c:4bf2)
	ld bc, -6
	add hl, bc
	; fallthrough

Func_30bf6: ; 30bf6 (c:4bf6)
	xor a
	ld [hl], a
	jp Func_30fbb
; 0x30bfb

Func_30bfb: ; 30bfb (c:4bfb)
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	ld a, [hl]
	bit 7, a
	ret z
	ld b, a
	push hl
	ld de, $4
	add hl, de
	ld a, [hli]
	ld [wCurChannelPtr + 0], a
	ld e, a
	ld a, [hli]
	ld [wCurChannelPtr + 1], a
	ld d, a
	ld a, [de]
	cp $c0
	jr nc, .asm_30c1f
	pop hl
	jr Func_30bf6
.asm_30c1f
	ld [w3d019], a
	bit 6, b
	jr nz, .asm_30c46
	ld de, $c
	add hl, de
	ld a, [$d01a]
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
	jr z, .asm_30c76
	push hl
	call Func_30e32
	pop hl
	ld a, [w3d019]
	or $07
	ld [w3d019], a
	call .asm_30dc6
	ld bc, $b
	add hl, bc
	ld a, [hl]
	ld bc, $6
	add hl, bc
	swap a
	cpl
	rrca
	and $07
	jr z, .asm_30cba
	or $08
	ld [hli], a
	xor a
	ld [hli], a
	jp .asm_30d9d
.asm_30c76
	ld bc, $c
	add hl, bc
	ld b, [hl]
	ld de, $5
	add hl, de
	ld a, [hl]
	and $f0
	jp z, .asm_30d3b
	ld c, a
	ld a, b
	cpl
	rrca
	and $07
	jp z, .asm_30d3b
	or c
	ld [hli], a
	xor a
	ld [hli], a
	jp .asm_30d95
.asm_30c95
	ld a, [w3d019]
	bit 1, a
	call nz, .asm_30dc6
	ld bc, $11
	add hl, bc
	ld a, [hli]
	and $07
	dec a
	cp [hl]
	jr nc, .asm_30cb3
	xor a
	ld [hld], a
	ld a, [hl]
	add $10
	jr c, .asm_30cba
	call Func_30e1b
	ld [hli], a
.asm_30cb3
	dec hl
	ld a, [hld]
	cp [hl]
	jp c, .asm_30d84
	inc hl
.asm_30cba
	ld bc, -6
	add hl, bc
	ld b, [hl]
	ld de, $5
	add hl, de
	ld c, [hl]
	push bc
	ld bc, -16
	add hl, bc
	res 4, [hl]
	call .asm_30deb
	ld d, a
	ld bc, $11
	add hl, bc
	pop bc
	ld a, b
	cpl
	rrca
	and $07
	jr nz, .asm_30ce2
	call .asm_30dba
	jr z, .asm_30d3b
	ld a, d
	ld c, d
.asm_30ce2
	or c
	ld [hli], a
	xor a
	ld [hli], a
	jp .asm_30d95
.asm_30ce9
	ld a, [w3d019]
	bit 1, a
	call nz, .asm_30deb
	ld bc, $11
	add hl, bc
	ld a, [hli]
	and $07
	jr z, .asm_30d1b
	dec a
	cp [hl]
	jr nc, .asm_30d09
	xor a
	ld [hld], a
	ld a, [hl]
	sub $10
	jr c, .asm_30d11
	call Func_30e1b
	ld [hli], a
.asm_30d09
	dec hl
	dec hl
	ld a, [hli]
	or $0f
	cp [hl]
	jr c, .asm_30d84
.asm_30d11
	call .asm_30dba
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
	ld bc, $11
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
	call Func_30e1b
	ld [hl], a
	jr .asm_30d84
	dec hl
.asm_30d3b
	push hl
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $2f
	add hl, bc
	ld b, [hl]
	ld de, -8
	add hl, de
	ld a, [hli]
	ld c, a
	ld d, [hl]
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
	ld bc, $12
	add hl, bc
	dec [hl]
	jr nz, .asm_30d9d
.asm_30d77
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	xor a
	ld [hl], a
	jp Func_30fbb
.asm_30d84
	ld a, [w3d012 + $3]
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
	jr z, .asm_30daa
	call Func_30eb1
	ld a, [w3d019]
.asm_30daa
	bit 0, a
	jr z, .asm_30db4
	call Func_30f36
	ld a, [w3d019]
.asm_30db4
	bit 1, a
	ret z
	jp Func_30f7e

.asm_30dba
	ld bc, -5
	add hl, bc
	ld a, [hl]
	ld bc, $5
	add hl, bc
	and $f0
	ret

.asm_30dc6
	push hl
	ld bc, $6
	add hl, bc
	ld c, [hl]
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld de, $2f
	add hl, de
	ld b, [hl]
	call Func_31012
	add $0f
	and $f0
	pop hl
	ld de, $10
	add hl, de
	ld [hl], a
	ld de, -16
	add hl, de
	ret

.asm_30deb
	push hl
	ld bc, $c
	add hl, bc
	ld b, [hl]
	ld de, -6
	add hl, de
	ld c, [hl]
	call Func_31012
	add $0f
	ld c, a
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld de, $2f
	add hl, de
	ld b, [hl]
	call Func_31012
	add $0f
	and $f0
	pop hl
	ld de, $10
	add hl, de
	ld [hl], a
	ld de, -16
	add hl, de
	ret
; 0x30e1b

Func_30e1b: ; 30e1b (c:4e1b)
	ld b, a
	ld a, [w3d012 + $3]
	cp LOW(rNR32)
	ld a, b
	ret nz
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

Func_30e32: ; 30e32 (c:4e32)
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	ld bc, $8
	add hl, bc
	ld a, [w3d012 + $3]
	ld c, a
	cp LOW(rNR32)
	jr c, .asm_30e64
	jr z, .asm_30e82
	ld a, [hli]
	rlca
	rlca
	rlca
	and $08
	ld b, a
	inc c
	ld a, [$ff00+c]
	and $f7
	or b
	ld [$ff00+c], a
	ld a, [hl]
	and a
	jr z, .asm_30e5f
	cpl
	inc a
	ldh [rNR41], a
	ld a, $40
.asm_30e5f
	or $80
	ldh [rNR44], a
	ret

.asm_30e64
	ld a, [hli] ; duty cycle
	rrca
	rrca
	and %11000000
	ld b, a
	ld a, [hli]
	and a
	jr z, .asm_30e76
	cpl
	inc a
	and %00111111
	or b
	ld b, a
	ld a, $40
.asm_30e76
	inc c
	inc c
	ld [$ff00+c], a ; freq hi
	dec c
	dec c
	dec c
	ld a, b
	ld [$ff00+c], a ; duty cycle
	dec c
	ld a, [hl]
	ld [$ff00+c], a
	ret

.asm_30e82
	ld a, [hli]
	sub $10
	ld b, a
	ld a, [hl]
	and a
	jr z, .asm_30e90
	cpl
	inc a
	ldh [rNR31], a
	ld a, $40
.asm_30e90
	ldh [rNR34], a

	ld a, [w3d01d]
	cp b
	ret z
	ld a, b
	ld [w3d01d], a
	ld l, b
	ld h, $00
	add hl, hl ; *2
	add hl, hl ; *4
	add hl, hl ; *8
	add hl, hl ; *16
	ld bc, Data_314a6
	add hl, bc
	ld c, $30
	ld b, $10
.asm_30eaa
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_30eaa
	ret
; 0x30eb1

Func_30eb1: ; 30eb1 (c:4eb1)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $2c
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	ld de, $e
	add hl, de
	ld a, [hl]
	add b
	ld b, a
	ld a, [w3d012 + $3]
	cp LOW(rNR32)
	jr c, .asm_30edc
	jr nz, .asm_30f14
	ld a, b
	add $0c
	ld b, a
.asm_30edc
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
	ld a, [w3d012 + $3]
	ld c, a
	inc c
	ld a, l
	ld [$ff00+c], a
	inc c
	ld a, [$ff00+c]
	and $40
	jr z, .asm_30efe
	or h
	ld [$ff00+c], a
	jr .asm_30f0b

.asm_30efe
	or h
	ld [$ff00+c], a
	ld b, a
	ld a, [w3d012 + $3]
	ld c, a
	dec c
	ld a, [$ff00+c]
	and $c0
	ld [$ff00+c], a
	ld a, b
.asm_30f0b
	pop hl
	ld bc, $5
	add hl, bc
	or $80
	ld [hl], a
	ret

.asm_30f14
	ld c, a
	inc c
	ld a, b
	sub $0d
	cpl
	ld b, a
	and $03
	ld d, a
	ld a, b
	cp $c0
	jr c, .asm_30f2b
	and $3c
	rlca
	rlca
	or d
	or $04
	ld d, a
.asm_30f2b
	ld a, [$ff00+c]
	and $08
	or d
	ld [$ff00+c], a
	inc c
	ld a, [$ff00+c]
	or $80
	ld [$ff00+c], a
	ret
; 0x30f36

Func_30f36: ; 30f36 (c:4f36)
	ld a, [wCurChannelPtr + 0]
	ld l, a
	ld a, [wCurChannelPtr + 1]
	ld h, a
	ld bc, $2e
	add hl, bc
	ld a, [w3d012 + $3]
	cp LOW(rNR22)
	jr c, .asm_30f54
	jr z, .asm_30f59
	cp LOW(rNR42)
	jr c, .asm_30f5e

	ld de, $7788
	jr .asm_30f61
.asm_30f54
	ld de, $ee11
	jr .asm_30f61
.asm_30f59
	ld de, $dd22
	jr .asm_30f61
.asm_30f5e
	ld de, $bb44
.asm_30f61
	bit 7, [hl]
	jr nz, .asm_30f6d
	bit 6, [hl]
	jr z, .asm_30f77
	ld a, $0f
	jr .asm_30f75
.asm_30f6d
	bit 6, [hl]
	jr nz, .asm_30f77
	ld a, $f0
	jr .asm_30f75
.asm_30f75
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

Func_30f7e: ; 30f7e (c:4f7e)
	ld a, [w3d012 + $1]
	ld l, a
	ld a, [w3d012 + $2]
	ld h, a
	ld bc, $11
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [w3d012 + $3]
	ld c, a
	cp LOW(rNR32)
	jr c, .asm_30f9f
	jr z, .asm_30fa7
	ld a, b
	ld [$ff00+c], a
	ldh a, [rNR44]
	or $80
	ldh [rNR44], a
	ret

.asm_30f9f
	ld a, b
	ld [$ff00+c], a
	inc c
	inc c
	inc hl
	ld a, [hl]
	ld [$ff00+c], a
	ret

.asm_30fa7
	ld a, b
	sub $40
	xor $c0
	rrca
	ld [$ff00+c], a
	ldh a, [rNR30]
	rla
	ret c
	ld a, $80
	ldh [rNR30], a
	inc hl
	ld a, [hl]
	ldh [rNR34], a
	ret
; 0x30fbb

Func_30fbb: ; 30fbb (c:4fbb)
	ld a, [w3d012 + $3]
	ld c, a
	cp LOW(rNR32)
	jr z, .asm_30fcc
	ld a, $08
	ld [$ff00+c], a
	inc c
	inc c
	ld a, $80
	ld [$ff00+c], a
	ret

.asm_30fcc
	ld a, $00
	ldh [rNR30], a
	ret
; 0x30fd1

Func_30fd1: ; 30fd1 (c:4fd1)
	sub $24
	jr nc, .asm_30fd6
	xor a
.asm_30fd6
	cp $78
	jr c, .asm_30fdc
	ld a, $77
.asm_30fdc
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

	INCROM $3102b, $3105c

Data_3105c: ; 3105c (c:505c)
	dbw $2c, $7000
	dbw $9d, $6a00
	dbw $07, $6401
	dbw $6b, $5f01
	dbw $c9, $5901
	dbw $23, $5402
	dbw $77, $5002
	dbw $c7, $4b02
	dbw $12, $4703
	dbw $58, $4303
	dbw $9b, $3f03
	dbw $da, $3c03
	dbw $16, $3804
	dbw $4e, $3504
	dbw $83, $3204
	dbw $b5, $3004
	dbw $e4, $2d04
	dbw $11, $2a05
	dbw $3b, $2805
	dbw $63, $2605
	dbw $89, $2405
	dbw $ac, $2205
	dbw $cd, $2005
	dbw $ed, $1e05
	dbw $0b, $1c06
	dbw $27, $1b06
	dbw $42, $1906
	dbw $5b, $1806
	dbw $72, $1606
	dbw $89, $1506
	dbw $9e, $1406
	dbw $b2, $1306
	dbw $c4, $1206
	dbw $d6, $1106
	dbw $e7, $1006
	dbw $f6, $0f06
	dbw $05, $0e07
	dbw $14, $0d07
	dbw $21, $0d07
	dbw $2d, $0c07
	dbw $39, $0b07
	dbw $44, $0b07
	dbw $4f, $0a07
	dbw $59, $0907
	dbw $62, $0907
	dbw $6b, $0807
	dbw $73, $0807
	dbw $7b, $0807
	dbw $83, $0707
	dbw $8a, $0707
	dbw $90, $0607
	dbw $97, $0607
	dbw $9d, $0607
	dbw $a2, $0507
	dbw $a7, $0507
	dbw $ac, $0507
	dbw $b1, $0407
	dbw $b5, $0407
	dbw $ba, $0407
	dbw $be, $0407
	dbw $c1, $0407
	dbw $c5, $0307
	dbw $c8, $0307
	dbw $cb, $0307
	dbw $ce, $0307
	dbw $d1, $0307
	dbw $d4, $0307
	dbw $d6, $0207
	dbw $d9, $0207
	dbw $db, $0207
	dbw $dd, $0207
	dbw $df, $0207
	dbw $e1, $0207
	dbw $e2, $0207
	dbw $e4, $0207
	dbw $e6, $0107
	dbw $e8, $0107
	dbw $e9, $0107
	dbw $ea, $0107
	dbw $eb, $0107
	dbw $ec, $0107
	dbw $ed, $0107
	dbw $ee, $0107
	dbw $ef, $0107
	dbw $f0, $0107
	dbw $f1, $0107
	dbw $f2, $0107
	dbw $f3, $0107
	dbw $f4, $0107
	dbw $f4, $0107
	dbw $f5, $0107
	dbw $f6, $0107
	dbw $f6, $0107
	dbw $f7, $0107
	dbw $f7, $0107
	dbw $f8, $0107
	dbw $f8, $0107
	dbw $f9, $0107
	dbw $f9, $0107
	dbw $f9, $0107
	dbw $fa, $0107
	dbw $fa, $0107
	dbw $fa, $0107
	dbw $fb, $0107
	dbw $fb, $0107
	dbw $fb, $0107
	dbw $fc, $0107
	dbw $fc, $0107
	dbw $fc, $0107
	dbw $fc, $0107
	dbw $fd, $0107
	dbw $fd, $0107
	dbw $fd, $0107
	dbw $fd, $0107
	dbw $fd, $0107
	dbw $fd, $0107
	dbw $fe, $0107
	dbw $fe, $0107
	dbw $fe, $0107
	dbw $fe, $0107
; 0x311c4

Data_311c4: ; 311c4 (c:51c4)
	db $18, $00, $00, $ff, $ff, $3c
	db $00, $00, $00, $fb, $28, $3c
	db $00, $00, $00, $f0, $10, $3c
	db $01, $00, $00, $ff, $ff, $3c
	db $01, $00, $00, $fb, $28, $3c
	db $01, $00, $00, $f0, $10, $3c
	db $02, $00, $00, $ff, $ff, $3c
	db $02, $00, $00, $fb, $28, $3c
	db $02, $00, $00, $f0, $10, $3c
	db $02, $00, $00, $f1, $13, $3c
	db $00, $00, $00, $ff, $ff, $3c
	db $00, $00, $00, $fc, $18, $3c
	db $00, $00, $00, $f0, $10, $3c
	db $01, $00, $00, $ff, $ff, $3c
	db $01, $00, $00, $fc, $10, $3c
	db $01, $00, $00, $f0, $18, $3c
	db $02, $00, $00, $ff, $ff, $3c
	db $02, $00, $00, $fc, $18, $3c
	db $02, $00, $00, $f0, $10, $3c
	db $02, $00, $00, $f1, $13, $3c
	db $08, $00, $00, $ff, $ff, $3c
	db $08, $00, $00, $fc, $18, $3c
	db $08, $00, $00, $f0, $10, $3c
	db $09, $00, $00, $ff, $ff, $3c
	db $09, $00, $00, $fc, $18, $3c
	db $09, $00, $00, $f0, $10, $3c
	db $0a, $00, $00, $ff, $ff, $3c
	db $0a, $00, $00, $fc, $18, $3c
	db $0a, $00, $00, $f0, $10, $3c
	db $0a, $00, $00, $f1, $13, $3c
	db $10, $00, $00, $f6, $24, $3c
	db $11, $00, $00, $f6, $24, $3c
	db $12, $00, $00, $f6, $24, $3c
	db $13, $00, $00, $f6, $24, $3c
	db $14, $00, $00, $f6, $24, $3c
	db $15, $00, $00, $f6, $24, $3c
	db $16, $00, $00, $f6, $24, $3c
	db $17, $00, $00, $f6, $24, $3c
	db $18, $00, $00, $f6, $24, $3c
	db $18, $00, $00, $f6, $24, $3c
	db $41, $0a, $00, $ff, $ff, $31
	db $41, $00, $00, $f0, $10, $4f
	db $40, $08, $00, $ff, $ff, $3e
	db $41, $06, $00, $ff, $ff, $41
	db $41, $06, $00, $ff, $ff, $4f
	db $40, $00, $00, $fd, $0f, $3c
	db $41, $02, $00, $ff, $ff, $4c
	db $40, $00, $00, $fd, $0f, $3c
	db $40, $0c, $00, $ff, $ff, $4f
	db $40, $24, $00, $ff, $ff, $4f
	db $02, $00, $15, $f6, $00, $3c
	db $02, $00, $24, $ff, $ff, $3c
	db $02, $00, $3c, $ff, $ff, $3c
	db $02, $00, $1c, $fc, $0c, $3c
	db $02, $00, $15, $ff, $ff, $3c
	db $02, $00, $37, $ff, $ff, $3c
	db $00, $00, $75, $ff, $ff, $3c
	db $00, $00, $7d, $ff, $ff, $3c
	db $02, $00, $3f, $ff, $ff, $3c
	db $00, $00, $1d, $ff, $ff, $3c
	db $00, $00, $17, $ff, $ff, $3c
	db $01, $00, $45, $ff, $ff, $3c
	db $02, $00, $25, $ff, $ff, $3c
	db $02, $00, $1a, $ff, $ff, $3c
	db $02, $00, $15, $fa, $4c, $3c
	db $02, $00, $6c, $ff, $ff, $3c
	db $01, $00, $15, $ff, $ff, $3c
	db $02, $00, $47, $ff, $ff, $3c
	db $02, $00, $27, $ff, $ff, $3c
	db $02, $00, $1d, $fc, $0c, $3c
	db $00, $00, $00, $fa, $4c, $3c
	db $01, $00, $00, $fa, $4c, $3c
	db $02, $00, $00, $fa, $4c, $3c
	db $00, $00, $00, $fc, $0c, $3c
	db $01, $00, $00, $fc, $0c, $3c
	db $02, $00, $00, $fc, $0c, $3c
	db $00, $00, $00, $cf, $fa, $3c
	db $01, $00, $00, $cf, $fa, $3c
	db $02, $00, $00, $cf, $fa, $3c
	db $02, $00, $5c, $f0, $10, $3c
	db $08, $00, $00, $fa, $4c, $3c
	db $09, $00, $00, $fa, $4c, $3c
	db $0a, $00, $00, $fa, $4c, $3c
	db $08, $00, $00, $fc, $0c, $3c
	db $09, $00, $00, $fc, $0c, $3c
	db $0a, $00, $00, $fc, $0c, $3c
	db $08, $00, $00, $cf, $fa, $3c
	db $09, $00, $00, $cf, $fa, $3c
	db $0a, $00, $00, $cf, $fa, $3c
	db $02, $00, $45, $f0, $10, $3c
	db $12, $00, $00, $ff, $ff, $3c
	db $12, $00, $00, $fc, $0c, $3c
	db $14, $00, $00, $cf, $fa, $3c
	db $15, $00, $00, $ff, $ff, $3c
	db $15, $00, $00, $fa, $4c, $3c
	db $15, $00, $00, $cf, $fa, $3c
	db $17, $00, $00, $ff, $ff, $3c
	db $17, $00, $00, $fa, $4c, $3c
	db $17, $00, $00, $cf, $fa, $3c
	db $1a, $00, $00, $ff, $ff, $3c
	db $11, $00, $00, $ff, $ff, $3c
	db $40, $00, $00, $ff, $ff, $3c
	db $40, $00, $00, $fa, $4c, $3c
	db $40, $00, $00, $fc, $0c, $3c
	db $40, $00, $00, $cf, $fa, $3c
	db $40, $00, $00, $e8, $18, $3c
	db $41, $00, $00, $ff, $ff, $3c
	db $41, $00, $00, $f6, $24, $3c
	db $41, $00, $00, $fc, $0c, $3c
	db $41, $00, $00, $cf, $fa, $3c
	db $02, $00, $1d, $ff, $ff, $3c
	db $1b, $00, $00, $ff, $ff, $3c
	db $00, $00, $00, $fa, $6c, $3c
	db $01, $00, $00, $fa, $6c, $3c
	db $02, $00, $00, $fa, $6c, $3c
	db $08, $00, $00, $fa, $6c, $3c
	db $09, $00, $00, $fa, $6c, $3c
	db $0a, $00, $00, $fa, $6c, $3c
	db $14, $00, $00, $fa, $6c, $3c
	db $15, $00, $00, $fa, $6c, $3c
	db $17, $00, $00, $fa, $6c, $3c
	db $1a, $00, $00, $fa, $4c, $3c
	db $14, $00, $00, $ff, $ff, $3c
; 0x314a6

Data_314a6: ; 314a6 (c:54a6)
	db $00, $11, $23, $56, $89, $ac, $de, $ef, $ff, $ee, $dc, $a9, $86, $53, $21, $10
	db $01, $23, $45, $67, $89, $ab, $cd, $ef, $fe, $dc, $ba, $98, $76, $54, $32, $10
; 0x314c6

	INCROM $314c6, $3155e

sound: MACRO
	dw \1 ; sound ptr
	db \2 ; sound bank
	db \3 ; unknown
	db \4 ; unknown, copied to w3d03e
	db \5 ; channel number
	db \6 ; unknown, copied to w3d03c
	db \7 ; padding
ENDM

filler_sounds: MACRO
rept \1
	sound $6a98, $0c, $00, $64, $00, $04, $00
endr
ENDM

Data_3155e: ; 3155e (c:555e)
	sound $6456, $44, $43, $32, $22, $21, $10 ; MUSIC_00
	sound $6a98, $0c, $00, $64, $00, $04, $00 ; MUSIC_OUT_OF_THE_WOODS_DAY
	sound $6d27, $0c, $00, $64, $00, $03, $00 ; MUSIC_OUT_OF_THE_WOODS_NIGHT
	sound $6eed, $0c, $00, $64, $00, $02, $00 ; MUSIC_FOREST_OF_FEAR
	sound $72e7, $0c, $00, $64, $00, $03, $00 ; MUSIC_THE_WARPED_VOID
	sound $75af, $0c, $00, $64, $00, $03, $00 ; MUSIC_DESERT_RUINS
	sound $77f9, $0c, $00, $64, $00, $03, $00 ; MUSIC_THE_FRIGID_SEA
	sound $7b2e, $0c, $00, $64, $00, $04, $00 ; MUSIC_THE_PEACEFUL_VILLAGE_DAY
	sound $7dd5, $0c, $00, $64, $00, $03, $00 ; MUSIC_THE_PEACEFUL_VILLAGE_NIGHT
	sound $4391, $0d, $00, $64, $00, $03, $00 ; MUSIC_ABOVE_THE_CLOUDS_DAY
	sound $481c, $0d, $00, $64, $00, $03, $00 ; MUSIC_ABOVE_THE_CLOUDS_NIGHT
	sound $4a50, $0d, $00, $64, $00, $03, $00 ; MUSIC_THE_VOLCANOS_BASE_NIGHT
	sound $4d69, $0d, $00, $64, $00, $03, $00 ; MUSIC_THE_VOLCANOS_BASE_DAY
	sound $5179, $0d, $00, $64, $00, $03, $00 ; MUSIC_THE_WEST_CRATER
	sound $547a, $0d, $00, $64, $00, $04, $00 ; MUSIC_THE_VAST_PLAIN_DAY
	sound $5718, $0d, $00, $64, $00, $04, $00 ; MUSIC_THE_VAST_PLAIN_NIGHT
	sound $5a63, $0d, $00, $64, $00, $04, $00 ; MUSIC_BANK_OF_THE_WILD_RIVER
	sound $5f44, $0d, $00, $64, $00, $04, $00 ; MUSIC_THE_TIDAL_COAST
	sound $64c6, $0d, $00, $64, $00, $04, $00 ; MUSIC_CAVE_OF_FLAMES
	sound $67cb, $0d, $00, $64, $00, $04, $00 ; MUSIC_THE_POOL_OF_RAIN_DAY
	sound $6997, $0d, $00, $64, $00, $04, $00 ; MUSIC_THE_POOL_OF_RAIN_NIGHT
	sound $7450, $0d, $00, $64, $00, $04, $00 ; MUSIC_CREDITS
	sound $75c1, $0d, $00, $64, $00, $03, $00 ; MUSIC_HOT_WARIO
	sound $76e0, $0d, $00, $64, $00, $03, $00 ; MUSIC_FAT_WARIO
	sound $7829, $0d, $00, $64, $00, $03, $00 ; MUSIC_BOUNCY_WARIO
	sound $7901, $0d, $00, $64, $00, $02, $00 ; MUSIC_ZOMBIE_WARIO
	sound $79e5, $0d, $00, $64, $00, $03, $00 ; MUSIC_FLAT_WARIO
	sound $7b78, $0d, $00, $64, $00, $03, $00 ; MUSIC_CRAZY_WARIO
	sound $7cf0, $0d, $00, $64, $00, $03, $00 ; MUSIC_INVISIBLE_WARIO
	sound $7df8, $0d, $00, $64, $00, $03, $00 ; MUSIC_SNOWMAN_WARIO
	sound $7f41, $0d, $00, $64, $00, $03, $00 ; MUSIC_OWL_WARIO
	sound $41e6, $0e, $00, $64, $00, $02, $00 ; MUSIC_BALL_O_STRING_WARIO
	sound $4351, $0e, $00, $64, $00, $03, $00 ; MUSIC_VAMPIRE_WARIO
	sound $46f6, $0e, $00, $64, $00, $04, $00 ; MUSIC_OVERWORLD_DAY
	sound $4951, $0e, $00, $64, $00, $03, $00 ; MUSIC_OVERWORLD_NIGHT
	sound $4a63, $0e, $00, $64, $00, $03, $00 ; MUSIC_LEVEL_CLEAR_NO_TREASURE
	sound $4b5e, $0e, $00, $64, $00, $04, $00 ; MUSIC_TREASURE_FANFARE
	sound $4bd6, $0e, $00, $64, $00, $02, $00 ; MUSIC_PAUSE_MENU
	sound $4f13, $0e, $00, $64, $00, $03, $00 ; MUSIC_GOLF
	sound $5308, $0e, $00, $64, $00, $04, $00 ; MUSIC_BOSS_BATTLE
	sound $54cc, $0e, $00, $64, $00, $04, $00 ; MUSIC_LEVEL_CLEAR_GOT_TREASURE
	sound $55e1, $0e, $00, $64, $00, $02, $00 ; MUSIC_BOSS_DEFEAT
	sound $5641, $0e, $00, $64, $00, $03, $00 ; MUSIC_GOLF_GAME_OVER
	sound $56bc, $0e, $00, $64, $00, $04, $00 ; MUSIC_GOLF_CLEARED
	sound $57f2, $0e, $00, $64, $00, $03, $00 ; MUSIC_MUSIC_BOXES
	sound $58b4, $0e, $00, $64, $00, $02, $00 ; MUSIC_45
	sound $5991, $0e, $00, $64, $00, $02, $00 ; MUSIC_POWER_UP_DEMO
	sound $5ba8, $0e, $00, $64, $00, $04, $00 ; MUSIC_GOLF_ROOM
	sound $5d53, $0e, $00, $64, $00, $03, $00 ; MUSIC_48
	sound $5db7, $0e, $00, $64, $00, $03, $00 ; MUSIC_49
	sound $5f11, $0e, $00, $64, $00, $02, $00 ; MUSIC_THE_TEMPLE
	sound $62ef, $0e, $00, $64, $00, $04, $00 ; MUSIC_TITLE_SCREEN
	sound $6641, $0e, $00, $64, $00, $03, $00 ; MUSIC_INTRO
	sound $6c2b, $0e, $00, $64, $00, $04, $00 ; MUSIC_HIDDEN_FIGURE_BATTLE_1
	sound $7152, $0e, $00, $64, $00, $04, $00 ; MUSIC_PERFECT
	sound $72a6, $0e, $00, $64, $00, $03, $00 ; MUSIC_TREASURE_COLLECTION
	sound $748d, $0e, $00, $64, $00, $03, $00 ; MUSIC_OUTRO
	sound $74e5, $0e, $00, $64, $00, $03, $00 ; MUSIC_HIDDEN_FIGURE_REVEAL
	sound $7834, $0e, $00, $64, $00, $04, $00 ; MUSIC_HIDDEN_FIGURE_BATTLE_2
	filler_sounds 198
	sound $785b, $0e, $00, $dc, $00, $01, $00
	sound $792e, $0e, $00, $ed, $03, $01, $00
	sound $793f, $0e, $00, $ec, $00, $01, $00
	sound $7958, $0e, $00, $e2, $03, $01, $00
	sound $7981, $0e, $00, $ec, $03, $01, $00
	sound $79bc, $0e, $00, $ec, $03, $01, $00
	sound $79d3, $0e, $00, $eb, $03, $01, $00
	sound $79f7, $0e, $00, $eb, $00, $02, $00
	sound $7a24, $0e, $00, $eb, $00, $01, $00
	sound $7a44, $0e, $00, $e6, $00, $01, $00
	sound $7a55, $0e, $00, $e6, $03, $01, $00
	sound $7a68, $0e, $00, $ed, $00, $01, $00
	sound $7aa6, $0e, $00, $eb, $00, $02, $00
	sound $7ac7, $0e, $00, $e4, $00, $01, $00
	sound $7add, $0e, $00, $d2, $00, $01, $00
	sound $7af2, $0e, $00, $e4, $03, $01, $00
	sound $7b05, $0e, $00, $c8, $00, $01, $00
	sound $7b38, $0e, $00, $ff, $00, $01, $00
	sound $7b70, $0e, $00, $ed, $02, $01, $00
	sound $7b83, $0e, $00, $ef, $00, $01, $00
	sound $7b94, $0e, $00, $d2, $00, $01, $00
	sound $7ba5, $0e, $00, $ef, $00, $01, $00
	sound $7bcf, $0e, $00, $ee, $00, $02, $00
	sound $7bfd, $0e, $00, $e6, $03, $01, $00
	sound $7c0e, $0e, $00, $ec, $00, $01, $00
	sound $7c21, $0e, $00, $ef, $02, $01, $00
	sound $7c85, $0e, $00, $dc, $00, $02, $00
	sound $7caa, $0e, $00, $c8, $00, $01, $00
	sound $7cbb, $0e, $00, $dc, $00, $01, $00
	sound $7ccc, $0e, $00, $dd, $03, $01, $00
	sound $7ce1, $0e, $00, $e4, $03, $01, $00
	sound $7d04, $0e, $00, $dd, $03, $01, $00
	sound $7d1d, $0e, $00, $dc, $03, $01, $00
	sound $7d2f, $0e, $00, $e5, $00, $01, $00
	sound $7d60, $0e, $00, $dc, $00, $01, $00
	sound $7dcc, $0e, $00, $ec, $00, $01, $00
	sound $7dea, $0e, $00, $f0, $00, $01, $00
	sound $7e15, $0e, $00, $dd, $00, $01, $00
	sound $7e44, $0e, $00, $dc, $03, $01, $00
	sound $7e63, $0e, $00, $e2, $00, $01, $00
	sound $7e7e, $0e, $00, $e2, $03, $01, $00
	sound $7eaf, $0e, $00, $e2, $03, $01, $00
	sound $7fc4, $0e, $00, $dc, $00, $01, $00
	sound $7fd5, $0e, $00, $dc, $00, $01, $00
	sound $7fee, $0e, $00, $dc, $00, $01, $00
	sound $4015, $0f, $00, $e8, $00, $01, $00
	sound $402a, $0f, $00, $ec, $00, $01, $00
	sound $403d, $0f, $00, $dc, $00, $01, $00
	sound $40ae, $0f, $00, $ff, $00, $02, $00
	sound $414f, $0f, $00, $ff, $00, $02, $00
	sound $4166, $0f, $00, $ed, $00, $01, $00
	sound $41ac, $0f, $00, $ed, $00, $02, $00
	sound $41c8, $0f, $00, $dd, $03, $01, $00
	sound $41ea, $0f, $00, $e4, $03, $01, $00
	sound $4206, $0f, $00, $dc, $00, $01, $00
	sound $4228, $0f, $00, $dc, $00, $02, $00
	sound $4253, $0f, $00, $dc, $00, $01, $00
	sound $4296, $0f, $00, $dc, $00, $01, $00
	sound $42ad, $0f, $00, $e6, $00, $01, $00
	sound $42d4, $0f, $00, $dc, $00, $01, $00
	sound $4329, $0f, $00, $dc, $00, $01, $00
	sound $4374, $0f, $00, $dc, $00, $01, $00
	sound $43dc, $0f, $00, $dc, $00, $02, $00
	sound $43f1, $0f, $00, $ec, $03, $01, $00
	sound $4418, $0f, $00, $dc, $00, $01, $00
	sound $4452, $0f, $00, $dc, $00, $01, $00
	sound $44a9, $0f, $00, $dc, $00, $01, $00
	sound $4520, $0f, $00, $dc, $03, $01, $00
	sound $4597, $0f, $00, $dc, $00, $03, $00
	sound $4617, $0f, $00, $dc, $00, $03, $00
	sound $4683, $0f, $00, $dc, $00, $01, $00
	sound $4718, $0f, $00, $ef, $00, $02, $00
	sound $472d, $0f, $00, $dc, $00, $01, $00
	sound $4741, $0f, $00, $c8, $00, $01, $00
	sound $477c, $0f, $00, $f0, $00, $01, $00
	sound $47eb, $0f, $00, $ef, $00, $02, $00
	filler_sounds 20
	sound $480f, $0f, $00, $ef, $03, $01, $00
	sound $482a, $0f, $00, $ed, $03, $01, $00
	sound $484c, $0f, $00, $ef, $03, $01, $00
	sound $48a1, $0f, $00, $dc, $00, $01, $00
	sound $48b7, $0f, $00, $dd, $03, $01, $00
	sound $48cc, $0f, $00, $dc, $00, $01, $00
	sound $48eb, $0f, $00, $dc, $00, $01, $00
	sound $4906, $0f, $00, $dc, $03, $01, $00
	sound $4919, $0f, $00, $dc, $00, $01, $00
	sound $493b, $0f, $00, $dc, $00, $01, $00
	sound $4952, $0f, $00, $dc, $00, $01, $00
	sound $49c0, $0f, $00, $dc, $00, $01, $00
	sound $49d5, $0f, $00, $dc, $03, $01, $00
	sound $49f3, $0f, $00, $dc, $03, $01, $00
	sound $4a12, $0f, $00, $dc, $00, $01, $00
	sound $4a2d, $0f, $00, $dc, $00, $01, $00
	sound $4a46, $0f, $00, $dc, $03, $01, $00
	sound $4a7d, $0f, $00, $dc, $03, $01, $00
	sound $4a92, $0f, $00, $e3, $03, $01, $00
	sound $4ad0, $0f, $00, $dd, $00, $01, $00
	sound $4af1, $0f, $00, $dc, $00, $01, $00
	sound $4b0a, $0f, $00, $eb, $03, $01, $00
	sound $4b30, $0f, $00, $dc, $02, $01, $00
	sound $4b44, $0f, $00, $f0, $03, $01, $00
	sound $4b7a, $0f, $00, $e3, $03, $01, $00
	sound $4b97, $0f, $00, $e3, $03, $01, $00
	sound $4bae, $0f, $00, $e3, $03, $01, $00
	sound $4c84, $0f, $00, $dc, $00, $02, $00
	sound $4c9d, $0f, $00, $dd, $03, $01, $00
	sound $4cb2, $0f, $00, $ef, $00, $01, $00
	sound $4ce7, $0f, $00, $dc, $00, $01, $00
	sound $4d08, $0f, $00, $dc, $03, $01, $00
	sound $4d77, $0f, $00, $e3, $00, $01, $00
	sound $4e0a, $0f, $00, $dc, $00, $02, $00
	sound $4e5a, $0f, $00, $dc, $00, $02, $00
	sound $4e7b, $0f, $00, $dc, $00, $01, $00
	sound $4e90, $0f, $00, $dc, $02, $01, $00
	sound $4ead, $0f, $00, $dc, $00, $01, $00
	sound $4ec2, $0f, $00, $dc, $03, $01, $00
	sound $4f36, $0f, $00, $dc, $00, $02, $00
	sound $4f57, $0f, $00, $e3, $03, $01, $00
	sound $4fd5, $0f, $00, $e3, $00, $02, $00
	sound $5000, $0f, $00, $dc, $00, $01, $00
	sound $502d, $0f, $00, $e3, $03, $01, $00
	sound $508c, $0f, $00, $dc, $00, $01, $00
	sound $50f9, $0f, $00, $ef, $00, $01, $00
	sound $511e, $0f, $00, $dc, $03, $01, $00
	filler_sounds 17
	sound $5163, $0f, $00, $ea, $03, $01, $00
	sound $51b3, $0f, $00, $ea, $00, $02, $00
	sound $51c6, $0f, $00, $ef, $00, $01, $00
	sound $51f5, $0f, $00, $ef, $02, $01, $00
	sound $5206, $0f, $00, $dc, $00, $01, $00
	sound $524b, $0f, $00, $dc, $02, $01, $00
	sound $52a8, $0f, $00, $ef, $02, $01, $00
	sound $52f2, $0f, $00, $ef, $00, $02, $00
	sound $5355, $0f, $00, $ef, $02, $01, $00
	sound $5385, $0f, $00, $ef, $00, $02, $00
	sound $53a9, $0f, $00, $ef, $00, $01, $00
	sound $54ba, $0f, $00, $ef, $00, $01, $00
	sound $54d0, $0f, $00, $dc, $00, $01, $00
	sound $54e7, $0f, $00, $dc, $00, $01, $00
	sound $54fe, $0f, $00, $dc, $00, $01, $00
	sound $5643, $0f, $00, $dc, $00, $02, $00
	sound $5684, $0f, $00, $ef, $00, $01, $00
	sound $5726, $0f, $00, $ef, $00, $02, $00
	sound $575b, $0f, $00, $ef, $00, $01, $00
	sound $5830, $0f, $00, $ef, $00, $01, $00
	sound $586d, $0f, $00, $ee, $00, $02, $00
	sound $58ac, $0f, $00, $ee, $00, $02, $00
	sound $58eb, $0f, $00, $ef, $00, $02, $00
	sound $592a, $0f, $00, $ef, $00, $02, $00
	sound $594b, $0f, $00, $dc, $00, $01, $00
	sound $596d, $0f, $00, $dc, $00, $02, $00
	sound $59b3, $0f, $00, $dc, $00, $02, $00
	sound $59ef, $0f, $00, $ef, $00, $01, $00
	sound $5a97, $0f, $00, $ef, $00, $01, $00
	sound $5aca, $0f, $00, $ef, $02, $01, $00
	sound $5b17, $0f, $00, $ef, $02, $01, $00
	sound $5b76, $0f, $00, $ef, $02, $01, $00
	sound $5b96, $0f, $00, $ee, $00, $02, $00
	sound $5be8, $0f, $00, $e6, $00, $01, $00
	sound $5bf9, $0f, $00, $db, $00, $01, $00
	sound $5c0a, $0f, $00, $dc, $00, $01, $00
	sound $5c1d, $0f, $00, $dc, $00, $01, $00
	sound $5c34, $0f, $00, $dc, $00, $01, $00
	sound $5cbc, $0f, $00, $ef, $00, $02, $00
	sound $5dd1, $0f, $00, $dc, $00, $01, $00
	sound $5de4, $0f, $00, $dc, $00, $01, $00
	sound $5e42, $0f, $00, $f0, $00, $02, $00
	sound $5e7c, $0f, $00, $ef, $03, $01, $00
	sound $5f77, $0f, $00, $dc, $00, $02, $00
	sound $6032, $0f, $00, $dc, $00, $03, $00
	sound $60c1, $0f, $00, $f0, $00, $02, $00
	sound $617f, $0f, $00, $dc, $00, $02, $00
	sound $623a, $0f, $00, $ef, $00, $01, $00
	sound $629e, $0f, $00, $ef, $00, $02, $00
	filler_sounds 15
	sound $62b7, $0f, $00, $ff, $00, $01, $00
	sound $62c8, $0f, $00, $dc, $00, $01, $00
	sound $62e8, $0f, $00, $dc, $00, $01, $00
	sound $6303, $0f, $00, $fb, $00, $01, $00
	sound $6333, $0f, $00, $e6, $00, $02, $00
	sound $6356, $0f, $00, $e3, $01, $01, $00
	sound $6376, $0f, $00, $dc, $00, $01, $00
	sound $6412, $0f, $00, $dc, $00, $01, $00
	sound $6440, $0f, $00, $dc, $00, $01, $00
	sound $646e, $0f, $00, $dc, $00, $01, $00
	sound $64bf, $0f, $00, $dc, $00, $02, $00
	sound $64d4, $0f, $00, $dc, $02, $01, $00
	sound $6506, $0f, $00, $dc, $03, $01, $00
	sound $6558, $0f, $00, $dc, $00, $01, $00
	sound $657b, $0f, $00, $ed, $00, $01, $00
	sound $65b4, $0f, $00, $dc, $00, $01, $00
	sound $65c9, $0f, $00, $ed, $00, $01, $00
	sound $65dc, $0f, $00, $dc, $00, $01, $00
	sound $65ef, $0f, $00, $dc, $03, $01, $00
	sound $6610, $0f, $00, $dc, $00, $01, $00
	sound $663d, $0f, $00, $dc, $03, $01, $00
	sound $6654, $0f, $00, $dc, $03, $01, $00
	sound $666b, $0f, $00, $dc, $03, $01, $00
	sound $6682, $0f, $00, $dc, $03, $01, $00
	sound $66a5, $0f, $00, $dc, $03, $01, $00
	sound $673f, $0f, $00, $ef, $00, $03, $00
	filler_sounds 6
	sound $678c, $0f, $00, $dc, $03, $01, $00
	sound $67c1, $0f, $00, $dc, $00, $01, $00
	sound $67da, $0f, $00, $dc, $03, $01, $00
	sound $6839, $0f, $00, $dc, $00, $01, $00
	sound $6972, $0f, $00, $dc, $00, $02, $00
	sound $6988, $0f, $00, $ed, $02, $01, $00
	sound $69a1, $0f, $00, $db, $00, $01, $00
	sound $6a09, $0f, $00, $dc, $00, $01, $00
	sound $6a29, $0f, $00, $dc, $00, $02, $00
	sound $6a4d, $0f, $00, $dc, $03, $01, $00
	sound $6a5e, $0f, $00, $dc, $00, $01, $00
	sound $6ac5, $0f, $00, $dc, $03, $01, $00
	sound $6ae2, $0f, $00, $ec, $00, $01, $00
	sound $6b57, $0f, $00, $dc, $00, $02, $00
	sound $6b72, $0f, $00, $dc, $03, $01, $00
	sound $6ba2, $0f, $00, $dc, $00, $02, $00
	sound $6bba, $0f, $00, $dc, $03, $01, $00
	sound $6c49, $0f, $00, $dc, $00, $03, $00
	sound $6c70, $0f, $00, $dc, $00, $01, $00
	sound $6c86, $0f, $00, $dc, $03, $01, $00
	sound $6c9c, $0f, $00, $dc, $03, $01, $00
	sound $6cb2, $0f, $00, $dc, $03, $01, $00
	sound $6cf5, $0f, $00, $dc, $00, $02, $00
	sound $6d32, $0f, $00, $dc, $00, $02, $00
	sound $6d7c, $0f, $00, $dc, $00, $01, $00
	sound $6d9d, $0f, $00, $dc, $00, $01, $00
	sound $6ef2, $0f, $00, $dc, $00, $02, $00
	sound $6f2d, $0f, $00, $dc, $00, $01, $00
	sound $6f94, $0f, $00, $dc, $00, $01, $00
	sound $6fcb, $0f, $00, $dc, $00, $02, $00
	sound $7009, $0f, $00, $dc, $00, $02, $00
	sound $7042, $0f, $00, $dc, $00, $02, $00
	sound $707f, $0f, $00, $dc, $00, $02, $00
	sound $70a4, $0f, $00, $dc, $00, $01, $00
	sound $70cd, $0f, $00, $dc, $00, $01, $00
	sound $70fe, $0f, $00, $dc, $03, $01, $00
	sound $710f, $0f, $00, $dc, $03, $01, $00
	sound $7120, $0f, $00, $dc, $03, $01, $00
	sound $7154, $0f, $00, $dc, $01, $02, $00
	sound $71a7, $0f, $00, $dc, $00, $01, $00
	sound $71c0, $0f, $00, $ef, $03, $01, $00
	sound $71d9, $0f, $00, $dc, $03, $01, $00
	sound $71ea, $0f, $00, $dc, $02, $01, $00
	sound $720a, $0f, $00, $dc, $00, $02, $00
	sound $7229, $0f, $00, $dc, $03, $01, $00
	sound $72a5, $0f, $00, $dc, $00, $04, $00
	sound $72c9, $0f, $00, $dc, $03, $01, $00
	sound $72de, $0f, $00, $dc, $03, $01, $00
	sound $72f3, $0f, $00, $dc, $03, $01, $00
	sound $7308, $0f, $00, $dc, $00, $01, $00
	sound $731b, $0f, $00, $dc, $02, $01, $00
	sound $732c, $0f, $00, $dc, $00, $01, $00
	sound $734d, $0f, $00, $dc, $00, $01, $00
	sound $7362, $0f, $00, $ec, $01, $01, $00
	sound $7375, $0f, $00, $e2, $03, $01, $00
	sound $738e, $0f, $00, $dc, $03, $01, $00
; 0x32726

	INCROM $32726, $33de9

rept $217
	db $00
endr
