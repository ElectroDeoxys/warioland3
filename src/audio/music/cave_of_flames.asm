Music_CaveOfFlames_Ch1: ; 35f5e (0d:5f5e)
	semitone_offset 0
	tempo 42
	wave WAVE_63
	volume 108
	audio_wait_96
	audio_wait_96

.loop
.sub1
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#1
	audio_wait_6
	note G_1
	audio_wait_12
	note C_2
	audio_wait_12
	note B_1
	audio_wait_12
	note G_1
	audio_wait_12
	note D#1
	audio_wait_12
	note B_1
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_3, A#1, 24
	audio_wait_12
	note G_1
	audio_wait_12
	note D#1
	audio_wait_12
	note A#1
	audio_wait_12
	note A_1
	audio_wait_48
	audio_ret

.sub3
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_1
	audio_wait_6
	note D#1
	audio_wait_12
	note G#1
	audio_wait_12
	note G_1
	audio_wait_12
	note D#1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	audio_ret

	note F#1
	audio_wait_12
	note D_1
	audio_wait_12
	note D#1
	audio_wait_12
	note F#1
	audio_wait_12
	note G_1
	audio_wait_48
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	note NOTE_DURATION_3, F#1, 24
	audio_wait_12
	note D#1
	audio_wait_12
	note D_1
	audio_wait_12
	note B_0
	audio_wait_12
	note C_1
	audio_wait_48
.sub4
	note NOTE_DURATION_36, C#1, 24
	audio_wait_36
	note NOTE_DURATION_3, C_1
	audio_wait_12
	note B_0
	audio_wait_12
	note G_0
	audio_wait_36
	audio_ret

	audio_call .sub4
	note NOTE_DURATION_18, G#0, 24
	audio_wait_18
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note NOTE_DURATION_3, F#0
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_0
	audio_wait_12
	note C_1
	audio_wait_12
	note D#1
	audio_wait_12
	note D_1
	audio_wait_24
	note G_1
	audio_wait_72
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#1
	audio_wait_6
	note G#1
	audio_wait_12
	note C#2
	audio_wait_12
	note C_2
	audio_wait_12
	note G_1
	audio_wait_12
	note D#1
	audio_wait_12
	note C_1
	audio_wait_12
	note B_0
	audio_wait_12
	note G_0
	audio_wait_12
	note A_0
	audio_wait_12
	note B_0
	audio_wait_12
	note C_1
	audio_wait_48
	audio_wait_96
	audio_wait_60
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note E_1
	audio_wait_12
.sub5
	note NOTE_DURATION_3, F_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_6
	note C_2
	audio_wait_12
	note F_2
	audio_wait_12
	note E_2
	audio_wait_12
	note C_2
	audio_wait_12
	note G#1
	audio_wait_12
	note E_2
	audio_wait_12
	audio_ret

.sub6
	note NOTE_DURATION_3, D#2, 24
	audio_wait_12
	note C_2
	audio_wait_12
	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note D_2
	audio_wait_48
	audio_ret

.sub7
	note NOTE_DURATION_3, F_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G_1
	audio_wait_6
	note G#1
	audio_wait_12
	note C#2
	audio_wait_12
	note C_2
	audio_wait_12
	note G#1
	audio_wait_12
	note F_1
	audio_wait_12
	note C_2
	audio_wait_12
	audio_ret

	note B_1
	audio_wait_12
	note G_1
	audio_wait_12
	note G#1
	audio_wait_12
	note B_1
	audio_wait_12
	note C_2
	audio_wait_48
	audio_call .sub5
	audio_call .sub6
	audio_call .sub7
	note NOTE_DURATION_3, B_1, 24
	audio_wait_12
	note G#1
	audio_wait_12
	note G_1
	audio_wait_12
	note E_1
	audio_wait_12
	note F_1
	audio_wait_48
.sub8
	note NOTE_DURATION_36, F#1, 24
	audio_wait_36
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note E_1
	audio_wait_12
	note C_1
	audio_wait_36
	audio_ret

	audio_call .sub8
	note NOTE_DURATION_18, C#1, 24
	audio_wait_18
	note NOTE_DURATION_6, C_1
	audio_wait_6
	note NOTE_DURATION_3, B_0
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note F_1
	audio_wait_12
	note G#1
	audio_wait_12
	note G_1
	audio_wait_24
	note C_2
	audio_wait_72
	audio_call .sub5
	audio_call .sub6
	note NOTE_DURATION_3, F_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_6
	note C#2
	audio_wait_12
	note F#2
	audio_wait_12
	note F_2
	audio_wait_12
	note C_2
	audio_wait_12
	note G#1
	audio_wait_12
	note F_1
	audio_wait_12
	note E_1
	audio_wait_12
	note C_1
	audio_wait_12
	note D_1
	audio_wait_12
	note E_1
	audio_wait_12
	note F_1
	audio_wait_48
	audio_jump .loop
.end
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D#1
	audio_wait_6
	note G_1
	audio_wait_12
	note C_2
	audio_wait_12
	note B_1
	audio_wait_12
	note G_1
	audio_wait_12
	note D#1
	audio_wait_12
	note B_1
	audio_wait_3
	audio_end
; 0x360d0

Music_CaveOfFlames_Ch2: ; 360d0 (0d:60d0)
	semitone_offset 0
	wave WAVE_55
	volume 85
	audio_wait_96
	audio_wait_96

.loop
.sub1
	note NOTE_DURATION_12, C_3, 19
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_12
	audio_ret

	note C_3
	audio_wait_96
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, D_3
	audio_wait_6
	note NOTE_DURATION_3, D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note F#2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note D_3
	audio_wait_48
	note NOTE_DURATION_12, C_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_3
	audio_wait_12
	note G_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_3
	audio_wait_12
	note G_3
	audio_wait_12
	note C_4
	audio_wait_96
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_3, D#4
	audio_wait_12
	note G#4
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G_3
	audio_wait_12
	note F#3
	audio_wait_12
	note C_4
	audio_wait_12
	note B_3
	audio_wait_12
	note G_4
	audio_wait_12
	note C_4
	audio_wait_48
	note NOTE_DURATION_12, C#3
	audio_wait_18
	note NOTE_DURATION_6, D#3
	audio_wait_6
	note NOTE_DURATION_3, F_3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note B_2
	audio_wait_36
	note NOTE_DURATION_12, C#4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_12, G#3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note C_4
	audio_wait_12
	note D#4
	audio_wait_12
	note G#4
	audio_wait_12
	note G_4
	audio_wait_24
	note G_3
	audio_wait_72
	audio_call .sub1
	note NOTE_DURATION_3, C_3, 19
	audio_wait_96
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, D_3
	audio_wait_6
	note NOTE_DURATION_3, D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_3
	audio_wait_12
	note F#3
	audio_wait_12
	note D#3
	audio_wait_12
	note D_3
	audio_wait_12
	note B_2
	audio_wait_12
	note C_3
	audio_wait_48
	audio_wait_96
	audio_wait_96
.sub2
	note NOTE_DURATION_12, F_3, 19
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_3
	audio_wait_12
	note C_3
	audio_wait_12
	audio_ret

	note F_3
	audio_wait_96
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, G_3
	audio_wait_6
	note NOTE_DURATION_3, G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_3
	audio_wait_12
	note C_3
	audio_wait_12
	note B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note F_3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_48
	note NOTE_DURATION_12, F_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, E_4
	audio_wait_12
	note C_4
	audio_wait_12
	note F_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_4
	audio_wait_12
	note C_4
	audio_wait_12
	note F_4
	audio_wait_96
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, G_4
	audio_wait_6
	note NOTE_DURATION_3, G#4
	audio_wait_12
	note C#5
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_12
	note C_4
	audio_wait_12
	note B_3
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_5
	audio_wait_12
	note F_4
	audio_wait_48
	note NOTE_DURATION_12, F#3
	audio_wait_18
	note NOTE_DURATION_6, G#3
	audio_wait_6
	note NOTE_DURATION_3, A#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note E_3
	audio_wait_36
	note NOTE_DURATION_12, F#4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_12, C#4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note F_4
	audio_wait_12
	note G#4
	audio_wait_12
	note C#5
	audio_wait_12
	note C_5
	audio_wait_24
	note C_4
	audio_wait_72
	audio_call .sub2
	note NOTE_DURATION_3, F_3, 19
	audio_wait_96
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, G_3
	audio_wait_6
	note NOTE_DURATION_3, G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_3
	audio_wait_12
	note C_4
	audio_wait_12
	note B_3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note E_3
	audio_wait_12
	note F_3
	audio_wait_48
	audio_jump .loop
.end
	note NOTE_DURATION_12, C_3, 19
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_3
	audio_end
; 0x36266

Music_CaveOfFlames_Ch3: ; 36266 (0d:6266)
	semitone_offset 0
	wave WAVE_48
	volume 66
	audio_wait_96
	audio_wait_96

.loop
.sub1
	audio_wait_9
	note NOTE_DURATION_12, C_3, 17
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_3
	audio_ret

.sub2
	audio_wait_9
	note NOTE_DURATION_3, C_3, 17
	audio_wait_84
	audio_wait_3
	audio_ret

	audio_wait_9
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, D_3
	audio_wait_6
	note NOTE_DURATION_3, D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_3
	audio_wait_9
	note F#2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note D_3
	audio_wait_36
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, C_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_3
	audio_wait_12
	note G_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_3
	audio_wait_12
	note G_3
	audio_wait_3
	audio_wait_9
	note C_4
	audio_wait_84
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_3, D#4
	audio_wait_12
	note G#4
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G_3
	audio_wait_3
	audio_wait_9
	note F#3
	audio_wait_12
	note C_4
	audio_wait_12
	note B_3
	audio_wait_12
	note G_4
	audio_wait_12
	note C_4
	audio_wait_36
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, C#3
	audio_wait_18
	note NOTE_DURATION_6, D#3
	audio_wait_6
	note NOTE_DURATION_3, F_3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note B_2
	audio_wait_24
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, C#4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, G#3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note C_4
	audio_wait_12
	note D#4
	audio_wait_12
	note G#4
	audio_wait_3
	audio_wait_9
	note G_4
	audio_wait_24
	note G_3
	audio_wait_60
	audio_wait_3
	audio_call .sub1
	audio_call .sub2
	audio_wait_9
	note NOTE_DURATION_12, C_3, 17
	audio_wait_18
	note NOTE_DURATION_6, D_3
	audio_wait_6
	note NOTE_DURATION_3, D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_3
	audio_wait_3
	audio_wait_9
	note F#3
	audio_wait_12
	note D#3
	audio_wait_12
	note D_3
	audio_wait_12
	note B_2
	audio_wait_12
	note C_3
	audio_wait_36
	audio_wait_3
	audio_wait_96
	audio_wait_96
.sub3
	audio_wait_9
	note NOTE_DURATION_12, F_3, 17
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_3
	audio_wait_12
	note C_3
	audio_wait_3
	audio_ret

.sub4
	audio_wait_9
	note NOTE_DURATION_3, F_3, 17
	audio_wait_84
	audio_wait_3
	audio_ret

	audio_wait_9
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, G_3
	audio_wait_6
	note NOTE_DURATION_3, G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_3
	audio_wait_12
	note C_3
	audio_wait_3
	audio_wait_9
	note B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note F_3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_36
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, F_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, E_4
	audio_wait_12
	note C_4
	audio_wait_12
	note F_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_4
	audio_wait_12
	note C_4
	audio_wait_3
	audio_wait_9
	note F_4
	audio_wait_84
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6, G_4
	audio_wait_6
	note NOTE_DURATION_3, G#4
	audio_wait_12
	note C#5
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_12
	note C_4
	audio_wait_3
	audio_wait_9
	note B_3
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_5
	audio_wait_12
	note F_4
	audio_wait_36
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, F#3
	audio_wait_18
	note NOTE_DURATION_6, G#3
	audio_wait_6
	note NOTE_DURATION_3, A#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note E_3
	audio_wait_24
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, F#4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_12, C#4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note F_4
	audio_wait_12
	note G#4
	audio_wait_12
	note C#5
	audio_wait_3
	audio_wait_9
	note C_5
	audio_wait_24
	note C_4
	audio_wait_60
	audio_wait_3
	audio_call .sub3
	audio_call .sub4
	audio_wait_9
	note NOTE_DURATION_12, F_3, 17
	audio_wait_18
	note NOTE_DURATION_6, G_3
	audio_wait_6
	note NOTE_DURATION_3, G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_3
	audio_wait_12
	note C_4
	audio_wait_3
	audio_wait_9
	note B_3
	audio_wait_12
	note G#3
	audio_wait_12
	note G_3
	audio_wait_12
	note E_3
	audio_wait_12
	note F_3
	audio_wait_36
	audio_wait_3
	audio_jump .loop
.end
	audio_call .sub1
	audio_end
; 0x3641f

Music_CaveOfFlames_Ch4: ; 3641f (0d:641f)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_0
	audio_wait_24

.sub1
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	audio_ret

.loop
.sub2
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_0
	audio_wait_24
	audio_ret

	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_call .sub2
	audio_jump .loop
.end
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_0
	audio_wait_3
	audio_end
; 0x364c6

Music_CaveOfFlames: ; 364c6 (d:64c6)
	db $4, $2
	dw Music_CaveOfFlames_Ch1
	dw Music_CaveOfFlames_Ch2
	dw Music_CaveOfFlames_Ch3
	dw Music_CaveOfFlames_Ch4

; unused?
	dw Music_CaveOfFlames_Ch1.loop
	dw Music_CaveOfFlames_Ch2.loop
	dw Music_CaveOfFlames_Ch3.loop
	dw Music_CaveOfFlames_Ch4.loop

	dw Music_CaveOfFlames_Ch1.end
	dw Music_CaveOfFlames_Ch2.end
	dw Music_CaveOfFlames_Ch3.end
	dw Music_CaveOfFlames_Ch4.end
