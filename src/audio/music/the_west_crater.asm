Music_TheWestCrater_Ch1:
	semitone_offset 0

.loop
	tempo 90
	wave WAVE_51
	volume 75
	audio_wait 96
	audio_wait 96
	audio_wait 96
	audio_wait 96
.sub1
	note NOTE_DURATION_5, C_3, 19
	audio_wait 36
	note B_2
	audio_wait 36
	note G_2
	audio_wait 24
	audio_ret

	audio_wait 96
.sub2
	note NOTE_DURATION_5, C_3, 19
	audio_wait 36
	note D#3
	audio_wait 36
	note G_3
	audio_wait 24
	audio_ret

	note F#3
	audio_wait 36
	note G_3
	audio_wait 36
	note D#3
	audio_wait 24
	note C_3
	audio_wait 96
	audio_wait 72
	note D#4
	audio_wait 12
	note C_4
	audio_wait 12
	audio_wait 72
	note D#5
	audio_wait 12
	note C_5
	audio_wait 12
	audio_wait 96
	audio_call .sub1
	audio_wait 96
	audio_call .sub2
	note NOTE_DURATION_5, G#3, 19
	audio_wait 36
	note G_3
	audio_wait 36
	note D#3
	audio_wait 24
	note C_3
	audio_wait 96
	audio_wait 24
	note G#4
	audio_wait 12
	note G_4
	audio_wait 36
	note D#4
	audio_wait 12
	note C_4
	audio_wait 12
	audio_wait 96
	audio_wait 24
	note C_5
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 60
	wave WAVE_50
	note NOTE_DURATION_5, C#3
	audio_wait 36
	note NOTE_DURATION_5
	audio_wait 36
	note NOTE_DURATION_5, F_3
	audio_wait 24
.sub3
	audio_wait 12
	note NOTE_DURATION_5, G#3, 19
	audio_wait 36
	note C_4
	audio_wait 24
	note G#3
	audio_wait 24
	audio_ret

	note G_3
	audio_wait 36
	note D_3
	audio_wait 36
	note G_3
	audio_wait 24
	audio_wait 96
	note C#3
	audio_wait 36
	note NOTE_DURATION_5
	audio_wait 36
	note NOTE_DURATION_5, F_3
	audio_wait 24
	audio_call .sub3
.sub4
	note NOTE_DURATION_5, G_3, 19
	audio_wait 12
	note G_1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G_3
	audio_wait 12
	note G_1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G_3
	audio_wait 12
	note G_1
	audio_wait 12
	audio_ret

	note G#3
	audio_wait 12
	note G#1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G#3
	audio_wait 12
	note G#1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G#3
	audio_wait 12
	note G#1
	audio_wait 12
	audio_call .sub4
	note NOTE_DURATION_5, G_4, 19
	audio_wait 12
	note G_1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G_4
	audio_wait 60
	wave WAVE_14
	audio_wait 18
	volume 56
	note NOTE_DURATION_12, C_0, 14
	audio_wait 12
	note G_0
	audio_wait 12
	note F#0
	audio_wait 12
	note C_0
	audio_wait 12
	note C#0
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 6
	audio_wait 6
	note C#0
	audio_wait 12
	note D_0
	audio_wait 12
	note A_0
	audio_wait 12
	note G#0
	audio_wait 12
	note D_0
	audio_wait 12
	note D#0
	audio_wait 12
	note A#0
	audio_wait 12
	note A_0
	audio_wait 6
	audio_wait 6
	note D#0
	audio_wait 12
	note NOTE_DURATION_12, E_0, 16
	audio_wait 12
	note B_0
	audio_wait 12
	note F_0
	audio_wait 12
	note C_1
	audio_wait 12
	note F#0
	audio_wait 12
	note C#1
	audio_wait 12
	note G_0
	audio_wait 6
	audio_wait 6
	note D_1
	audio_wait 12
	note NOTE_DURATION_12, G#0, 18
	audio_wait 12
	note D#1
	audio_wait 12
	note A_0
	audio_wait 12
	note E_1
	audio_wait 12
	note A#0
	audio_wait 12
	note F_1
	audio_wait 12
	note B_0
	audio_wait 6
	audio_wait 6
	note F#1
	audio_wait 12
	note NOTE_DURATION_12, C_1, 19
	audio_wait 12
	note G_1
	audio_wait 12
	note F#1
	audio_wait 12
	note C_1
	audio_wait 12
	note C#1
	audio_wait 12
	note G#1
	audio_wait 12
	note G_1
	audio_wait 6
	audio_wait 6
	note C#1
	audio_wait 12
	note D_1
	audio_wait 12
	note A_1
	audio_wait 12
	note G#1
	audio_wait 12
	note D_1
	audio_wait 12
	note D#1
	audio_wait 12
	note A#1
	audio_wait 12
	note A_1
	audio_wait 6
	audio_wait 6
	note D#1
	audio_wait 12
	note NOTE_DURATION_12, E_1, 21
	audio_wait 12
	note B_1
	audio_wait 12
	note F_1
	audio_wait 12
	note C_2
	audio_wait 12
	note F#1
	audio_wait 12
	note C#2
	audio_wait 12
	note G_1
	audio_wait 6
	audio_wait 6
	note D_2
	audio_wait 12
	note NOTE_DURATION_12, G#1, 22
	audio_wait 12
	note D#2
	audio_wait 12
	note A_1
	audio_wait 12
	note E_2
	audio_wait 12
	note NOTE_DURATION_12, A#1, 24
	audio_wait 12
	note F_2
	audio_wait 12
	note B_1
	audio_wait 6
	audio_jump .loop
.end
	audio_wait 6
	note NOTE_DURATION_12, F#2, 24
	audio_wait 12
	audio_end

Music_TheWestCrater_Ch2:
	semitone_offset 0

.loop
	wave WAVE_47
	volume 75
	audio_wait 96
	audio_wait 96
	audio_wait 96
	audio_wait 96
.sub1
	note NOTE_DURATION_5, G_2, 19
	audio_wait 36
	note F#2
	audio_wait 36
	note D_2
	audio_wait 24
	audio_ret

	audio_wait 96
.sub2
	note NOTE_DURATION_5, G_2, 19
	audio_wait 36
	note A#2
	audio_wait 36
	note D_3
	audio_wait 24
	audio_ret

	note C#3
	audio_wait 36
	note D_3
	audio_wait 36
	note A#2
	audio_wait 24
	note G_2
	audio_wait 96
	audio_wait 72
	note A#3
	audio_wait 12
	note G_3
	audio_wait 12
	audio_wait 72
	note A#4
	audio_wait 12
	note G_4
	audio_wait 12
	audio_wait 96
	audio_call .sub1
	audio_wait 96
	audio_call .sub2
	note NOTE_DURATION_5, D#3, 19
	audio_wait 36
	note D_3
	audio_wait 36
	note A#2
	audio_wait 24
	note G_2
	audio_wait 96
	audio_wait 24
	note D#4
	audio_wait 12
	note D_4
	audio_wait 36
	note A#3
	audio_wait 12
	note G_3
	audio_wait 12
	audio_wait 96
	audio_wait 24
	note G_4
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 60
	wave WAVE_46
	note NOTE_DURATION_5, G#2
	audio_wait 36
	note NOTE_DURATION_5
	audio_wait 36
	note NOTE_DURATION_5, C_3
	audio_wait 24
.sub3
	audio_wait 12
	note NOTE_DURATION_5, F_3, 19
	audio_wait 36
	note G#3
	audio_wait 24
	note F_3
	audio_wait 24
	audio_ret

	note D_3
	audio_wait 36
	note G_2
	audio_wait 36
	note D_3
	audio_wait 24
	audio_wait 96
	note G#2
	audio_wait 36
	note NOTE_DURATION_5
	audio_wait 36
	note NOTE_DURATION_5, C_3
	audio_wait 24
	audio_call .sub3
.sub4
	note NOTE_DURATION_5, D_3, 19
	audio_wait 12
	note D_1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, D_3
	audio_wait 12
	note D_1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, D_3
	audio_wait 12
	note D_1
	audio_wait 12
	audio_ret

	note D#3
	audio_wait 12
	note D#1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, D#3
	audio_wait 12
	note D#1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, D#3
	audio_wait 12
	note D#1
	audio_wait 12
	audio_call .sub4
	note NOTE_DURATION_5, D_4, 19
	audio_wait 12
	note D_1
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, D_4
	audio_wait 60
	wave WAVE_47
	audio_wait 6
	note NOTE_DURATION_5, C_0
	audio_wait 12
	note G_0
	audio_wait 12
	note F#0
	audio_wait 12
	note C_0
	audio_wait 12
	note C#0
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note C#0
	audio_wait 6
	audio_wait 6
	note D_0
	audio_wait 12
	note A_0
	audio_wait 12
	note G#0
	audio_wait 12
	note D_0
	audio_wait 12
	note D#0
	audio_wait 12
	note A#0
	audio_wait 12
	note A_0
	audio_wait 12
	note D#0
	audio_wait 6
	audio_wait 6
	note NOTE_DURATION_5, E_0, 21
	audio_wait 12
	note B_0
	audio_wait 12
	note F_0
	audio_wait 12
	note C_1
	audio_wait 12
	note F#0
	audio_wait 12
	note C#1
	audio_wait 12
	note G_0
	audio_wait 12
	note D_1
	audio_wait 6
	audio_wait 6
	note NOTE_DURATION_5, G#0, 22
	audio_wait 12
	note D#1
	audio_wait 12
	note A_0
	audio_wait 12
	note E_1
	audio_wait 12
	note A#0
	audio_wait 12
	note F_1
	audio_wait 12
	note B_0
	audio_wait 12
	note F#1
	audio_wait 6
	audio_wait 6
	note NOTE_DURATION_5, C_1, 23
	audio_wait 12
	note G_1
	audio_wait 12
	note F#1
	audio_wait 12
	note C_1
	audio_wait 12
	note C#1
	audio_wait 12
	note G#1
	audio_wait 12
	note G_1
	audio_wait 12
	note C#1
	audio_wait 6
	audio_wait 6
	note D_1
	audio_wait 12
	note A_1
	audio_wait 12
	note G#1
	audio_wait 12
	note D_1
	audio_wait 12
	note D#1
	audio_wait 12
	note A#1
	audio_wait 12
	note A_1
	audio_wait 12
	note D#1
	audio_wait 6
	audio_wait 6
	note NOTE_DURATION_5, E_1, 24
	audio_wait 12
	note B_1
	audio_wait 12
	note F_1
	audio_wait 12
	note C_2
	audio_wait 12
	note F#1
	audio_wait 12
	note C#2
	audio_wait 12
	note G_1
	audio_wait 12
	note D_2
	audio_wait 6
	audio_wait 6
	note NOTE_DURATION_5, G#1, 27
	audio_wait 12
	note D#2
	audio_wait 12
	note A_1
	audio_wait 12
	note E_2
	audio_wait 12
	note NOTE_DURATION_5, A#1, 29
	audio_wait 12
	note F_2
	audio_wait 12
	note B_1
	audio_wait 12
	note F#2
	audio_wait 6
	audio_jump .loop
.end
	audio_end

Music_TheWestCrater_Ch3:
	semitone_offset 0

.loop
	wave WAVE_63
	volume 108
	note NOTE_DURATION_5, C_0, 24
	audio_wait 12
	note G_0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
	note C_0
	audio_wait 12
	note G_0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
.sub1
	note NOTE_DURATION_5, C_0, 24
	audio_wait 12
	note G_0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
	note C_0
	audio_wait 12
	note G_0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
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
.sub2
	note NOTE_DURATION_5, C#0, 24
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note D_0
	audio_wait 12
	note C#0
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note D_0
	audio_wait 12
	audio_ret

.sub3
	note NOTE_DURATION_5, C#0, 24
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note D_0
	audio_wait 12
	note C#0
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note C#0
	audio_wait 12
	audio_ret

	note G_0
	audio_wait 12
	note D_1
	audio_wait 12
	note C#1
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note D_1
	audio_wait 12
	note C#1
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note D_1
	audio_wait 12
	note C#1
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note D_1
	audio_wait 12
	note C#1
	audio_wait 12
	note D_1
	audio_wait 12
	audio_call .sub2
	audio_call .sub3
.sub4
	note NOTE_DURATION_5, G_2, 19
	audio_wait 12
	note G_0
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G_2
	audio_wait 12
	note G_0
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G_2
	audio_wait 12
	note G_0
	audio_wait 12
	audio_ret

	note G#2
	audio_wait 12
	note G_0
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G#2
	audio_wait 12
	note G_0
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G#2
	audio_wait 12
	note G_0
	audio_wait 12
	audio_call .sub4
	note NOTE_DURATION_5, G_3, 19
	audio_wait 12
	note G_0
	audio_wait 12
	note NOTE_DURATION_5
	audio_wait 12
	note NOTE_DURATION_5, G_3
	audio_wait 60
	volume 108
	note NOTE_DURATION_5, C_0, 24
	audio_wait 12
	note G_0
	audio_wait 12
	note F#0
	audio_wait 12
	note C_0
	audio_wait 12
	note C#0
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note C#0
	audio_wait 12
	note D_0
	audio_wait 12
	note A_0
	audio_wait 12
	note G#0
	audio_wait 12
	note D_0
	audio_wait 12
	note D#0
	audio_wait 12
	note A#0
	audio_wait 12
	note A_0
	audio_wait 12
	note D#0
	audio_wait 12
	note E_0
	audio_wait 12
	note B_0
	audio_wait 12
	note F_0
	audio_wait 12
	note C_1
	audio_wait 12
	note F#0
	audio_wait 12
	note C#1
	audio_wait 12
	note G_0
	audio_wait 12
	note D_1
	audio_wait 12
	note G#0
	audio_wait 12
	note D#1
	audio_wait 12
	note A_0
	audio_wait 12
	note E_1
	audio_wait 12
	note A#0
	audio_wait 12
	note F_1
	audio_wait 12
	note B_0
	audio_wait 12
	note F#1
	audio_wait 12
	note C_1
	audio_wait 12
	note G_1
	audio_wait 12
	note F#1
	audio_wait 12
	note C_1
	audio_wait 12
	note C#1
	audio_wait 12
	note G#1
	audio_wait 12
	note G_1
	audio_wait 12
	note C#1
	audio_wait 12
	note D_1
	audio_wait 12
	note A_1
	audio_wait 12
	note G#1
	audio_wait 12
	note D_1
	audio_wait 12
	note D#1
	audio_wait 12
	note A#1
	audio_wait 12
	note A_1
	audio_wait 12
	note D#1
	audio_wait 12
	note E_1
	audio_wait 12
	note B_1
	audio_wait 12
	note F_1
	audio_wait 12
	note C_2
	audio_wait 12
	note F#1
	audio_wait 12
	note C#2
	audio_wait 12
	note G_1
	audio_wait 12
	note D_2
	audio_wait 12
	note G#1
	audio_wait 12
	note D#2
	audio_wait 12
	note A_1
	audio_wait 12
	note E_2
	audio_wait 12
	note A#1
	audio_wait 12
	note F_2
	audio_wait 12
	note B_1
	audio_wait 12
	note F#2
	audio_wait 12
	audio_jump .loop
.end
	audio_end

Music_TheWestCrater:
	db $3, $2
	dw Music_TheWestCrater_Ch1
	dw Music_TheWestCrater_Ch2
	dw Music_TheWestCrater_Ch3

; unused?
	dw Music_TheWestCrater_Ch1.loop
	dw Music_TheWestCrater_Ch2.loop
	dw Music_TheWestCrater_Ch3.loop

	dw Music_TheWestCrater_Ch1.end
	dw Music_TheWestCrater_Ch2.end
	dw Music_TheWestCrater_Ch3.end
