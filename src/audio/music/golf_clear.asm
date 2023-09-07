Music_GolfClear_Ch1: ; 39649 (0e:5649)
	semitone_offset 1
	tempo 100
	wave WAVE_52
	volume 85
	note NOTE_DURATION_4, C_3, 22
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, D_3
	audio_wait_12
	note E_3
	audio_wait_12
	note F_3
	audio_wait_12
	note G_3
	audio_wait_12
	note A_3
	audio_wait_12
	note B_3
	audio_wait_12
	note C_4
	audio_wait_48
	note NOTE_DURATION_6, C_5
	audio_wait_24
	audio_end
; 0x3966a

Music_GolfClear_Ch2: ; 3966a (0e:566a)
	semitone_offset 1
	wave WAVE_48
	volume 75
	note NOTE_DURATION_4, E_2, 19
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, F_2
	audio_wait_12
	note G_2
	audio_wait_12
	note A_2
	audio_wait_12
	note B_2
	audio_wait_12
	note C_3
	audio_wait_12
	note D_3
	audio_wait_12
	note E_3
	audio_wait_48
	note NOTE_DURATION_6, E_4
	audio_wait_24
	audio_end
; 0x39689

Music_GolfClear_Ch3: ; 39689 (0e:5689)
	semitone_offset 1
	wave WAVE_61
	volume 108
	note NOTE_DURATION_4, C_2, 24
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, B_1
	audio_wait_12
	note A_1
	audio_wait_12
	note G_1
	audio_wait_12
	note F_1
	audio_wait_12
	note E_1
	audio_wait_12
	note D_1
	audio_wait_12
	note C_1
	audio_wait_48
	note NOTE_DURATION_6, C_0
	audio_wait_24
	audio_end
; 0x396a8

Music_GolfClear_Ch4: ; 396a8 (0e:56a8)
	semitone_offset 0
	wave WAVE_28
	volume 66
	note NOTE_DURATION_2, D_0, 19
	audio_wait_96
	audio_wait_36
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2
	audio_wait_2
	audio_end
; 0x396bc

Music_GolfClear: ; 396bc (0e:56bc)
	db 4, 0
	dw Music_GolfClear_Ch1
	dw Music_GolfClear_Ch2
	dw Music_GolfClear_Ch3
	dw Music_GolfClear_Ch4
