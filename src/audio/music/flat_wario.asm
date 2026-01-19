Music_FlatWario_Ch1:
	semitone_offset 1
	tempo 72
	wave WAVE_1C
	volume 70
	vibrato_amplitude 20
	note NOTE_DURATION_12, C_4, 19
	audio_wait 12
	note B_3
	audio_wait 12

.loop
	note NOTE_DURATION_48, A#3, 19
	audio_wait 48
	note NOTE_DURATION_24, G_3
	audio_wait 24
	note NOTE_DURATION_48, E_3
	audio_wait 48
	note NOTE_DURATION_24, C_3
	audio_wait 24
	wave WAVE_55
	note NOTE_DURATION_5, C#3
	audio_wait 24
	note G#3
	audio_wait 48
	note C#4
	audio_wait 24
	note G#4
	audio_wait 24
	wave WAVE_1C
	note NOTE_DURATION_12, D_4
	audio_wait 12
	note C#4
	audio_wait 12
	note NOTE_DURATION_24, C_4
	audio_wait 24
	note A_3
	audio_wait 24
	note F#3
	audio_wait 24
	note D#3
	audio_wait 24
	note D_3
	audio_wait 24
	note C#3
	audio_wait 24
	wave WAVE_55
	note NOTE_DURATION_5, D_3
	audio_wait 22
	note NOTE_DURATION_2, G#3
	audio_wait 2
	note NOTE_DURATION_5, A_3
	audio_wait 48
	note G_3
	audio_wait 22
	note NOTE_DURATION_2, F#4
	audio_wait 2
	note NOTE_DURATION_5, G_4
	audio_wait 24
	wave WAVE_1C
	note NOTE_DURATION_12, C_4
	audio_wait 12
	note B_3
	audio_wait 12
	audio_jump .loop
.end
	audio_end

Music_FlatWario_Ch2:
	semitone_offset 1
	wave WAVE_48
	volume 75
	audio_wait 24

.loop
.sub1
	audio_wait 24
	note NOTE_DURATION_5, E_1, 19
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	audio_ret

	audio_call .sub1
.sub2
	audio_wait 24
	note NOTE_DURATION_5, F_1, 19
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	audio_ret

	audio_call .sub2
.sub3
	audio_wait 24
	note NOTE_DURATION_5, F#1, 19
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	audio_ret

	audio_wait 24
	note NOTE_DURATION_5, G_1
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	audio_call .sub3
	audio_wait 24
	note NOTE_DURATION_5, B_1, 19
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	audio_jump .loop
.end
	audio_end

Music_FlatWario_Ch3:
	semitone_offset 1
	wave WAVE_61
	volume 94
	audio_wait 24

.loop
	note NOTE_DURATION_5, C_1, 22
	audio_wait 24
	note G_1
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	note NOTE_DURATION_5, G_0
	audio_wait 24
	note G_1
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	note NOTE_DURATION_5, C#1
	audio_wait 24
	note G#1
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	note NOTE_DURATION_5, G#0
	audio_wait 24
	note G#1
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	note NOTE_DURATION_5, D_1
	audio_wait 24
	note A_1
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	note NOTE_DURATION_5, D#1
	audio_wait 24
	note A#1
	audio_wait 24
	note C#2
	audio_wait 24
	note D_1
	audio_wait 24
	note C_2
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	note NOTE_DURATION_5, G_1
	audio_wait 24
	note F_2
	audio_wait 24
	note NOTE_DURATION_5
	audio_wait 24
	audio_jump .loop
.end
	audio_end

Music_FlatWario:
	db $3, $2
	dw Music_FlatWario_Ch1
	dw Music_FlatWario_Ch2
	dw Music_FlatWario_Ch3

; unused?
	dw Music_FlatWario_Ch1.loop
	dw Music_FlatWario_Ch2.loop
	dw Music_FlatWario_Ch3.loop

	dw Music_FlatWario_Ch1.end
	dw Music_FlatWario_Ch2.end
	dw Music_FlatWario_Ch3.end
