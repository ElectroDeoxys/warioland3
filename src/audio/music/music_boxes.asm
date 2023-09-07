Music_MusicBoxes_Ch1: ; 396c6 (0e:56c6)
	semitone_offset 12
	tempo 50
	wave WAVE_19
	volume 75
	note NOTE_DURATION_4, C#4, 19
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, D_4
	audio_wait_12
	note E_4
	audio_wait_36
	note B_3
	audio_wait_12
	note A_3
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, B_3
	audio_wait_12
	note C#4
	audio_wait_36
	note G#3
	audio_wait_12
	note F#3
	audio_wait_24
	note G#3
	audio_wait_12
	note A_3
	audio_wait_12
	note E_3
	audio_wait_24
	note G#3
	audio_wait_12
	note A_3
	audio_wait_12
	note D_3
	audio_wait_12
	note C#4
	audio_wait_12
	note B_3
	audio_wait_12
	note A_3
	audio_wait_12
	note B_3
	audio_wait_36
	note E_3
	audio_wait_12
	note C#4
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, D_4
	audio_wait_12
	note E_4
	audio_wait_36
	note B_3
	audio_wait_12
	note A_3
	audio_wait_24
	note C#4
	audio_wait_12
	note A_4
	audio_wait_12
	note G#4
	audio_wait_36
	note E_4
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note A_3
	audio_wait_12
	note F#3
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4, G#3
	audio_wait_24
	note NOTE_DURATION_72, A_3
	audio_wait_72
	audio_end
; 0x39724

Music_MusicBoxes_Ch2: ; 39724 (0e:5724)
	semitone_offset 12
	wave WAVE_0F
	volume 75
	note NOTE_DURATION_4, A_3, 19
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, G#3
	audio_wait_12
	note F#3
	audio_wait_12
	note G#3
	audio_wait_24
	note F#3
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, E_3
	audio_wait_12
	note F#3
	audio_wait_12
	note E_3
	audio_wait_24
	note D_3
	audio_wait_24
	note E_3
	audio_wait_12
	note F#3
	audio_wait_12
	note C#3
	audio_wait_24
	note E_3
	audio_wait_12
	note F#3
	audio_wait_12
	note B_2
	audio_wait_12
	note A_3
	audio_wait_12
	note G#3
	audio_wait_12
	note F#3
	audio_wait_12
	note G#3
	audio_wait_36
	note E_3
	audio_wait_12
	note A_3
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, G#3
	audio_wait_12
	note F#3
	audio_wait_12
	note G#3
	audio_wait_24
	note F#3
	audio_wait_24
	note A_3
	audio_wait_12
	note C#4
	audio_wait_12
	note B_3
	audio_wait_36
	note C#4
	audio_wait_12
	note D_4
	audio_wait_12
	note A_3
	audio_wait_12
	note F#3
	audio_wait_12
	note D_3
	audio_wait_12
	note B_2
	audio_wait_24
	note E_3
	audio_wait_12
	note D_3
	audio_wait_12
	note C#3
	audio_wait_12
	note D_3
	audio_wait_12
	note B_2
	audio_wait_12
	note C#3
	audio_wait_12
	note NOTE_DURATION_24, A_2
	audio_wait_24
	audio_end
; 0x39789

Music_MusicBoxes_Ch3: ; 39789 (0e:5789)
	semitone_offset 12
	wave WAVE_5E
	volume 94
	note NOTE_DURATION_3, A_2, 19
	audio_wait_12
	note C#3
	audio_wait_12
	note E_3
	audio_wait_24
	note G#2
	audio_wait_12
	note B_2
	audio_wait_12
	note E_3
	audio_wait_24
	note F#2
	audio_wait_12
	note A_2
	audio_wait_12
	note C#3
	audio_wait_24
	note E_2
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_24
	note D_2
	audio_wait_12
	note F#2
	audio_wait_12
	note A_2
	audio_wait_24
	note C#2
	audio_wait_12
	note E_2
	audio_wait_12
	note A_2
	audio_wait_24
	note B_1
	audio_wait_12
	note D_2
	audio_wait_12
	note F#2
	audio_wait_24
	note E_2
	audio_wait_12
	note G#2
	audio_wait_12
	note B_2
	audio_wait_24
	note A_2
	audio_wait_12
	note C#3
	audio_wait_12
	note E_3
	audio_wait_24
	note G#2
	audio_wait_12
	note B_2
	audio_wait_12
	note E_3
	audio_wait_24
	note F#2
	audio_wait_12
	note A_2
	audio_wait_12
	note C#3
	audio_wait_24
	note C#2
	audio_wait_12
	note E_2
	audio_wait_12
	note G#2
	audio_wait_24
	note D_2
	audio_wait_12
	note F#2
	audio_wait_12
	note A_2
	audio_wait_24
	note D_3
	audio_wait_12
	note E_2
	audio_wait_12
	note E_3
	audio_wait_12
	note E_2
	audio_wait_12
	audio_wait_12
	note A_1
	audio_wait_12
	note D_2
	audio_wait_12
	note E_2
	audio_wait_12
	note NOTE_DURATION_24, A_2
	audio_wait_24
	audio_end
; 0x397f2

Music_MusicBoxes: ; 397f2 (0e:57f2)
	db 3, 0
	dw Music_MusicBoxes_Ch1
	dw Music_MusicBoxes_Ch2
	dw Music_MusicBoxes_Ch3
