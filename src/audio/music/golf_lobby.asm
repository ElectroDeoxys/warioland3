Music_GolfLobby_Ch1: ; 3999f (0e:599f)
	semitone_offset 0
	tempo 50
	wave WAVE_51
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	note NOTE_DURATION_2, G_3, 19
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2, A_3
	audio_wait_12
	note A#3
	audio_wait_12
	note B_3
	audio_wait_24
	note NOTE_DURATION_12, G_4
	audio_wait_24
.sub1
	audio_wait_12
	note NOTE_DURATION_2, E_2, 19
	audio_wait_20
	note NOTE_DURATION_12, D#2
	audio_wait_16
	note NOTE_DURATION_2, E_2
	audio_wait_48
	audio_ret

	audio_call .sub1

.loop
.sub2
	note NOTE_DURATION_2, E_2, 19
	audio_wait_24
	note NOTE_DURATION_8, F_2
	audio_wait_12
	note NOTE_DURATION_2, F#2
	audio_wait_8
	note G_2
	audio_wait_52
	audio_ret

	note A_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8, B_2
	audio_wait_12
	note NOTE_DURATION_2, A_2
	audio_wait_8
	note G_2
	audio_wait_52
	note F_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8, G_2
	audio_wait_12
	note NOTE_DURATION_2, F_2
	audio_wait_8
	note E_2
	audio_wait_52
	note D_2
	audio_wait_12
	note C_2
	audio_wait_12
	note NOTE_DURATION_8, B_1
	audio_wait_12
	note NOTE_DURATION_2, C_2
	audio_wait_8
	note D_2
	audio_wait_52
	audio_call .sub2
	note NOTE_DURATION_2, A_2, 19
	audio_wait_12
	note B_2
	audio_wait_12
	note NOTE_DURATION_8, C_3
	audio_wait_12
	note NOTE_DURATION_2, D_3
	audio_wait_8
	note E_3
	audio_wait_52
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note E_2
	audio_wait_12
	note D_2
	audio_wait_24
	note NOTE_DURATION_8
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, C_2
	audio_wait_4
	audio_wait_96
	audio_jump .loop
.end
	audio_end
; 0x39a29

Music_GolfLobby_Ch2: ; 39a29 (0e:5a29)
	semitone_offset 0
	wave WAVE_47
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	note NOTE_DURATION_2, B_2, 19
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2, C_3
	audio_wait_12
	note C#3
	audio_wait_12
	note D_3
	audio_wait_24
	note NOTE_DURATION_12, D#4
	audio_wait_24
.sub1
	audio_wait_12
	note NOTE_DURATION_2, G_1, 19
	audio_wait_20
	note NOTE_DURATION_12, F#1
	audio_wait_16
	note NOTE_DURATION_2, G_1
	audio_wait_48
	audio_ret

	audio_call .sub1

.loop
.sub2
	note NOTE_DURATION_2, C_2, 19
	audio_wait_24
	note NOTE_DURATION_8
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_52
	audio_ret

	note NOTE_DURATION_2, F_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, E_2
	audio_wait_52
	note C_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8, B_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, C_2
	audio_wait_52
	note A_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, B_1
	audio_wait_52
	audio_call .sub2
	note NOTE_DURATION_2, F_2, 19
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, G#2
	audio_wait_52
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note E_2
	audio_wait_12
	note C_2
	audio_wait_12
	note A_1
	audio_wait_24
	note NOTE_DURATION_8, F_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, E_1
	audio_wait_4
	audio_wait_96
	audio_jump .loop
.end
	audio_end
; 0x39aad

Music_GolfLobby_Ch3: ; 39aad (0e:5aad)
	semitone_offset 0
	wave WAVE_5E
	volume 108
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_2, G_1, 24
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2, F_1
	audio_wait_12
	note F#1
	audio_wait_12
	note G_1
	audio_wait_24
	note NOTE_DURATION_12, B_3
	audio_wait_24
.sub1
	note NOTE_DURATION_2, C_1, 24
	audio_wait_72
	note G_0
	audio_wait_8
	note NOTE_DURATION_8
	audio_wait_4
	note NOTE_DURATION_8, A#0
	audio_wait_8
	note B_0
	audio_wait_4
	audio_ret

	audio_call .sub1

.loop
.sub2
	note NOTE_DURATION_2, C_1, 24
	audio_wait_24
	note NOTE_DURATION_8, D_1
	audio_wait_12
	note NOTE_DURATION_2, D#1
	audio_wait_8
	note E_1
	audio_wait_52
	audio_ret

	note F_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8, G_1
	audio_wait_12
	note NOTE_DURATION_2, F_1
	audio_wait_8
	note E_1
	audio_wait_52
	note D_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8, G_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, C_1
	audio_wait_52
	note D_0
	audio_wait_12
	note E_0
	audio_wait_12
	note NOTE_DURATION_8, F#0
	audio_wait_12
	note NOTE_DURATION_2, D_0
	audio_wait_8
	note G_0
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8, G#0
	audio_wait_4
	note A_0
	audio_wait_8
	note G#0
	audio_wait_4
	note NOTE_DURATION_2, G_0
	audio_wait_12
	audio_call .sub2
	note NOTE_DURATION_2, F_1, 24
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_8
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, E_1
	audio_wait_52
	note A_1
	audio_wait_48
	note D_1
	audio_wait_24
	note NOTE_DURATION_8, G_0
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2, C_1
	audio_wait_4
	audio_wait_72
	note G_0
	audio_wait_8
	note NOTE_DURATION_8
	audio_wait_4
	note NOTE_DURATION_8, A_0
	audio_wait_8
	note B_0
	audio_wait_4
	audio_jump .loop
.end
	audio_wait_4
	audio_end
; 0x39b46

Music_GolfLobby_Ch4: ; 39b46 (0e:5b46)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_2, F#0, 19
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_5, G#0
	audio_wait_12
	note NOTE_DURATION_2, F#0
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_5, G#0
	audio_wait_12
	note NOTE_DURATION_2, F#0
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
.sub1
	note NOTE_DURATION_2, F#0, 19
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_5, G#0
	audio_wait_12
	note NOTE_DURATION_2, F#0
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
	note NOTE_DURATION_5, G#0
	audio_wait_12
	note NOTE_DURATION_2, F#0
	audio_wait_8
	note NOTE_DURATION_2
	audio_wait_4
	audio_ret

	audio_call .sub1

.loop
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x39ba8

Music_GolfLobby: ; 39ba8 (0e:5ba8)
	db 4, 2
	dw Music_GolfLobby_Ch1
	dw Music_GolfLobby_Ch2
	dw Music_GolfLobby_Ch3
	dw Music_GolfLobby_Ch4

; unused?
	dw Music_GolfLobby_Ch1.loop
	dw Music_GolfLobby_Ch2.loop
	dw Music_GolfLobby_Ch3.loop
	dw Music_GolfLobby_Ch4.loop

	dw Music_GolfLobby_Ch1.end
	dw Music_GolfLobby_Ch2.end
	dw Music_GolfLobby_Ch3.end
	dw Music_GolfLobby_Ch4.end
; 0x39bc2
