Music_HiddenFigureBattle1_Ch1: ; 3a649 (0e:6649)
	semitone_offset 0
	tempo 70
	wave WAVE_17
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	note NOTE_DURATION_3, G_3, 22
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_48
	audio_wait_72
	audio_wait_96
	audio_wait_96
	wave WAVE_51
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_1, 29
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_12
	wave WAVE_52
	note NOTE_DURATION_6, C_2, 22
	audio_wait_6
	note F#2
	audio_wait_6
	note G_2
	audio_wait_6
	note A#2
	audio_wait_6

.loop
.sub1
	note NOTE_DURATION_36, B_2, 22
	audio_wait_36
	note NOTE_DURATION_4, A#2
	audio_wait_4
	note B_2
	audio_wait_4
	note A#2
	audio_wait_4
	note NOTE_DURATION_96, G_2
	audio_wait_48
	audio_ret

.sub2
	audio_wait_72
	note NOTE_DURATION_6, C_2, 22
	audio_wait_6
	note F#2
	audio_wait_6
	note G_2
	audio_wait_6
	note A#2
	audio_wait_6
	audio_ret

.sub3
	note NOTE_DURATION_36, B_2, 22
	audio_wait_36
	note NOTE_DURATION_4, A#2
	audio_wait_4
	note B_2
	audio_wait_4
	note A#2
	audio_wait_4
	note NOTE_DURATION_96, D#3
	audio_wait_48
	audio_ret

.sub4
	audio_wait_72
	note NOTE_DURATION_6, C_3, 22
	audio_wait_6
	note F#3
	audio_wait_6
	note G_3
	audio_wait_6
	note A#3
	audio_wait_6
	audio_ret

	note NOTE_DURATION_40, B_3
	audio_wait_36
	note NOTE_DURATION_4, A#3
	audio_wait_4
	note NOTE_DURATION_8, B_3
	audio_wait_4
	note NOTE_DURATION_4, A#3
	audio_wait_4
	note NOTE_DURATION_96, G_3
	audio_wait_48
	audio_call .sub4
.sub5
	note NOTE_DURATION_36, B_3, 22
	audio_wait_36
	note NOTE_DURATION_4, A#3
	audio_wait_4
	note B_3
	audio_wait_4
	note A#3
	audio_wait_4
	note NOTE_DURATION_96, D#4
	audio_wait_48
	audio_ret

	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	note NOTE_DURATION_36, B_3, 22
	audio_wait_36
	note NOTE_DURATION_4, A#3
	audio_wait_4
	note B_3
	audio_wait_4
	note A#3
	audio_wait_4
	note NOTE_DURATION_96, G_3
	audio_wait_48
	audio_call .sub4
	audio_call .sub5
	audio_wait_72
	note NOTE_DURATION_6, C_3, 22
	audio_wait_6
	note F#3
	audio_wait_6
	note G_3
	audio_wait_6
	note C#3
	audio_wait_6
	wave WAVE_51
	audio_wait_12
	note NOTE_DURATION_3, D#3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3, C#3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3, G_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3, F#3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3, D#3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F#3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_3
	audio_wait_96
	audio_wait_96
	note D_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, E_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	wave WAVE_50
	note NOTE_DURATION_12, G_2
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F#2
	audio_wait_12
	note D_2
	audio_wait_12
	note_sustain
	note G_2
	audio_wait_48
	audio_wait_72
	note NOTE_DURATION_0, NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, A_2
	audio_wait_6
	note A#2
	audio_wait_6
	note D_3
	audio_wait_6
	note NOTE_DURATION_12, C#3
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_60
	note NOTE_DURATION_6, G_3
	audio_wait_6
	note A_3
	audio_wait_6
	note A#3
	audio_wait_6
	note D_4
	audio_wait_6
	note NOTE_DURATION_12, C#4
	audio_wait_12
	note NOTE_DURATION_3, D_4
	audio_wait_84
	note NOTE_DURATION_6, G_3
	audio_wait_6
	note G_4
	audio_wait_6
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note_sustain
	note G_4
	audio_wait_48
	audio_wait_72
	note NOTE_DURATION_0, NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, A_4
	audio_wait_6
	note A#4
	audio_wait_6
	note D_5
	audio_wait_6
	note NOTE_DURATION_12, C#5
	audio_wait_12
	note NOTE_DURATION_3, D_5
	audio_wait_36
	note NOTE_DURATION_12, C#4
	audio_wait_12
	note NOTE_DURATION_3, D_4
	audio_wait_36
	note NOTE_DURATION_12, C#3
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_60
	note NOTE_DURATION_6, G_2
	audio_wait_6
	note F#2
	audio_wait_6
	note F_2
	audio_wait_6
	note C#2
	audio_wait_6
	note NOTE_DURATION_96, C_2
	audio_wait_96
	audio_wait_96
	wave WAVE_51
	note NOTE_DURATION_3, C_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#2
	audio_wait_12
	wave WAVE_52
	note NOTE_DURATION_6, C_2
	audio_wait_6
	note F#2
	audio_wait_6
	note G_2
	audio_wait_6
	note NOTE_DURATION_6, A#2, 19
	audio_wait_6
	audio_jump .loop
.end
	audio_end
; 0x3a848

Music_HiddenFigureBattle1_Ch2: ; 3a848 (0e:6848)
	semitone_offset 0
	wave WAVE_0D
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	note NOTE_DURATION_3, D#3, 22
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_48
	audio_wait_72
	wave WAVE_47
	note NOTE_DURATION_3, G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub1
	note NOTE_DURATION_3, G_0, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub1
.sub2
	note NOTE_DURATION_3, G_0, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#0
	audio_wait_36
	audio_ret

.loop
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
	audio_call .sub2
	note NOTE_DURATION_3, G_0, 22
	audio_wait_12
	note A#2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note G_0
	audio_wait_12
	note A#2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note G_0
	audio_wait_12
	note A_2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_2
	audio_wait_12
	note G_0
	audio_wait_12
	note A_2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_2
	audio_wait_12
	note G_0
	audio_wait_12
	note G#2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#2
	audio_wait_12
	note G_0
	audio_wait_12
	note G#2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#2
	audio_wait_12
	note G_0
	audio_wait_12
	note G_2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G_2
	audio_wait_12
	note G_0
	audio_wait_12
	note G_2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G_2
	audio_wait_12
	note G_0
	audio_wait_12
	note D_3
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note A#0
	audio_wait_12
	note D_3
	audio_wait_6
	note A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note A_0
	audio_wait_12
	note C#3
	audio_wait_6
	note A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#3
	audio_wait_12
	note G#0
	audio_wait_12
	note C_3
	audio_wait_6
	note G#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C_3
	audio_wait_12
	note G_0
	audio_wait_12
	note A#2
	audio_wait_6
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note A#0
	audio_wait_12
	note A#2
	audio_wait_6
	note A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note C_1
	audio_wait_12
	note A_2
	audio_wait_6
	note C_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_2
	audio_wait_12
	note D#1
	audio_wait_12
	note C#3
	audio_wait_6
	note D#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#3
	audio_wait_12
.sub3
	note NOTE_DURATION_3, D_1, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
	note NOTE_DURATION_3, D_1, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub4
	note NOTE_DURATION_3, G_1, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub4
	audio_call .sub4
	note NOTE_DURATION_3, G_1, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_36
	audio_jump .loop
.end
	audio_end
; 0x3aa0b

Music_HiddenFigureBattle1_Ch3: ; 3aa0b (0e:6a0b)
	semitone_offset 0
	wave WAVE_5D
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 108
	note NOTE_DURATION_3, B_2, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_48
	audio_wait_48
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note F#0
	audio_wait_6
	note F_0
	audio_wait_6
	note C#0
	audio_wait_6
	wave WAVE_5E
	note NOTE_DURATION_3, C_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub1
	note NOTE_DURATION_3, C_0, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub1
.sub2
	note NOTE_DURATION_3, C_0, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_36
	audio_ret

.loop
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
	audio_call .sub2
.sub3
	note NOTE_DURATION_3, C_0, 24
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	audio_ret

	audio_call .sub3
	audio_call .sub3
	audio_call .sub3
.sub4
	note NOTE_DURATION_3, C_0, 24
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	note NOTE_DURATION_3, D#0
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	audio_ret

	note NOTE_DURATION_3, D_0
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	note NOTE_DURATION_3, C#0
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	audio_call .sub4
	note NOTE_DURATION_3, F_0, 24
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
	note NOTE_DURATION_3, G#0
	audio_wait_18
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_18
.sub5
	note NOTE_DURATION_3, G_0, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	audio_call .sub5
	note NOTE_DURATION_3, G_0, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub6
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub6
	audio_call .sub6
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C#1
	audio_wait_36
	audio_jump .loop
.end
	audio_end
; 0x3ab6d

Music_HiddenFigureBattle1_Ch4: ; 3ab6d (0e:6b6d)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, F#0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
.sub1
	note NOTE_DURATION_3, D_0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#0
	audio_wait_12
	note D_0
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub1
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
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x3ac2b

Music_HiddenFigureBattle1: ; 3ac2b (0e:6c2b)
	db 4, 2
	dw Music_HiddenFigureBattle1_Ch1
	dw Music_HiddenFigureBattle1_Ch2
	dw Music_HiddenFigureBattle1_Ch3
	dw Music_HiddenFigureBattle1_Ch4

; unused?
	dw Music_HiddenFigureBattle1_Ch1.loop
	dw Music_HiddenFigureBattle1_Ch2.loop
	dw Music_HiddenFigureBattle1_Ch3.loop
	dw Music_HiddenFigureBattle1_Ch4.loop

	dw Music_HiddenFigureBattle1_Ch1.end
	dw Music_HiddenFigureBattle1_Ch2.end
	dw Music_HiddenFigureBattle1_Ch3.end
	dw Music_HiddenFigureBattle1_Ch4.end
; 0x3ac45
