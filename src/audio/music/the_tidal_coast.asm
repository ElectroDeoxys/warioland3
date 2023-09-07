Music_TheTidalCoast_Ch1: ; 35a7d (0d:5a7d)
	semitone_offset 251

.loop
	tempo 40
	wave WAVE_1B
	vibrato_speed 25
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	audio_wait_96
.sub1
	note NOTE_DURATION_12, D_3, 19
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#3
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_18, D_3
	audio_wait_18
	note NOTE_DURATION_3, E_3
	audio_wait_6
	note F#3
	audio_wait_12
	note D_4
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_18, B_3, 19
	audio_wait_18
	note NOTE_DURATION_3, C#4
	audio_wait_6
	note D_4
	audio_wait_12
	note B_3
	audio_wait_12
	note A_3
	audio_wait_48
	audio_ret

.sub3
	note NOTE_DURATION_18, G_3, 19
	audio_wait_18
	note NOTE_DURATION_3, A_3
	audio_wait_6
	note B_3
	audio_wait_12
	note G_3
	audio_wait_12
	note NOTE_DURATION_18, F#3
	audio_wait_18
	note NOTE_DURATION_3, G_3
	audio_wait_6
	note A_3
	audio_wait_12
	note F#3
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_12, E_3, 19
	audio_wait_18
	note NOTE_DURATION_3, B_2
	audio_wait_6
	note C#3
	audio_wait_12
	note D_3
	audio_wait_12
	note E_3
	audio_wait_48
	audio_ret

	audio_call .sub1
.sub5
	note NOTE_DURATION_12, B_3, 19
	audio_wait_18
	note NOTE_DURATION_3, C#4
	audio_wait_6
	note D_4
	audio_wait_12
	note E_4
	audio_wait_12
	note F#4
	audio_wait_48
	audio_ret

.sub6
	note NOTE_DURATION_12, F#4, 19
	audio_wait_18
	note NOTE_DURATION_3, D_4
	audio_wait_6
	note B_3
	audio_wait_12
	note F#4
	audio_wait_12
	note NOTE_DURATION_18, E_4
	audio_wait_24
	note NOTE_DURATION_3, B_3
	audio_wait_12
	note C#4
	audio_wait_12
	audio_ret

	note NOTE_DURATION_72, D_4
	audio_wait_96
	wave WAVE_15
	note NOTE_DURATION_12, D_3
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note D_3
	audio_wait_12
	note E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_24
	note NOTE_DURATION_12, F_3
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note F_3
	audio_wait_12
	note G_3
	audio_wait_12
	note E_3
	audio_wait_12
	note F_3
	audio_wait_12
	note G_3
	audio_wait_12
	note_sustain
	note A_3
	audio_wait_96
	audio_wait_96
	note NOTE_DURATION_0, NOTE_DURATION_12, D_3
	audio_wait_18
	note NOTE_DURATION_3, A#2
	audio_wait_6
	note F_2
	audio_wait_12
	note D_3
	audio_wait_12
	note E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note E_3
	audio_wait_12
	note NOTE_DURATION_12, F_3
	audio_wait_18
	note NOTE_DURATION_3, D_3
	audio_wait_6
	note A#2
	audio_wait_12
	note F_3
	audio_wait_12
	note G_3
	audio_wait_12
	note E_3
	audio_wait_12
	note F_3
	audio_wait_12
	note G_3
	audio_wait_12
	note_sustain
	note A_3
	audio_wait_96
	audio_wait_48
	note NOTE_DURATION_0
	audio_wait_48
	wave WAVE_1B
	note NOTE_DURATION_12, D_3
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#3
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_18, D_3
	audio_wait_18
	note NOTE_DURATION_3, E_3
	audio_wait_6
	note F#3
	audio_wait_12
	note D_4
	audio_wait_12
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub1
	audio_call .sub5
	audio_call .sub6
	note NOTE_DURATION_72, D_4, 19
	audio_wait_96
	wave WAVE_1A
	note NOTE_DURATION_12, D_3
	audio_wait_18
	note NOTE_DURATION_3, F#3
	audio_wait_6
	note A_3
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note NOTE_DURATION_3, G_3
	audio_wait_36
	note NOTE_DURATION_12, F#3
	audio_wait_18
	note NOTE_DURATION_3, A_3
	audio_wait_6
	note D_4
	audio_wait_12
	note F#4
	audio_wait_12
	note NOTE_DURATION_12, E_4
	audio_wait_12
	note NOTE_DURATION_3, C_4
	audio_wait_36
	note NOTE_DURATION_12, A_3
	audio_wait_18
	note NOTE_DURATION_3, D_4
	audio_wait_6
	note F#4
	audio_wait_12
	note A_4
	audio_wait_12
	note NOTE_DURATION_12, G_4
	audio_wait_12
	note NOTE_DURATION_3, E_4
	audio_wait_36
	note NOTE_DURATION_12, D_4
	audio_wait_18
	note NOTE_DURATION_3, F#4
	audio_wait_6
	note A_4
	audio_wait_12
	note D_5
	audio_wait_12
	note C_5
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	audio_jump .loop
.end
	wave WAVE_1B
	volume 85
	audio_wait_96
	note NOTE_DURATION_12, D_3, 19
	audio_wait_12
	audio_end
; 0x35bca

Music_TheTidalCoast_Ch2: ; 35bca (0d:5bca)
	semitone_offset 251

.loop
	wave WAVE_11
	vibrato_speed 25
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	audio_wait_96
	audio_wait_96
.sub1
	note NOTE_DURATION_18, G_3, 19
	audio_wait_18
	note NOTE_DURATION_3, A_3
	audio_wait_6
	note B_3
	audio_wait_12
	note G_3
	audio_wait_12
	note F#3
	audio_wait_48
	audio_ret

.sub2
	note NOTE_DURATION_18, E_3, 19
	audio_wait_18
	note NOTE_DURATION_3, F#3
	audio_wait_6
	note G_3
	audio_wait_12
	note E_3
	audio_wait_12
	note NOTE_DURATION_18, D_3
	audio_wait_18
	note NOTE_DURATION_3, E_3
	audio_wait_6
	note F#3
	audio_wait_12
	note D_3
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_12, B_2, 19
	audio_wait_18
	note NOTE_DURATION_3, G#2
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_2
	audio_wait_48
	audio_ret

	audio_wait_96
.sub4
	note NOTE_DURATION_12, G_3, 19
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#3
	audio_wait_48
	audio_ret

.sub5
	note NOTE_DURATION_12, D_4, 19
	audio_wait_18
	note NOTE_DURATION_3, B_3
	audio_wait_6
	note F#3
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_18, B_3
	audio_wait_24
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note A_3
	audio_wait_12
	audio_ret

	note NOTE_DURATION_72, F#3
	audio_wait_96
	wave WAVE_0B
	note NOTE_DURATION_12, A#2
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note A#2
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note E_2
	audio_wait_24
	note NOTE_DURATION_12, D_3
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note D_3
	audio_wait_12
	note E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note D_3
	audio_wait_12
	note E_3
	audio_wait_12
	note NOTE_DURATION_48, F#3
	audio_wait_48
	note E_3
	audio_wait_48
	note D_3
	audio_wait_48
	note E_3
	audio_wait_48
	note NOTE_DURATION_12, A#2
	audio_wait_18
	note NOTE_DURATION_3, F_2
	audio_wait_6
	note D_2
	audio_wait_12
	note A#2
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note E_2
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_12, D_3
	audio_wait_18
	note NOTE_DURATION_3, A#2
	audio_wait_6
	note F_2
	audio_wait_12
	note D_3
	audio_wait_12
	note E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_48, E_3
	audio_wait_48
	note D_3
	audio_wait_48
	note B_2
	audio_wait_48
	note NOTE_DURATION_3, C#3
	audio_wait_48
	wave WAVE_11
	audio_wait_96
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_wait_96
	audio_call .sub4
	audio_call .sub5
	note NOTE_DURATION_72, F#3, 19
	audio_wait_96
	wave WAVE_10
	note NOTE_DURATION_12, A_2
	audio_wait_18
	note NOTE_DURATION_3, D_3
	audio_wait_6
	note F#3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_12, G_3
	audio_wait_12
	note NOTE_DURATION_3, E_3
	audio_wait_36
	note NOTE_DURATION_12, D_3
	audio_wait_18
	note NOTE_DURATION_3, F#3
	audio_wait_6
	note A_3
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note NOTE_DURATION_3, G_3
	audio_wait_36
	note NOTE_DURATION_12, F#3
	audio_wait_18
	note NOTE_DURATION_3, A_3
	audio_wait_6
	note D_4
	audio_wait_12
	note F#4
	audio_wait_12
	note NOTE_DURATION_12, E_4
	audio_wait_12
	note NOTE_DURATION_3, C_4
	audio_wait_36
	note NOTE_DURATION_12, A_3
	audio_wait_18
	note NOTE_DURATION_3, D_4
	audio_wait_6
	note F#4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	audio_jump .loop
.end
	wave WAVE_11
	volume 85
	audio_wait_96
	audio_wait_96
	note NOTE_DURATION_18, G_3, 19
	audio_wait_18
	audio_end
; 0x35cf4

Music_TheTidalCoast_Ch3: ; 35cf4 (0d:5cf4)
	semitone_offset 251

.loop
	wave WAVE_63
	vibrato_speed 25
	vibrato_delay 5
	vibrato_amplitude 1
	vibrato_disabled FALSE
	volume 108
	note NOTE_DURATION_18, D_1, 22
	audio_wait_18
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	note D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
.sub1
	note NOTE_DURATION_18, D_1, 22
	audio_wait_18
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	note D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note D_1
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_18, G_1, 22
	audio_wait_18
	note NOTE_DURATION_6, C#2
	audio_wait_6
	note NOTE_DURATION_3, D_2
	audio_wait_12
	note G_1
	audio_wait_12
	note D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note D_1
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_18, A_0, 22
	audio_wait_18
	note NOTE_DURATION_6, D#1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note A_0
	audio_wait_12
	note D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note D_1
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_18, E_1, 22
	audio_wait_18
	note NOTE_DURATION_6, A#1
	audio_wait_6
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note E_1
	audio_wait_12
	note A_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, G_1
	audio_wait_6
	note NOTE_DURATION_3, F#1
	audio_wait_12
	note E_1
	audio_wait_12
	audio_ret

	audio_call .sub1
.sub5
	note NOTE_DURATION_18, G_1, 22
	audio_wait_18
	note NOTE_DURATION_6, C#2
	audio_wait_6
	note NOTE_DURATION_3, D_2
	audio_wait_12
	note G_1
	audio_wait_12
	note F#1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note C#2
	audio_wait_12
	audio_ret

.sub6
	note NOTE_DURATION_12, B_1, 22
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F#1
	audio_wait_12
	note B_1
	audio_wait_12
	note E_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	audio_ret

.sub7
	note NOTE_DURATION_18, D_1, 22
	audio_wait_18
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	note D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note F#1
	audio_wait_12
	audio_ret

.sub8
	note NOTE_DURATION_12, G_1, 22
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note G_1
	audio_wait_12
	note A_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note A_1
	audio_wait_12
	audio_ret

	note NOTE_DURATION_12, A#1
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note A#1
	audio_wait_12
	note C_2
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G_1
	audio_wait_12
	note C_2
	audio_wait_12
.sub9
	note NOTE_DURATION_18, D_1, 22
	audio_wait_18
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	note D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	audio_ret

	audio_call .sub7
	audio_call .sub8
	note NOTE_DURATION_12, A#1, 22
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note A#1
	audio_wait_12
	note C_2
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note NOTE_DURATION_18, A_0
	audio_wait_18
	note NOTE_DURATION_6, D#1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note E_0
	audio_wait_12
	note A_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, D#1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note E_0
	audio_wait_12
	note NOTE_DURATION_18, A_0
	audio_wait_18
	note NOTE_DURATION_6, D#1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note E_0
	audio_wait_12
	note A_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, B_0
	audio_wait_12
	note C#1
	audio_wait_12
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub1
	audio_call .sub5
	audio_call .sub6
	audio_call .sub9
.sub10
	note NOTE_DURATION_12, D_1, 22
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub10
	audio_call .sub10
	note NOTE_DURATION_12, D_1, 22
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	audio_jump .loop
.end
	wave WAVE_63
	volume 108
	note NOTE_DURATION_18, D_1, 22
	audio_wait_18
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	note D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6, G#1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_3
	audio_end
; 0x35eb7

Music_TheTidalCoast_Ch4: ; 35eb7 (0d:5eb7)
	semitone_offset 0

.loop
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_24
.sub1
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
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
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_3
	audio_end
; 0x35f44

Music_TheTidalCoast: ; 35f44 (d:5f44)
	db $4, $2
	dw Music_TheTidalCoast_Ch1
	dw Music_TheTidalCoast_Ch2
	dw Music_TheTidalCoast_Ch3
	dw Music_TheTidalCoast_Ch4

; unused?
	dw Music_TheTidalCoast_Ch1.loop
	dw Music_TheTidalCoast_Ch2.loop
	dw Music_TheTidalCoast_Ch3.loop
	dw Music_TheTidalCoast_Ch4.loop

	dw Music_TheTidalCoast_Ch1.end
	dw Music_TheTidalCoast_Ch2.end
	dw Music_TheTidalCoast_Ch3.end
	dw Music_TheTidalCoast_Ch4.end
