Music_HotWario_Ch1: ; 3745a (0d:745a)
	semitone_offset 0

.loop
	tempo 85
	wave WAVE_16
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	note NOTE_DURATION_36, F_3, 19
	audio_wait_36
	note NOTE_DURATION_6, E_3
	audio_wait_6
	note D#3
	audio_wait_6
	note NOTE_DURATION_48, D_3
	audio_wait_48
.sub1
	audio_wait_12
	wave WAVE_1A
	note NOTE_DURATION_12, D_3, 19
	audio_wait_12
	note NOTE_DURATION_4, D_4
	audio_wait_12
	note D_3
	audio_wait_24
	note NOTE_DURATION_12, D_4
	audio_wait_12
	note NOTE_DURATION_4, D_5
	audio_wait_12
	note D_4
	audio_wait_12
	audio_ret

.sub2
	wave WAVE_16
	note NOTE_DURATION_36, F_3, 19
	audio_wait_36
	note NOTE_DURATION_6, E_3
	audio_wait_6
	note D#3
	audio_wait_6
	note NOTE_DURATION_48, D_3
	audio_wait_48
	audio_ret

	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_36, F_3, 19
	audio_wait_36
	note NOTE_DURATION_6, E_3
	audio_wait_6
	note D#3
	audio_wait_6
	note NOTE_DURATION_48, D_3
	audio_wait_48
	audio_wait_12
	wave WAVE_1A
	note NOTE_DURATION_12, D_4
	audio_wait_12
	note NOTE_DURATION_4, D_5
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_12, D_4
	audio_wait_12
	note NOTE_DURATION_4, G#3
	audio_wait_12
	note F#3
	audio_wait_12
	note D#3
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_12, D_4
	audio_wait_12
	note NOTE_DURATION_4, D_5
	audio_wait_12
	note D_4
	audio_wait_12
	note D_5
	audio_wait_48
	audio_jump .loop
.end
	audio_end
; 0x374d1

Music_HotWario_Ch2: ; 374d1 (0d:74d1)
	semitone_offset 0

.loop
	wave WAVE_10
	volume 75
	audio_wait_12
	note NOTE_DURATION_4, C#2, 19
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
.sub1
	audio_wait_12
	note NOTE_DURATION_4, D_2, 19
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_wait_12
	note NOTE_DURATION_4, E_2, 19
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_4, F#2
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_12, D_2
	audio_wait_12
	note NOTE_DURATION_4, G#2
	audio_wait_12
	note F#2
	audio_wait_12
	note D_2
	audio_wait_12
	note NOTE_DURATION_12, C#2
	audio_wait_12
	note NOTE_DURATION_4, G#1
	audio_wait_12
	note F#1
	audio_wait_12
	note D_1
	audio_wait_12
	note C#1
	audio_wait_24
	note NOTE_DURATION_6, D_0
	audio_wait_6
	note D#0
	audio_wait_6
	note E_0
	audio_wait_6
	note F_0
	audio_wait_6
	note F#0
	audio_wait_48
	audio_jump .loop
.end
	audio_end
; 0x37534

Music_HotWario_Ch3: ; 37534 (0d:7534)
	semitone_offset 0

.loop
	wave WAVE_60
	volume 94
	note NOTE_DURATION_4, G_1, 24
	audio_wait_12
	note D_2
	audio_wait_12
	note D_1
	audio_wait_12
	note D_2
	audio_wait_12
	note G_1
	audio_wait_12
	note D_2
	audio_wait_12
	note D_1
	audio_wait_12
	note D_2
	audio_wait_12
	note G_1
	audio_wait_12
	note D_2
	audio_wait_12
	note D_1
	audio_wait_12
	note D_2
	audio_wait_12
	note G_1
	audio_wait_12
	note D_2
	audio_wait_12
	note D_1
	audio_wait_12
	note D_2
	audio_wait_12
.sub1
	note NOTE_DURATION_4, G#1, 24
	audio_wait_12
	note D#2
	audio_wait_12
	note D#1
	audio_wait_12
	note D#2
	audio_wait_12
	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note D#1
	audio_wait_12
	note D#2
	audio_wait_12
	audio_ret

	audio_call .sub1
	note NOTE_DURATION_4, A#1, 24
	audio_wait_12
	note F_2
	audio_wait_12
	note F_1
	audio_wait_12
	note F_2
	audio_wait_12
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note F_1
	audio_wait_12
	note F_2
	audio_wait_12
	note C_2
	audio_wait_12
	note G_2
	audio_wait_12
	note G_1
	audio_wait_12
	note G_2
	audio_wait_12
	note C_2
	audio_wait_12
	note G_2
	audio_wait_12
	note G_1
	audio_wait_12
	note G_2
	audio_wait_12
	note NOTE_DURATION_12, D_3
	audio_wait_12
	note NOTE_DURATION_4, A_2
	audio_wait_12
	note G_2
	audio_wait_12
	note D#2
	audio_wait_12
	note NOTE_DURATION_12, D_2
	audio_wait_12
	note NOTE_DURATION_4, A_1
	audio_wait_12
	note G_1
	audio_wait_12
	note D#1
	audio_wait_12
	note D_1
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, D#1
	audio_wait_6
	note E_1
	audio_wait_6
	note F_1
	audio_wait_6
	note F#1
	audio_wait_24
	note NOTE_DURATION_12, D_1
	audio_wait_12
	note NOTE_DURATION_6, E_1
	audio_wait_6
	note F#1
	audio_wait_6
	audio_jump .loop
.end
	audio_end
; 0x375c1

Music_HotWario: ; 375c1 (d:75c1)
	db $3, $2
	dw Music_HotWario_Ch1
	dw Music_HotWario_Ch2
	dw Music_HotWario_Ch3

; unused?
	dw Music_HotWario_Ch1.loop
	dw Music_HotWario_Ch2.loop
	dw Music_HotWario_Ch3.loop

	dw Music_HotWario_Ch1.end
	dw Music_HotWario_Ch2.end
	dw Music_HotWario_Ch3.end
