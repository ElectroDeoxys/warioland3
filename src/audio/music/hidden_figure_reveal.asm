Music_HiddenFigureReveal_Ch1: ; 3b4a1 (0e:74a1)
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
; 0x3b4b9

Music_HiddenFigureReveal_Ch2: ; 3b4b9 (0e:74b9)
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
; 0x3b4cf

Music_HiddenFigureReveal_Ch3: ; 3b4cf (0e:74cf)
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
; 0x3b4e5

Music_HiddenFigureReveal: ; 3b4e5 (0e:74e5)
	db 3, 0
	dw Music_HiddenFigureReveal_Ch1
	dw Music_HiddenFigureReveal_Ch2
	dw Music_HiddenFigureReveal_Ch3
; 0x3b4ed
