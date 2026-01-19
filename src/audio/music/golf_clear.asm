Music_GolfClear_Ch1:
	semitone_offset 1
	tempo 100
	wave WAVE_52
	volume 85
	note NOTE_DURATION_4, C_3, 22
	audio_wait 12
	note NOTE_DURATION_4
	audio_wait 12
	note NOTE_DURATION_4, D_3
	audio_wait 12
	note E_3
	audio_wait 12
	note F_3
	audio_wait 12
	note G_3
	audio_wait 12
	note A_3
	audio_wait 12
	note B_3
	audio_wait 12
	note C_4
	audio_wait 48
	note NOTE_DURATION_6, C_5
	audio_wait 24
	audio_end

Music_GolfClear_Ch2:
	semitone_offset 1
	wave WAVE_48
	volume 75
	note NOTE_DURATION_4, E_2, 19
	audio_wait 12
	note NOTE_DURATION_4
	audio_wait 12
	note NOTE_DURATION_4, F_2
	audio_wait 12
	note G_2
	audio_wait 12
	note A_2
	audio_wait 12
	note B_2
	audio_wait 12
	note C_3
	audio_wait 12
	note D_3
	audio_wait 12
	note E_3
	audio_wait 48
	note NOTE_DURATION_6, E_4
	audio_wait 24
	audio_end

Music_GolfClear_Ch3:
	semitone_offset 1
	wave WAVE_61
	volume 108
	note NOTE_DURATION_4, C_2, 24
	audio_wait 12
	note NOTE_DURATION_4
	audio_wait 12
	note NOTE_DURATION_4, B_1
	audio_wait 12
	note A_1
	audio_wait 12
	note G_1
	audio_wait 12
	note F_1
	audio_wait 12
	note E_1
	audio_wait 12
	note D_1
	audio_wait 12
	note C_1
	audio_wait 48
	note NOTE_DURATION_6, C_0
	audio_wait 24
	audio_end

Music_GolfClear_Ch4:
	semitone_offset 0
	wave WAVE_28
	volume 66
	note NOTE_DURATION_2, D_0, 19
	audio_wait 96
	audio_wait 36
	note NOTE_DURATION_2
	audio_wait 4
	note NOTE_DURATION_2
	audio_wait 4
	note NOTE_DURATION_2
	audio_wait 4
	note NOTE_DURATION_2
	audio_wait 2
	audio_end

Music_GolfClear:
	db 4, 0
	dw Music_GolfClear_Ch1
	dw Music_GolfClear_Ch2
	dw Music_GolfClear_Ch3
	dw Music_GolfClear_Ch4
