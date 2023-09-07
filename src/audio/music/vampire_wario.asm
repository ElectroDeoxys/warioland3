Music_VampireWario_Ch1: ; 381f4 (0e:41f4)
	semitone_offset 1
	tempo 60
	wave WAVE_17
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 85
	audio_wait_96

.loop
.sub1
	audio_wait_72
	note NOTE_DURATION_8, G_0, 23
	audio_wait_8
	note A_0
	audio_wait_8
	note B_0
	audio_wait_8
	audio_ret

	note NOTE_DURATION_4, C_1
	audio_wait_48
	note D#1
	audio_wait_48
	note D_1
	audio_wait_48
	note F#1
	audio_wait_48
	note F_1
	audio_wait_48
	note NOTE_DURATION_24, D#1
	audio_wait_24
	note NOTE_DURATION_16, B_0
	audio_wait_16
	note NOTE_DURATION_4, C_1
	audio_wait_8
	audio_wait_72
	note NOTE_DURATION_8, G_1
	audio_wait_8
	note A_1
	audio_wait_8
	note B_1
	audio_wait_8
	note NOTE_DURATION_4, C_2
	audio_wait_48
	note D#2
	audio_wait_48
	note D_2
	audio_wait_48
	note F#2
	audio_wait_48
	note F_2
	audio_wait_48
	note NOTE_DURATION_16, D#2
	audio_wait_16
	note NOTE_DURATION_8, B_1
	audio_wait_8
	note NOTE_DURATION_16, D_2
	audio_wait_16
	note NOTE_DURATION_8, C_2
	audio_wait_8
	audio_wait_96
	note NOTE_DURATION_16
	audio_wait_24
	note NOTE_DURATION_16
	audio_wait_16
	note NOTE_DURATION_4, B_1
	audio_wait_56
	note NOTE_DURATION_16, D#2
	audio_wait_24
	note NOTE_DURATION_16
	audio_wait_16
	note NOTE_DURATION_4, D_2
	audio_wait_56
	note G#2
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4, F#2
	audio_wait_24
	note NOTE_DURATION_16
	audio_wait_16
	note NOTE_DURATION_4, G_2
	audio_wait_8
	audio_call .sub1
	note NOTE_DURATION_4, C_1, 23
	audio_wait_48
	note NOTE_DURATION_16, G_1
	audio_wait_16
	note NOTE_DURATION_8, D#1
	audio_wait_8
	note NOTE_DURATION_16, C_1
	audio_wait_16
	note NOTE_DURATION_8, C#1
	audio_wait_8
	audio_wait_48
	note NOTE_DURATION_16, G#1
	audio_wait_16
	note NOTE_DURATION_8, F_1
	audio_wait_8
	note NOTE_DURATION_16, C#1
	audio_wait_16
	note NOTE_DURATION_8, C_1
	audio_wait_8
	note NOTE_DURATION_4, B_0
	audio_wait_48
	note NOTE_DURATION_16, G_0
	audio_wait_16
	note NOTE_DURATION_8, A_0
	audio_wait_8
	note NOTE_DURATION_16, B_0
	audio_wait_16
	note NOTE_DURATION_8, C_1
	audio_wait_8
	audio_wait_96
	audio_jump .loop
.end
	audio_call .sub1
	audio_end
; 0x38295

Music_VampireWario_Ch2: ; 38295 (0e:4295)
	semitone_offset 1
	wave WAVE_0D
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 85
	audio_wait_96

.loop
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
.sub1
	note NOTE_DURATION_16, G#1, 23
	audio_wait_24
	note NOTE_DURATION_16
	audio_wait_16
	note NOTE_DURATION_4, G_1
	audio_wait_56
	audio_ret

	audio_call .sub1
	note NOTE_DURATION_4, G#1, 23
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_16
	audio_wait_16
	note NOTE_DURATION_4, G_1
	audio_wait_8
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_jump .loop
.end
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	note NOTE_DURATION_16, G#1, 23
	audio_wait_16
	audio_end
; 0x382dd

Music_VampireWario_Ch3: ; 382dd (0e:42dd)
	semitone_offset 0
	wave WAVE_28
	volume 85
	note NOTE_DURATION_5, C#0, 22
	audio_wait_24
	note NOTE_DURATION_2, E_0
	audio_wait_16
	note NOTE_DURATION_2, E_0
	audio_wait_8
	note NOTE_DURATION_5, C#0
	audio_wait_24
	note NOTE_DURATION_2, E_0
	audio_wait_16
	note NOTE_DURATION_2, E_0
	audio_wait_8

.loop
.sub1
	note NOTE_DURATION_5, C#0, 22
	audio_wait_24
	note NOTE_DURATION_2, E_0
	audio_wait_16
	note NOTE_DURATION_2, E_0
	audio_wait_8
	note NOTE_DURATION_5, C#0
	audio_wait_24
	note NOTE_DURATION_2, E_0
	audio_wait_16
	note NOTE_DURATION_2, E_0
	audio_wait_8
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	note NOTE_DURATION_5, C#0, 22
	audio_wait_24
	note NOTE_DURATION_2, E_0
	audio_wait_16
	note NOTE_DURATION_2, E_0
	audio_wait_8
	note NOTE_DURATION_5, C#0
	audio_wait_24
	note NOTE_DURATION_2, E_0
	audio_wait_16
	note NOTE_DURATION_2, E_0
	audio_wait_1
	audio_end
; 0x38351

Music_VampireWario: ; 38351 (0e:4351)
	db 3, 2
	dw Music_VampireWario_Ch1
	dw Music_VampireWario_Ch2
	dw Music_VampireWario_Ch3

; unused?
	dw Music_VampireWario_Ch1.loop
	dw Music_VampireWario_Ch2.loop
	dw Music_VampireWario_Ch3.loop

	dw Music_VampireWario_Ch1.end
	dw Music_VampireWario_Ch2.end
	dw Music_VampireWario_Ch3.end
; 0x38365
