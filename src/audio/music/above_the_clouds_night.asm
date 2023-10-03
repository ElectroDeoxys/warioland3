Music_AboveTheCloudsNight_Ch1:
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_64
	volume 120
	audio_wait_72
	audio_wait_72
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_24, D#4, 31
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C#4
	audio_wait_12
	note A#3
	audio_wait_12
	audio_ret

	note NOTE_DURATION_6, D#4, 31
	audio_wait_24
	note C#4
	audio_wait_24
	note A#3
	audio_wait_24
	audio_ret

	note D#4
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_36
	audio_wait_36
	note NOTE_DURATION_12, F_4
	audio_wait_12
	note G_4
	audio_wait_12
	note A#4
	audio_wait_12
	note NOTE_DURATION_6, G#4
	audio_wait_24
	note F_4
	audio_wait_24
	note NOTE_DURATION_12, C#4
	audio_wait_12
	note A#3
	audio_wait_12
	note NOTE_DURATION_6, D#4
	audio_wait_72
	audio_wait_72
.sub1
	note NOTE_DURATION_24, D#4, 31
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C#4
	audio_wait_12
	note A#3
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_6, D#4, 31
	audio_wait_24
	note C#4
	audio_wait_24
	note A#3
	audio_wait_24
	audio_ret

	note D#4
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_36
	audio_wait_36
	note NOTE_DURATION_12, F_4
	audio_wait_12
	note G_4
	audio_wait_12
	note A#4
	audio_wait_12
	note NOTE_DURATION_12, G#4
	audio_wait_12
	note F_4
	audio_wait_12
	note NOTE_DURATION_6, C#4
	audio_wait_24
	note A#3
	audio_wait_24
	note NOTE_DURATION_6, D#4
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_24, D#4, 31
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note G#3
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_12, D#4, 31
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_6, D#4
	audio_wait_48
	audio_ret

	note NOTE_DURATION_24
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, A#3
	audio_wait_12
	note G_3
	audio_wait_12
	audio_call .sub3
	note NOTE_DURATION_24, D#4, 31
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note A_3
	audio_wait_12
	note F_3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_6, C_4
	audio_wait_24
	note NOTE_DURATION_12, D#4
	audio_wait_12
	note G_4
	audio_wait_12
	note NOTE_DURATION_48, F_4
	audio_wait_72
	note A#4
	audio_wait_72
	note NOTE_DURATION_24, F#4
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, D#4
	audio_wait_12
	note B_3
	audio_wait_12
	note NOTE_DURATION_24, F#4
	audio_wait_72
	note NOTE_DURATION_24
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C#4
	audio_wait_12
	note A#3
	audio_wait_12
	note NOTE_DURATION_24, F#4
	audio_wait_72
	note NOTE_DURATION_36
	audio_wait_36
	note NOTE_DURATION_12, F_4
	audio_wait_12
	note D#4
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_6, D#4
	audio_wait_24
	note F#4
	audio_wait_24
	note A#4
	audio_wait_24
	note NOTE_DURATION_60, G#4
	audio_wait_60
	note NOTE_DURATION_6, G_4
	audio_wait_6
	note F#4
	audio_wait_6
	note NOTE_DURATION_48, F_4
	audio_wait_72
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_24, D#4, 31
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note NOTE_DURATION_6, D#4, 31
	audio_wait_24
	note C_4
	audio_wait_24
	note G#3
	audio_wait_24
	note NOTE_DURATION_24, D#3, 31
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C#3
	audio_wait_12
	note A#2
	audio_wait_12
	note NOTE_DURATION_6, D#3, 31
	audio_wait_24
	note C#3
	audio_wait_24
	note A#2
	audio_wait_24
	note NOTE_DURATION_24, D#3, 31
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_6, C_3
	audio_wait_12
	note G#2
	audio_wait_12
	note NOTE_DURATION_6, D#3
	audio_wait_48
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, F_3
	audio_wait_12
	note NOTE_DURATION_36, G_3
	audio_wait_36
	note NOTE_DURATION_12, D#3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_3
	audio_wait_12
	note NOTE_DURATION_48, F_3
	audio_wait_48
	note NOTE_DURATION_12, C_3
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_6, D#3
	audio_wait_48
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_6, C#3
	audio_wait_48
	note NOTE_DURATION_24, C#4
	audio_wait_24
	note NOTE_DURATION_6, D#4
	audio_wait_48
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_6, C#4
	audio_wait_72
	audio_jump .loop
.end
	audio_end

Music_AboveTheCloudsNight_Ch2:
	semitone_offset 0

.loop
	wave WAVE_55
	volume 75
	note NOTE_DURATION_3, D#2, 19
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_12
	note G_2
	audio_wait_12
.sub1
	note NOTE_DURATION_3, A#1, 19
	audio_wait_12
	note F_2
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_12
	note G#2
	audio_wait_12
	note F_2
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_3, D#2, 19
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_12
	note G_2
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, D#2, 19
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#2
	audio_wait_12
	note F_2
	audio_wait_12
	note G_2
	audio_wait_12
.sub3
	note NOTE_DURATION_3, G#2, 19
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_12
	audio_ret

	audio_call .sub3
.sub4
	note NOTE_DURATION_3, G_2, 19
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_12
	audio_ret

	audio_call .sub4
	note NOTE_DURATION_3, F_2, 19
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_12
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note F_1
	audio_wait_12
	note G_1
	audio_wait_12
	note A_1
	audio_wait_12
.sub5
	note NOTE_DURATION_3, A#1, 19
	audio_wait_12
	note F_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D_3
	audio_wait_12
	note A#2
	audio_wait_12
	note F_2
	audio_wait_12
	audio_ret

	audio_call .sub5
	note NOTE_DURATION_3, B_1, 19
	audio_wait_12
	note F#2
	audio_wait_12
	note B_2
	audio_wait_12
	note D#3
	audio_wait_12
	note B_2
	audio_wait_12
	note F#2
	audio_wait_12
	note B_2
	audio_wait_12
	note F#3
	audio_wait_12
	note B_3
	audio_wait_12
	note D#4
	audio_wait_12
	note B_3
	audio_wait_12
	note F#3
	audio_wait_12
	note A#1
	audio_wait_12
	note F#2
	audio_wait_12
	note A#2
	audio_wait_12
	note C#3
	audio_wait_12
	note A#2
	audio_wait_12
	note F#2
	audio_wait_12
	note A#2
	audio_wait_12
	note F#3
	audio_wait_12
	note A#3
	audio_wait_12
	note C#4
	audio_wait_12
	note A#3
	audio_wait_12
	note F#3
	audio_wait_12
.sub6
	note NOTE_DURATION_3, G#1, 19
	audio_wait_12
	note D#2
	audio_wait_12
	note F#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	audio_ret

	audio_call .sub6
	note NOTE_DURATION_3, C#2, 19
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_12
	note F_3
	audio_wait_12
	note G#3
	audio_wait_24
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D_3
	audio_wait_12
	note F_3
	audio_wait_12
	note A#3
	audio_wait_12
	audio_call .sub2
	audio_call .sub2
.sub7
	note NOTE_DURATION_3, G#1, 19
	audio_wait_12
	note D#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note G#2
	audio_wait_12
	note D#2
	audio_wait_12
	audio_ret

	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note G#2
	audio_wait_12
	note G#1
	audio_wait_12
	audio_call .sub2
	audio_call .sub2
	audio_call .sub7
	audio_call .sub7
	note NOTE_DURATION_3, F_2, 19
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#2
	audio_wait_12
	note D_3
	audio_wait_12
	note G#2
	audio_wait_12
	note F_2
	audio_wait_12
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_AboveTheCloudsNight_Ch3:
	semitone_offset 0

.loop
	wave WAVE_10
	volume 66
	audio_wait_18
	note NOTE_DURATION_10, D#2, 17
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_6
.sub1
	audio_wait_6
	note NOTE_DURATION_10, G_2, 17
	audio_wait_12
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_12
	note G#2
	audio_wait_6
	audio_ret

.sub2
	audio_wait_6
	note NOTE_DURATION_10, F_2, 17
	audio_wait_12
	note D#2
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_6
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_wait_6
	note NOTE_DURATION_10, G_2, 17
	audio_wait_12
	note D#2
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#2
	audio_wait_12
	note F_2
	audio_wait_6
	audio_wait_6
	note G_2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note D#3
	audio_wait_6
	audio_wait_6
	note C_3
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note D#3
	audio_wait_6
	audio_wait_6
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#3
	audio_wait_6
	audio_wait_6
	note A#2
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#3
	audio_wait_6
	audio_wait_6
	note A#2
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_12
	note C_3
	audio_wait_6
	audio_wait_6
	note A_2
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note F_1
	audio_wait_12
	note G_1
	audio_wait_6
	audio_wait_6
	note A_1
	audio_wait_12
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D_3
	audio_wait_12
	note A#2
	audio_wait_6
	audio_wait_6
	note F_2
	audio_wait_12
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D_3
	audio_wait_12
	note A#2
	audio_wait_6
	audio_wait_6
	note F_2
	audio_wait_12
	note B_1
	audio_wait_12
	note F#2
	audio_wait_12
	note B_2
	audio_wait_12
	note D#3
	audio_wait_12
	note B_2
	audio_wait_6
	audio_wait_6
	note F#2
	audio_wait_12
	note B_2
	audio_wait_12
	note F#3
	audio_wait_12
	note B_3
	audio_wait_12
	note D#4
	audio_wait_12
	note B_3
	audio_wait_6
	audio_wait_6
	note F#3
	audio_wait_12
	note A#1
	audio_wait_12
	note F#2
	audio_wait_12
	note A#2
	audio_wait_12
	note C#3
	audio_wait_12
	note A#2
	audio_wait_6
	audio_wait_6
	note F#2
	audio_wait_12
	note A#2
	audio_wait_12
	note F#3
	audio_wait_12
	note A#3
	audio_wait_12
	note C#4
	audio_wait_12
	note A#3
	audio_wait_6
	audio_wait_6
	note F#3
	audio_wait_12
	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note F#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_6
	audio_wait_6
	note D#3
	audio_wait_12
	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note F#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_6
	audio_wait_6
	note D#3
	audio_wait_12
	note C#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_12
	note F_3
	audio_wait_12
	note G#3
	audio_wait_6
	audio_wait_18
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D_3
	audio_wait_12
	note F_3
	audio_wait_6
	audio_wait_6
	note A#3
	audio_wait_12
	note D#2
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_6
.sub3
	audio_wait_6
	note NOTE_DURATION_10, G_2, 17
	audio_wait_12
	note D#2
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_6
	audio_ret

.sub4
	audio_wait_6
	note NOTE_DURATION_10, G_2, 17
	audio_wait_12
	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note G#2
	audio_wait_6
	audio_ret

.sub5
	audio_wait_6
	note NOTE_DURATION_10, D#2, 17
	audio_wait_12
	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note G#2
	audio_wait_6
	audio_ret

	audio_wait_6
	note G#1
	audio_wait_12
	note D#2
	audio_wait_12
	note G_2
	audio_wait_12
	note A#2
	audio_wait_12
	note D#3
	audio_wait_12
	note A#2
	audio_wait_6
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_wait_6
	note NOTE_DURATION_10, D#2, 17
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_6
	audio_wait_6
	note A_2
	audio_wait_12
	note A#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#2
	audio_wait_12
	note D_3
	audio_wait_12
	note G#2
	audio_wait_6
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_wait_4
	audio_end

Music_AboveTheCloudsNight:
	db $3, $2
	dw Music_AboveTheCloudsNight_Ch1
	dw Music_AboveTheCloudsNight_Ch2
	dw Music_AboveTheCloudsNight_Ch3

; unused?
	dw Music_AboveTheCloudsNight_Ch1.loop
	dw Music_AboveTheCloudsNight_Ch2.loop
	dw Music_AboveTheCloudsNight_Ch3.loop

	dw Music_AboveTheCloudsNight_Ch1.end
	dw Music_AboveTheCloudsNight_Ch2.end
	dw Music_AboveTheCloudsNight_Ch3.end
 