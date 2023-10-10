Music_GolfGameOver_Ch1:
	semitone_offset 0
	tempo 90
	wave WAVE_51
	volume 75
	note NOTE_DURATION_3, C_2, 19
	audio_wait_24
	note G_1
	audio_wait_12
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, G#1
	audio_wait_12
	note G_1
	audio_wait_12
	note F#1
	audio_wait_12
	note G_1
	audio_wait_12
	note NOTE_DURATION_3, C_2
	audio_wait_24
	note B_3
	audio_wait_24
	note NOTE_DURATION_6, C_4
	audio_wait_24
	audio_end

Music_GolfGameOver_Ch2:
	semitone_offset 0
	wave WAVE_47
	volume 75
	audio_wait_96
	audio_wait_24
	note NOTE_DURATION_3, F_3, 19
	audio_wait_24
	note NOTE_DURATION_6, E_3
	audio_wait_24
	audio_end

Music_GolfGameOver_Ch3:
	semitone_offset 0
	wave WAVE_5E
	volume 108
	note NOTE_DURATION_3, C_1, 19
	audio_wait_24
	note G_0
	audio_wait_12
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, G#0
	audio_wait_12
	note G_0
	audio_wait_12
	note F#0
	audio_wait_12
	note G_0
	audio_wait_12
	note NOTE_DURATION_3, C_1
	audio_wait_24
	note G_0
	audio_wait_24
	note NOTE_DURATION_6, C_0
	audio_wait_24
	audio_end

Music_GolfGameOver:
	db 3, 0
	dw Music_GolfGameOver_Ch1
	dw Music_GolfGameOver_Ch2
	dw Music_GolfGameOver_Ch3
