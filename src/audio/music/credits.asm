Music_Credits_Ch1: ; 369b1 (0d:69b1)
	semitone_offset 0
	tempo 55
	wave WAVE_19
	volume 66
	note NOTE_DURATION_4, C#5, 19
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, D_5
	audio_wait_12
	note E_5
	audio_wait_36
	note B_4
	audio_wait_12
	note A_4
	audio_wait_24
	note C#5
	audio_wait_12
	note A_5
	audio_wait_12
	note G#5
	audio_wait_36
	note E_5
	audio_wait_12
	note F#5
	audio_wait_12
	note D_5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_24
	note NOTE_DURATION_4, G#4
	audio_wait_24
	tempo 65
	note NOTE_DURATION_72, A_4
	audio_wait_96
	audio_wait_96
	wave WAVE_52
	audio_wait_24
	note NOTE_DURATION_4, E_2, 22
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_6, D_2
	audio_wait_6
	note D#2
	audio_wait_6
	note NOTE_DURATION_4, E_2
	audio_wait_12
	note A_2
	audio_wait_6
	note NOTE_DURATION_4
	audio_wait_54
	note NOTE_DURATION_4
	audio_wait_18
	note NOTE_DURATION_18, B_2
	audio_wait_18
	volume 85
	wave WAVE_19
	note NOTE_DURATION_18, C#3
	audio_wait_24
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, D_3
	audio_wait_12
	note NOTE_DURATION_36, E_3
	audio_wait_36
	note NOTE_DURATION_12, B_2
	audio_wait_12
.sub1
	note NOTE_DURATION_18, A_2, 22
	audio_wait_24
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, B_2
	audio_wait_12
	note NOTE_DURATION_36, C#3
	audio_wait_36
	note NOTE_DURATION_12, G#2
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_24, F#2, 22
	audio_wait_24
	note NOTE_DURATION_12, G#2
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_24, E_2
	audio_wait_24
	note NOTE_DURATION_12, G#2
	audio_wait_12
	note A_2
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_12, D_2, 22
	audio_wait_12
	note C#3
	audio_wait_12
	note B_2
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_36, B_2
	audio_wait_36
	note NOTE_DURATION_12, E_2
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_18, C#3, 22
	audio_wait_24
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, D_3
	audio_wait_12
	note NOTE_DURATION_36, E_3
	audio_wait_36
	note NOTE_DURATION_12, B_2
	audio_wait_12
	audio_ret

.sub5
	note NOTE_DURATION_24, A_2, 22
	audio_wait_24
	note NOTE_DURATION_12, C#3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_36, G#3
	audio_wait_36
	note NOTE_DURATION_12, E_3
	audio_wait_12
	audio_ret

.sub6
	note NOTE_DURATION_12, F#3, 22
	audio_wait_12
	note D_3
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_6, F#2
	audio_wait_12
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_24, G#2
	audio_wait_24
	audio_ret

	note_sustain
	note A_2
	audio_wait_96
	wave WAVE_16
	note NOTE_DURATION_18, C#3
	audio_wait_18
	note NOTE_DURATION_0, A_2
	audio_wait_6
	note NOTE_DURATION_12, C#3
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_36, E_3
	audio_wait_36
	note NOTE_DURATION_12, B_2
	audio_wait_12
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub6
	note NOTE_DURATION_90, A_2, 22
	audio_wait_96
	wave WAVE_1C
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_12, D_3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_36, G#3
	audio_wait_36
	note NOTE_DURATION_12, F#3
	audio_wait_12
	note NOTE_DURATION_24, E_3
	audio_wait_24
	note NOTE_DURATION_12, G#3
	audio_wait_12
	note B_3
	audio_wait_12
	note NOTE_DURATION_48, A_3
	audio_wait_48
	note NOTE_DURATION_18
	audio_wait_12
	note NOTE_DURATION_12, F#3
	audio_wait_12
	note D_3
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_24, F#2
	audio_wait_24
	note NOTE_DURATION_12, G#2
	audio_wait_12
	note F#2
	audio_wait_12
	note NOTE_DURATION_96, E_2
	audio_wait_96
	note NOTE_DURATION_24, A_2
	audio_wait_24
	note NOTE_DURATION_12, C_3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_36, G_3
	audio_wait_36
	note NOTE_DURATION_12, F_3
	audio_wait_12
	note E_3
	audio_wait_12
	note F_3
	audio_wait_12
	note G_3
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_24, C_4
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_12, B_3
	audio_wait_12
	note A_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note C_4
	audio_wait_6
	note NOTE_DURATION_12, B_3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_3, B_3, 17
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	wave WAVE_19
	note NOTE_DURATION_4, E_2, 22
	audio_wait_4
	note F#2
	audio_wait_5
	note G#2
	audio_wait_5
	note A_2
	audio_wait_5
	note B_2
	audio_wait_5
	audio_call .sub4
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_12, D_2, 22
	audio_wait_12
	note C#3
	audio_wait_12
	note B_2
	audio_wait_12
	note A_2
	audio_wait_12
	note B_2
	audio_wait_12
	note G#2
	audio_wait_12
	note A_2
	audio_wait_12
	note B_2
	audio_wait_12
	audio_call .sub4
	note NOTE_DURATION_12, A_2, 22
	audio_wait_12
	note C#3
	audio_wait_12
	note F#3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_36, G#3
	audio_wait_36
	note NOTE_DURATION_12, E_3
	audio_wait_12
	audio_call .sub6
	note NOTE_DURATION_96, A_2, 22
	audio_wait_96
	tempo 59
	audio_wait_24
	wave WAVE_52
	note NOTE_DURATION_4, E_2
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	wave WAVE_14
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_4, B_2
	audio_wait_4
	note C#3
	audio_wait_4
	note D_3
	audio_wait_4
	note E_3
	audio_wait_4
	note F#3
	audio_wait_4
	note G#3
	audio_wait_4
	note NOTE_DURATION_12, A_3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_4, G#3
	audio_wait_12
	note E_3
	audio_wait_12
	note NOTE_DURATION_12, A_3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_4, G#3
	audio_wait_12
	note E_3
	audio_wait_12
	note NOTE_DURATION_66, A_3
	audio_wait_72
	note NOTE_DURATION_3
	audio_wait_3
	note NOTE_DURATION_3, B_3
	audio_wait_3
	note C#4
	audio_wait_3
	note D_4
	audio_wait_3
	note E_4
	audio_wait_3
	note F#4
	audio_wait_3
	note NOTE_DURATION_6, G#4
	audio_wait_6
	note NOTE_DURATION_12, A_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_4, G#4
	audio_wait_12
	note E_4
	audio_wait_12
	note NOTE_DURATION_12, A_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_4, G#4
	audio_wait_12
	note E_4
	audio_wait_12
	note NOTE_DURATION_42, A_4
	audio_wait_48
	vibrato_amplitude 0
	note NOTE_DURATION_24, A_4
	audio_wait_24
	note NOTE_DURATION_24, B_4
	audio_wait_24
	tempo 54
	note NOTE_DURATION_18, C#5
	audio_wait_24
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, D_5
	audio_wait_12
	note NOTE_DURATION_36, E_5
	audio_wait_24
	wave WAVE_19
	audio_wait_12
	note NOTE_DURATION_12, B_4
	audio_wait_12
	note NOTE_DURATION_18, A_4
	audio_wait_24
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, B_4
	audio_wait_12
	note NOTE_DURATION_36, C#5
	audio_wait_36
	note NOTE_DURATION_12, G#4
	audio_wait_12
	note NOTE_DURATION_36, F#4
	audio_wait_24
	note NOTE_DURATION_12, G#4
	audio_wait_12
	note A_4
	audio_wait_12
	note NOTE_DURATION_36, E_4
	audio_wait_24
	note NOTE_DURATION_12, G#4
	audio_wait_12
	note A_4
	audio_wait_12
	note NOTE_DURATION_36, D_4
	audio_wait_24
	note NOTE_DURATION_12, G#4
	audio_wait_12
	note A_4
	audio_wait_12
	tempo 50
	note NOTE_DURATION_24, G#4
	audio_wait_24
	note B_4
	audio_wait_24
	note NOTE_DURATION_96, A_4
	audio_wait_96
	audio_wait_48
	note NOTE_DURATION_24, A_5
	audio_wait_24
	audio_end
; 0x36c5f

Music_Credits_Ch2: ; 36c5f (0d:6c5f)
	semitone_offset 0
	wave WAVE_0F
	volume 66
	note NOTE_DURATION_4, A_4, 19
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_4, G#4
	audio_wait_12
	note F#4
	audio_wait_12
	note G#4
	audio_wait_24
	note F#4
	audio_wait_24
	note A_4
	audio_wait_12
	note C#5
	audio_wait_12
	note B_4
	audio_wait_36
	note C#5
	audio_wait_12
	note D_5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note B_3
	audio_wait_24
	note E_4
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_72, C#4
	audio_wait_96
	volume 75
	wave WAVE_48
	audio_wait_24
	note NOTE_DURATION_4, C#2, 22
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_6, B_1
	audio_wait_6
	note C_2
	audio_wait_6
	note NOTE_DURATION_4, C#2
	audio_wait_12
	audio_wait_24
	note NOTE_DURATION_4
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_6, B_1
	audio_wait_6
	note C_2
	audio_wait_6
	note NOTE_DURATION_4, C#2
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4
	audio_wait_54
	note NOTE_DURATION_4, C_2
	audio_wait_18
	note NOTE_DURATION_18, D_2
	audio_wait_18
	wave WAVE_4B
	note NOTE_DURATION_6, C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
.sub1
	note NOTE_DURATION_6, A_1, 22
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note G#1
	audio_wait_6
	note C#2
	audio_wait_6
	note G#1
	audio_wait_6
	note C#2
	audio_wait_6
	note G#1
	audio_wait_6
	note C#2
	audio_wait_6
	note G#1
	audio_wait_6
	note C#2
	audio_wait_6
	audio_ret

	note F#1
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note A_1
	audio_wait_6
	note E_1
	audio_wait_6
	note A_1
	audio_wait_6
	note E_1
	audio_wait_6
	note A_1
	audio_wait_6
	note E_1
	audio_wait_6
	note A_1
	audio_wait_6
	note E_1
	audio_wait_6
	note A_1
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note E_2
	audio_wait_6
	note NOTE_DURATION_4, G#1
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, A_1
	audio_wait_12
	note B_1
	audio_wait_12
	note NOTE_DURATION_6, C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	audio_call .sub1
	note NOTE_DURATION_6, F#1, 22
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note A_1
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
.sub2
	note NOTE_DURATION_6, C#2, 22
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note C_2
	audio_wait_6
	note NOTE_DURATION_4, C#2
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_6, C#2, 22
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note G#1
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	note G#1
	audio_wait_6
	audio_ret

.sub4
	note NOTE_DURATION_6, A_1, 22
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note G#1
	audio_wait_6
	note C#2
	audio_wait_6
	note G#1
	audio_wait_6
	note E_1
	audio_wait_6
	note G#1
	audio_wait_6
	note C#2
	audio_wait_6
	note G#1
	audio_wait_6
	note E_1
	audio_wait_6
	audio_ret

.sub5
	note NOTE_DURATION_6, F#1, 22
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note D_1
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note E_1
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note E_1
	audio_wait_6
	audio_ret

.sub6
	note NOTE_DURATION_6, B_1, 22
	audio_wait_6
	note D_2
	audio_wait_6
	note B_1
	audio_wait_6
	note F#1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note B_1
	audio_wait_6
	note E_2
	audio_wait_6
	note NOTE_DURATION_4, G#1
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, A_1
	audio_wait_12
	note B_1
	audio_wait_12
	audio_ret

	audio_call .sub3
	audio_call .sub4
.sub7
	note NOTE_DURATION_6, A_1, 22
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note F#1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note E_2
	audio_wait_6
	note G#2
	audio_wait_6
	note E_2
	audio_wait_6
	note B_1
	audio_wait_6
	audio_ret

	audio_call .sub2
	note NOTE_DURATION_6, A_1, 22
	audio_wait_6
	note C#2
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note A_2
	audio_wait_6
	note C#3
	audio_wait_6
	note D_3
	audio_wait_6
	note F#3
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note G#2
	audio_wait_6
	note B_2
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_6
	note G#3
	audio_wait_6
	note G#1
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note G#2
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, C#3
	audio_wait_6
	note E_3
	audio_wait_6
	note G#3
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note F#2
	audio_wait_6
	note A_2
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, C#3
	audio_wait_6
	note F#3
	audio_wait_6
	note A_3
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note A_2
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, D_3
	audio_wait_6
	note F#3
	audio_wait_6
	note A_3
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note G#2
	audio_wait_6
	note B_2
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_6
	note G#3
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note G#2
	audio_wait_6
	note A_2
	audio_wait_6
	note C#3
	audio_wait_6
	note E_3
	audio_wait_6
	note G#3
	audio_wait_6
	note A_3
	audio_wait_6
	note G#3
	audio_wait_6
	note E_3
	audio_wait_6
	note C#3
	audio_wait_6
	note A_2
	audio_wait_6
	note G#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note F_2
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note F_3
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note F_2
	audio_wait_6
	note G_2
	audio_wait_6
	note B_2
	audio_wait_6
	note D_3
	audio_wait_6
	note F_3
	audio_wait_6
	note G_3
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note G_2
	audio_wait_6
	note B_2
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_6
	note G_3
	audio_wait_6
	note A_1
	audio_wait_6
	note C_2
	audio_wait_6
	note E_2
	audio_wait_6
	note G_2
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note E_3
	audio_wait_6
	note G_3
	audio_wait_6
	note D_2
	audio_wait_6
	note F_2
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note F_3
	audio_wait_6
	note A_3
	audio_wait_6
	note C_4
	audio_wait_6
	note D#2
	audio_wait_6
	note F#2
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D#3
	audio_wait_6
	note F#3
	audio_wait_6
	note A_3
	audio_wait_6
	note C_4
	audio_wait_6
	note E_2
	audio_wait_6
	note G#2
	audio_wait_6
	note E_3
	audio_wait_6
	note G#3
	audio_wait_6
	note F#2
	audio_wait_6
	note A_2
	audio_wait_6
	note F#3
	audio_wait_6
	note A_3
	audio_wait_6
	note G_2
	audio_wait_6
	note A#2
	audio_wait_6
	note G_3
	audio_wait_6
	note A#3
	audio_wait_6
	note G#2
	audio_wait_6
	note B_2
	audio_wait_6
	note G#3
	audio_wait_6
	note B_3
	audio_wait_6
	note A_2
	audio_wait_6
	note C#3
	audio_wait_6
	note A_3
	audio_wait_6
	note C#4
	audio_wait_6
	note B_2
	audio_wait_6
	note D_3
	audio_wait_6
	note B_3
	audio_wait_6
	note D_4
	audio_wait_6
	note C_3
	audio_wait_6
	note D#3
	audio_wait_6
	note C_4
	audio_wait_6
	note D#4
	audio_wait_6
	note NOTE_DURATION_4, G#1
	audio_wait_4
	note A_1
	audio_wait_5
	note B_1
	audio_wait_5
	note C#2
	audio_wait_5
	note D_2
	audio_wait_5
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub6
	audio_call .sub3
	audio_call .sub4
	audio_call .sub7
	audio_call .sub2
	audio_wait_24
	note NOTE_DURATION_4, C#2, 22
	audio_wait_36
	note NOTE_DURATION_4
	audio_wait_12
	note NOTE_DURATION_6, D_2
	audio_wait_6
	note D#2
	audio_wait_6
	note NOTE_DURATION_4, E_2
	audio_wait_12
.sub8
	note NOTE_DURATION_6, C#2, 22
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	note C#2
	audio_wait_6
	note E_2
	audio_wait_6
	note C#2
	audio_wait_6
	note A_1
	audio_wait_6
	audio_ret

	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	audio_call .sub8
	note NOTE_DURATION_6, D_2, 22
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note C_3
	audio_wait_6
	note F_3
	audio_wait_6
	note C_3
	audio_wait_6
	note A_2
	audio_wait_6
	note D_3
	audio_wait_6
	note B_2
	audio_wait_6
	note D_3
	audio_wait_6
	note D_4
	audio_wait_6
	wave WAVE_0F
	note NOTE_DURATION_48, A_4
	audio_wait_48
	note G#4
	audio_wait_48
	note F#4
	audio_wait_48
	note E_4
	audio_wait_48
	note D_4
	audio_wait_48
	note C#4
	audio_wait_48
	note B_3
	audio_wait_48
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_24, D_4
	audio_wait_24
	note NOTE_DURATION_96, E_4
	audio_wait_96
	audio_wait_48
	note NOTE_DURATION_24, C#5
	audio_wait_24
	audio_end
; 0x3702c

Music_Credits_Ch3: ; 3702c (0d:702c)
	semitone_offset 0
	wave WAVE_5E
	volume 94
	note NOTE_DURATION_3, A_3, 22
	audio_wait_12
	note C#4
	audio_wait_12
	note E_4
	audio_wait_24
	note G#3
	audio_wait_12
	note B_3
	audio_wait_12
	note E_4
	audio_wait_24
	note NOTE_DURATION_3, F#3, 22
	audio_wait_12
	note A_3
	audio_wait_12
	note C#4
	audio_wait_24
	note C#3
	audio_wait_12
	note E_3
	audio_wait_12
	note G#3
	audio_wait_24
	note D_3
	audio_wait_12
	note F#3
	audio_wait_12
	note A_3
	audio_wait_24
	note D_4
	audio_wait_12
	note E_3
	audio_wait_12
	note E_4
	audio_wait_12
	note E_3
	audio_wait_12
	volume 108
	wave WAVE_61
	note NOTE_DURATION_3, A_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note NOTE_DURATION_6, D_1
	audio_wait_6
	note D#1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
.sub1
	note NOTE_DURATION_3, A_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note NOTE_DURATION_6, D_1
	audio_wait_6
	note D#1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	audio_ret

	audio_call .sub1
	note NOTE_DURATION_3, A_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_42
	note NOTE_DURATION_3, F_0
	audio_wait_12
	note F_1
	audio_wait_12
	note G_0
	audio_wait_6
	note NOTE_DURATION_12, G_1
	audio_wait_18
.sub2
	note NOTE_DURATION_3, A_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note A_0
	audio_wait_12
	note G#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_12
	note G#0
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_3, F#0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F#1
	audio_wait_12
	note F#0
	audio_wait_12
	note E_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note E_0
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_3, D_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note D_0
	audio_wait_12
	note C#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C#1
	audio_wait_12
	note C#0
	audio_wait_12
	audio_ret

.sub5
	note NOTE_DURATION_3, B_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note B_0
	audio_wait_12
	note E_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F#1
	audio_wait_12
	note G#1
	audio_wait_12
	audio_ret

	audio_call .sub2
.sub6
	note NOTE_DURATION_3, F#0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F#1
	audio_wait_12
	note F#0
	audio_wait_12
	note C#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C#1
	audio_wait_12
	note C#0
	audio_wait_12
	audio_ret

.sub7
	note NOTE_DURATION_3, D_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note D_0
	audio_wait_12
	note E_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note E_0
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub2
	audio_call .sub6
	audio_call .sub7
	audio_call .sub1
	note NOTE_DURATION_3, D_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, D_1
	audio_wait_6
	note D_0
	audio_wait_6
	note NOTE_DURATION_3, E_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, G#0
	audio_wait_6
	note C#1
	audio_wait_6
	note NOTE_DURATION_3, F#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3, B_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, F#1
	audio_wait_6
	note B_1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_6, E_0
	audio_wait_6
	note E_1
	audio_wait_6
	note E_0
	audio_wait_6
	note NOTE_DURATION_3, A_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C#1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_6, D_0
	audio_wait_6
	note D_1
	audio_wait_6
	note D_0
	audio_wait_6
	note NOTE_DURATION_3, G_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3, E_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, B_0
	audio_wait_6
	note E_1
	audio_wait_6
	note NOTE_DURATION_3, A_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_3, D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, D#1
	audio_wait_12
	note D#0
	audio_wait_12
.sub8
	note NOTE_DURATION_3, E_0, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note E_0
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note NOTE_DURATION_6, D_1
	audio_wait_6
	note D#1
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	audio_ret

	audio_call .sub8
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub2
	audio_call .sub6
	audio_call .sub7
	audio_call .sub1
	audio_call .sub1
.sub9
	note NOTE_DURATION_3, A_0, 24
	audio_wait_12
	note E_1
	audio_wait_24
	note NOTE_DURATION_12, E_0
	audio_wait_12
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note E_1
	audio_wait_12
	note NOTE_DURATION_12, A_0
	audio_wait_12
	note NOTE_DURATION_6, B_0
	audio_wait_6
	note C#1
	audio_wait_6
	audio_ret

	note NOTE_DURATION_3, D_1
	audio_wait_12
	note A_1
	audio_wait_24
	note NOTE_DURATION_12, A_0
	audio_wait_12
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note A_1
	audio_wait_12
	note NOTE_DURATION_12, D_1
	audio_wait_12
	note NOTE_DURATION_6, E_1
	audio_wait_6
	note E_0
	audio_wait_6
	audio_call .sub9
	note NOTE_DURATION_3, D_1, 24
	audio_wait_12
	note A_1
	audio_wait_24
	note NOTE_DURATION_12, D_1
	audio_wait_12
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note F_2
	audio_wait_12
	note G_2
	audio_wait_12
	note G_3
	audio_wait_12
	wave WAVE_5E
	note NOTE_DURATION_3, A_3
	audio_wait_12
	note C#4
	audio_wait_12
	note E_4
	audio_wait_24
	note G#3
	audio_wait_12
	note B_3
	audio_wait_12
	note E_4
	audio_wait_24
	note NOTE_DURATION_3, F#3
	audio_wait_12
	note A_3
	audio_wait_12
	note C#4
	audio_wait_24
	note C#3
	audio_wait_12
	note E_3
	audio_wait_12
	note G#3
	audio_wait_24
	note NOTE_DURATION_3, D_3, 24
	audio_wait_12
	note F#3
	audio_wait_12
	note A_3
	audio_wait_24
	note C#3
	audio_wait_12
	note E_3
	audio_wait_12
	note A_3
	audio_wait_24
	note B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note F#3
	audio_wait_24
	note E_3
	audio_wait_12
	note G#3
	audio_wait_12
	note B_3
	audio_wait_12
	note E_4
	audio_wait_12
	note A_2
	audio_wait_12
	note C#3
	audio_wait_12
	note E_3
	audio_wait_12
	note G#3
	audio_wait_12
	note A_3
	audio_wait_12
	note C#4
	audio_wait_12
	note E_4
	audio_wait_12
	note G#4
	audio_wait_12
	note A_4
	audio_wait_48
	note NOTE_DURATION_24, A_3
	audio_wait_24
	audio_end
; 0x372c4

Music_Credits_Ch4: ; 372c4 (0d:72c4)
	semitone_offset 0
	wave WAVE_28
	volume 75
	audio_wait_96
	audio_wait_96
	audio_wait_96
.sub1
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_6
	note D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_6
	note D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_6
	note D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_6
	note D_0
	audio_wait_6
	audio_ret

	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_42
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
.sub2
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_12
	audio_ret

	audio_call .sub2
	audio_call .sub2
.sub3
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	audio_ret

	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
.sub4
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	audio_ret

	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub3
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub4
.sub5
	note NOTE_DURATION_3, F#0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note F#0
	audio_wait_6
	audio_ret

	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	note NOTE_DURATION_3, F#0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note F#0
	audio_wait_6
	note D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub3
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
.sub6
	note NOTE_DURATION_3, F#0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	audio_ret

	audio_call .sub6
	audio_call .sub6
	audio_call .sub6
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_48
	audio_end
; 0x37450

Music_Credits: ; 37450 (d:7450)
	db $4, $0
	dw Music_Credits_Ch1
	dw Music_Credits_Ch2
	dw Music_Credits_Ch3
	dw Music_Credits_Ch4
