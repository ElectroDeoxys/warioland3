Music_CrazyWario_Ch1:
	semitone_offset 1
	tempo 51
	wave WAVE_14
	volume 75
	vibrato_amplitude 40
	audio_wait_96
	audio_wait_96

.loop
	audio_wait_16
	note NOTE_DURATION_24, C_4, 19
	audio_wait_24
	note NOTE_DURATION_8, G_3
	audio_wait_8
	note NOTE_DURATION_24, E_3
	audio_wait_24
	note NOTE_DURATION_8, C_3
	audio_wait_8
	note B_2
	audio_wait_8
	note C_3
	audio_wait_8
	note D_3
	audio_wait_16
	note C#3
	audio_wait_8
	note D_3
	audio_wait_16
	note F_3
	audio_wait_8
	note NOTE_DURATION_48, A_3
	audio_wait_48
	audio_wait_16
	note NOTE_DURATION_24, B_3
	audio_wait_24
	note NOTE_DURATION_8, F_3
	audio_wait_8
	note D_3
	audio_wait_16
	note C#3
	audio_wait_8
	note D_3
	audio_wait_16
	note F_3
	audio_wait_8
	note E_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_8, F_3
	audio_wait_16
	note F#3
	audio_wait_8
	note NOTE_DURATION_48, G_3
	audio_wait_48
	audio_wait_16
	note NOTE_DURATION_24, C_4
	audio_wait_24
	note NOTE_DURATION_8, G_3
	audio_wait_8
	note NOTE_DURATION_24, D#3
	audio_wait_24
	note NOTE_DURATION_8, C_3
	audio_wait_8
	note B_2
	audio_wait_8
	note C_3
	audio_wait_8
	note C#3
	audio_wait_16
	note C_3
	audio_wait_8
	note C#3
	audio_wait_16
	note F_3
	audio_wait_8
	note G#3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_8, A#3
	audio_wait_16
	note G#3
	audio_wait_8
	note G_3
	audio_wait_72
	note G_2
	audio_wait_8
	note A_2
	audio_wait_8
	note B_2
	audio_wait_8
	note C_3
	audio_wait_96
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_CrazyWario_Ch2:
	semitone_offset 1
	wave WAVE_4B
	volume 75
	audio_wait_64
	note NOTE_DURATION_3, C_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_8
.sub1
	audio_wait_64
	note NOTE_DURATION_3, C_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_8
	audio_ret

.loop
	audio_call .sub1
	audio_wait_64
	note NOTE_DURATION_3, D_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_8
	audio_wait_64
	note NOTE_DURATION_3, B_1
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_8
	audio_wait_48
	note NOTE_DURATION_3, G_0
	audio_wait_16
	note NOTE_DURATION_8, G#0
	audio_wait_8
	note A_0
	audio_wait_8
	note A#0
	audio_wait_8
	note B_0
	audio_wait_8
	audio_call .sub1
	audio_wait_64
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_8
	audio_wait_24
	note NOTE_DURATION_3, G_0
	audio_wait_8
	note B_0
	audio_wait_8
	note D#1
	audio_wait_8
	note G_1
	audio_wait_48
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_CrazyWario_Ch3:
	semitone_offset 1
	wave WAVE_61
	volume 103
	note NOTE_DURATION_3, C_1, 24
	audio_wait_16
	note NOTE_DURATION_4, G_1
	audio_wait_4
	note C_2
	audio_wait_4
	note E_2
	audio_wait_16
	note NOTE_DURATION_3, G_0
	audio_wait_8
	note C_1
	audio_wait_16
	note E_2
	audio_wait_8
	note G_0
	audio_wait_16
	note E_2
	audio_wait_8
.sub1
	note NOTE_DURATION_3, C_1, 24
	audio_wait_16
	note NOTE_DURATION_4, G_1
	audio_wait_4
	note C_2
	audio_wait_4
	note E_2
	audio_wait_16
	note NOTE_DURATION_3, G_0
	audio_wait_8
	note C_1
	audio_wait_16
	note E_2
	audio_wait_8
	note G_0
	audio_wait_16
	note E_2
	audio_wait_8
	audio_ret

.loop
	audio_call .sub1
	note NOTE_DURATION_3, D_0, 24
	audio_wait_16
	note NOTE_DURATION_4, A_1
	audio_wait_4
	note D_2
	audio_wait_4
	note F_2
	audio_wait_16
	note NOTE_DURATION_3, A_0
	audio_wait_8
	note D_0
	audio_wait_16
	note F_2
	audio_wait_8
	note A_0
	audio_wait_16
	note F_2
	audio_wait_8
	note G_0
	audio_wait_16
	note NOTE_DURATION_4, G_1
	audio_wait_4
	note B_1
	audio_wait_4
	note F_2
	audio_wait_16
	note NOTE_DURATION_3, D_0
	audio_wait_8
	note G_0
	audio_wait_16
	note F_2
	audio_wait_8
	note B_0
	audio_wait_16
	note F_2
	audio_wait_8
	note C_1
	audio_wait_16
	note NOTE_DURATION_4, G_1
	audio_wait_4
	note C_2
	audio_wait_4
	note E_2
	audio_wait_16
	note NOTE_DURATION_3, C_1
	audio_wait_8
	note G_1
	audio_wait_16
	note NOTE_DURATION_8, G#1
	audio_wait_8
	note A_1
	audio_wait_8
	note A#1
	audio_wait_8
	note B_1
	audio_wait_8
	note NOTE_DURATION_3, C_1
	audio_wait_16
	note NOTE_DURATION_4, G_1
	audio_wait_4
	note C_2
	audio_wait_4
	note D#2
	audio_wait_16
	note NOTE_DURATION_3, G_0
	audio_wait_8
	note C_1
	audio_wait_16
	note D#2
	audio_wait_8
	note G_0
	audio_wait_16
	note D#2
	audio_wait_8
	note C#0
	audio_wait_16
	note NOTE_DURATION_4, G#1
	audio_wait_4
	note C#2
	audio_wait_4
	note F_2
	audio_wait_16
	note NOTE_DURATION_3, G#0
	audio_wait_8
	note C#0
	audio_wait_16
	note F_2
	audio_wait_8
	note G#0
	audio_wait_16
	note F_2
	audio_wait_8
	note G_0
	audio_wait_24
	note B_1
	audio_wait_8
	note D#2
	audio_wait_8
	note G_2
	audio_wait_8
	note B_2
	audio_wait_24
	note G_0
	audio_wait_8
	note A_0
	audio_wait_8
	note B_0
	audio_wait_8
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_CrazyWario:
	db $3, $2
	dw Music_CrazyWario_Ch1
	dw Music_CrazyWario_Ch2
	dw Music_CrazyWario_Ch3

; unused?
	dw Music_CrazyWario_Ch1.loop
	dw Music_CrazyWario_Ch2.loop
	dw Music_CrazyWario_Ch3.loop

	dw Music_CrazyWario_Ch1.end
	dw Music_CrazyWario_Ch2.end
	dw Music_CrazyWario_Ch3.end
