Music_BouncyWario_Ch1:
	semitone_offset 1
	audio_wait 24

.loop
	tempo 56
	wave WAVE_61
	volume 80
	note NOTE_DURATION_4, E_3, 20
	audio_wait 24
	note NOTE_DURATION_4
	audio_wait 16
	note NOTE_DURATION_4, D_3
	audio_wait 8
	note C_3
	audio_wait 16
	note D_3
	audio_wait 4
	note E_3
	audio_wait 4
	note NOTE_DURATION_8, D_3
	audio_wait 16
	note NOTE_DURATION_4, C_3
	audio_wait 8
	note NOTE_DURATION_8, D_3
	audio_wait 16
	note NOTE_DURATION_4, C#3
	audio_wait 8
	note NOTE_DURATION_8, D_3
	audio_wait 16
	note NOTE_DURATION_4, E_3
	audio_wait 8
	note NOTE_DURATION_48, F_3
	audio_wait 48
	note NOTE_DURATION_4, B_2
	audio_wait 24
	note NOTE_DURATION_4
	audio_wait 16
	note NOTE_DURATION_4, C_3
	audio_wait 8
	note D_3
	audio_wait 16
	note E_3
	audio_wait 4
	note F_3
	audio_wait 4
	note NOTE_DURATION_8, E_3
	audio_wait 16
	note NOTE_DURATION_4, D#3
	audio_wait 8
	note NOTE_DURATION_8, E_3
	audio_wait 16
	note NOTE_DURATION_4, D#3
	audio_wait 8
	note NOTE_DURATION_8, E_3
	audio_wait 16
	note NOTE_DURATION_4, F_3
	audio_wait 8
	note NOTE_DURATION_48, G_3
	audio_wait 48
	note NOTE_DURATION_4, E_3
	audio_wait 24
	note NOTE_DURATION_4
	audio_wait 16
	note NOTE_DURATION_4, D_3
	audio_wait 8
	note C_3
	audio_wait 16
	note D_3
	audio_wait 4
	note E_3
	audio_wait 4
	note NOTE_DURATION_8, D_3
	audio_wait 16
	note NOTE_DURATION_4, C_3
	audio_wait 8
	note NOTE_DURATION_8, D_3
	audio_wait 16
	note NOTE_DURATION_4, C#3
	audio_wait 8
	note NOTE_DURATION_8, D_3
	audio_wait 16
	note NOTE_DURATION_4, E_3
	audio_wait 8
	note NOTE_DURATION_44, F_3
	audio_wait 40
	note NOTE_DURATION_4, G_3
	audio_wait 4
	note F_3
	audio_wait 4
	note NOTE_DURATION_8, E_3
	audio_wait 16
	note NOTE_DURATION_4, G_3
	audio_wait 8
	note NOTE_DURATION_8, C_4
	audio_wait 16
	note NOTE_DURATION_4, E_4
	audio_wait 8
	note NOTE_DURATION_8, D_4
	audio_wait 16
	note NOTE_DURATION_4, A_3
	audio_wait 8
	note NOTE_DURATION_8, B_3
	audio_wait 16
	note NOTE_DURATION_4, C_4
	audio_wait 8
	note NOTE_DURATION_96, D_4
	audio_wait 96
	audio_jump .loop
.end
	audio_end

Music_BouncyWario_Ch2:
	semitone_offset 1
	audio_wait 24

.loop
	wave WAVE_4B
	volume 75
	audio_wait 24
	note NOTE_DURATION_4, E_2, 19
	audio_wait 48
	note NOTE_DURATION_4
	audio_wait 24
.sub1
	audio_wait 24
	note NOTE_DURATION_4, F_2, 19
	audio_wait 48
	note NOTE_DURATION_4
	audio_wait 24
	audio_ret

	audio_call .sub1
	audio_wait 24
	note NOTE_DURATION_4, E_2, 19
	audio_wait 72
	audio_wait 24
	note NOTE_DURATION_4
	audio_wait 48
	note NOTE_DURATION_4
	audio_wait 24
.sub2
	audio_wait 24
	note NOTE_DURATION_4, C_2, 19
	audio_wait 48
	note NOTE_DURATION_4
	audio_wait 24
	audio_ret

	audio_call .sub2
	audio_wait 24
	note NOTE_DURATION_16, F_3, 19
	audio_wait 16
	note NOTE_DURATION_8, F#3
	audio_wait 8
	note NOTE_DURATION_24, G_3
	audio_wait 48
	audio_jump .loop
.end
	audio_end

Music_BouncyWario_Ch3:
	semitone_offset 1
	audio_wait 24

.loop
	wave WAVE_55
	volume 85
	note NOTE_DURATION_4, C_2, 24
	audio_wait 24
	note G_2
	audio_wait 24
	note G_1
	audio_wait 24
	note G_2
	audio_wait 24
	note D_2
	audio_wait 24
	note A_2
	audio_wait 24
	note A_1
	audio_wait 24
	note A_2
	audio_wait 24
	note D_2
	audio_wait 24
	note G_2
	audio_wait 24
	note G_1
	audio_wait 24
	note G_2
	audio_wait 24
	note C_2
	audio_wait 24
	note G_2
	audio_wait 24
	note G_1
	audio_wait 16
	note NOTE_DURATION_8, G#1
	audio_wait 8
	note A_1
	audio_wait 8
	note A#1
	audio_wait 8
	note B_1
	audio_wait 8
	note NOTE_DURATION_4, C_2
	audio_wait 24
	note G_2
	audio_wait 24
	note A#1
	audio_wait 24
	note G_2
	audio_wait 24
	note A_1
	audio_wait 24
	note F_2
	audio_wait 24
	note G#1
	audio_wait 24
	note F_2
	audio_wait 24
	note G_1
	audio_wait 24
	note E_2
	audio_wait 24
	note F#1
	audio_wait 24
	note D_2
	audio_wait 24
	note G_1
	audio_wait 24
	note NOTE_DURATION_16, A_3
	audio_wait 16
	note NOTE_DURATION_8, A#3
	audio_wait 8
	note NOTE_DURATION_16, B_3
	audio_wait 16
	note NOTE_DURATION_8, G#1
	audio_wait 8
	note A_1
	audio_wait 8
	note A#1
	audio_wait 8
	note B_1
	audio_wait 8
	audio_jump .loop
.end
	audio_end

Music_BouncyWario:
	db $3, $2
	dw Music_BouncyWario_Ch1
	dw Music_BouncyWario_Ch2
	dw Music_BouncyWario_Ch3

; unused?
	dw Music_BouncyWario_Ch1.loop
	dw Music_BouncyWario_Ch2.loop
	dw Music_BouncyWario_Ch3.loop

	dw Music_BouncyWario_Ch1.end
	dw Music_BouncyWario_Ch2.end
	dw Music_BouncyWario_Ch3.end
