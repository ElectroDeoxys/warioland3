Music_OwlWario_Ch1:
	semitone_offset 0

.loop
	tempo 90
	wave WAVE_14
	vibrato_amplitude 20
	volume 75
	note NOTE_DURATION_24, F_4, 19
	audio_wait_24
	note NOTE_DURATION_12, E_4
	audio_wait_12
	note D#4
	audio_wait_12
	note D_4
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note B_3
	audio_wait_12
	note NOTE_DURATION_6, A#3
	audio_wait_24
	note A_3
	audio_wait_24
	note_sustain
	note G#3
	audio_wait_72
	audio_wait_60
	note NOTE_DURATION_0
	audio_wait_12
	note NOTE_DURATION_24, F_3
	audio_wait_24
	note NOTE_DURATION_12, E_3
	audio_wait_12
	note D#3
	audio_wait_12
	note D_3
	audio_wait_12
	note C#3
	audio_wait_12
	note C_3
	audio_wait_12
	note B_2
	audio_wait_12
	note NOTE_DURATION_6, A#2
	audio_wait_24
	note E_3
	audio_wait_24
	note_sustain
	note C#3
	audio_wait_72
	audio_wait_60
	note NOTE_DURATION_0
	audio_wait_12
	note NOTE_DURATION_12, F_4
	audio_wait_12
	note G#4
	audio_wait_12
	note G_4
	audio_wait_12
	note F#4
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note D#4
	audio_wait_12
	note D_4
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_8, B_3
	audio_wait_8
	note A#3
	audio_wait_8
	note A_3
	audio_wait_8
	note_sustain
	note G#3
	audio_wait_72
	audio_wait_60
	note NOTE_DURATION_0
	audio_wait_12
	note NOTE_DURATION_12, F_3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note F#3
	audio_wait_12
	note F_3
	audio_wait_12
	note E_3
	audio_wait_12
	note D#3
	audio_wait_12
	note D_3
	audio_wait_12
	note C#3
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_8, B_2
	audio_wait_8
	note A#2
	audio_wait_8
	note E_3
	audio_wait_8
	note NOTE_DURATION_3, C#3
	audio_wait_24
	note NOTE_DURATION_12, G#2
	audio_wait_12
	note A_2
	audio_wait_12
	note A#2
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_3, C#3
	audio_wait_72
	audio_jump .loop
.end
	audio_end

Music_OwlWario_Ch2:
	semitone_offset 0

.loop
	wave WAVE_48
	volume 75
	audio_wait_24
	note NOTE_DURATION_3, F_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
.sub1
	audio_wait_24
	note NOTE_DURATION_3, D_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub2
	audio_wait_24
	note NOTE_DURATION_3, F_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	note NOTE_DURATION_3, C#2, 19
	audio_wait_72
	audio_wait_72
	audio_jump .loop
.end
	audio_end

Music_OwlWario_Ch3:
	semitone_offset 0

.loop
	wave WAVE_60
	volume 94
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note G#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
.sub1
	note NOTE_DURATION_3, G#1, 19
	audio_wait_24
	note F#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub2
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note G#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note NOTE_DURATION_12, G#1
	audio_wait_12
	note A_1
	audio_wait_12
	note A#1
	audio_wait_12
	note C_2
	audio_wait_12
	note NOTE_DURATION_3, C#2
	audio_wait_48
	note NOTE_DURATION_8, G#1
	audio_wait_8
	note A#1
	audio_wait_8
	note C_2
	audio_wait_8
	audio_jump .loop
.end
	audio_end

Music_OwlWario:
	db $3, $2
	dw Music_OwlWario_Ch1
	dw Music_OwlWario_Ch2
	dw Music_OwlWario_Ch3

; unused?
	dw Music_OwlWario_Ch1.loop
	dw Music_OwlWario_Ch2.loop
	dw Music_OwlWario_Ch3.loop

	dw Music_OwlWario_Ch1.end
	dw Music_OwlWario_Ch2.end
	dw Music_OwlWario_Ch3.end
