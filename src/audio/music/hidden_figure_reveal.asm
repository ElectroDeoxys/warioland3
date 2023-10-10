Music_HiddenFigureReveal_Ch1:
	semitone_offset 0
	tempo 90
	wave WAVE_14
	vibrato_amplitude 30
	volume 75
	note NOTE_DURATION_6, G_2, 19
	audio_wait_6
	note G#2
	audio_wait_6
	note G_3
	audio_wait_6
	note G#3
	audio_wait_6
	note NOTE_DURATION_72, G_4
	audio_wait_72
	audio_end

Music_HiddenFigureReveal_Ch2:
	semitone_offset 0
	wave WAVE_0A
	vibrato_amplitude 30
	volume 75
	note NOTE_DURATION_6, B_1, 19
	audio_wait_6
	note C_2
	audio_wait_6
	note B_2
	audio_wait_6
	note C_3
	audio_wait_6
	note NOTE_DURATION_72, B_3
	audio_wait_72
	audio_end

Music_HiddenFigureReveal_Ch3:
	semitone_offset 0
	wave WAVE_7A
	vibrato_amplitude 30
	volume 108
	note NOTE_DURATION_6, F_1, 24
	audio_wait_6
	note F#1
	audio_wait_6
	note F_2
	audio_wait_6
	note F#2
	audio_wait_6
	note NOTE_DURATION_72, F_3
	audio_wait_72
	audio_end

Music_HiddenFigureReveal:
	db 3, 0
	dw Music_HiddenFigureReveal_Ch1
	dw Music_HiddenFigureReveal_Ch2
	dw Music_HiddenFigureReveal_Ch3
