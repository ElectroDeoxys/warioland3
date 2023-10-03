Music_AboveTheCloudsDay_Ch1:
	semitone_offset 0

.loop
	tempo 80
	wave WAVE_1A
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 20
	vibrato_disabled FALSE
	volume 75
	audio_wait_72
	audio_wait_72
	audio_wait_72
	audio_wait_72
.sub1
	wave WAVE_1A
	note NOTE_DURATION_24, D_3, 17
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C_3
	audio_wait_12
	note A_2
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_5, D_3, 17
	audio_wait_24
	note C_3
	audio_wait_24
	note A_2
	audio_wait_24
	audio_ret

	note D_3
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_36
	audio_wait_36
	note NOTE_DURATION_12, E_3
	audio_wait_12
	note F#3
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_5, G_3
	audio_wait_24
	note E_3
	audio_wait_24
	note NOTE_DURATION_12, C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_5, D_3
	audio_wait_72
	audio_wait_72
.sub3
	wave WAVE_1A
	note NOTE_DURATION_24, D_4, 17
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note A_3
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_5, D_4, 17
	audio_wait_24
	note C_4
	audio_wait_24
	note A_3
	audio_wait_24
	audio_ret

	note D_4
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_36
	audio_wait_36
	note NOTE_DURATION_12, E_4
	audio_wait_12
	note F#4
	audio_wait_12
	note A_4
	audio_wait_12
	note NOTE_DURATION_5, G_4
	audio_wait_24
	note E_4
	audio_wait_24
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_5, D_4
	audio_wait_72
	audio_wait_72
.sub5
	wave WAVE_14
	note NOTE_DURATION_24, D_4, 17
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, B_3
	audio_wait_12
	note G_3
	audio_wait_12
	audio_ret

.sub6
	note NOTE_DURATION_12, D_4, 17
	audio_wait_12
	note C#4
	audio_wait_12
	note NOTE_DURATION_5, D_4
	audio_wait_48
	audio_ret

	note NOTE_DURATION_24
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, A_3
	audio_wait_12
	note F#3
	audio_wait_12
	audio_call .sub6
	note NOTE_DURATION_24, D_4, 17
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, B_3
	audio_wait_12
	note G#3
	audio_wait_12
	note E_3
	audio_wait_12
	note G#3
	audio_wait_12
	note NOTE_DURATION_5, B_3
	audio_wait_24
	note NOTE_DURATION_12, D_4
	audio_wait_12
	note F#4
	audio_wait_12
	note NOTE_DURATION_48, E_4
	audio_wait_72
	note A_4
	audio_wait_72
	note NOTE_DURATION_24, F_4
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, D_4
	audio_wait_12
	note A#3
	audio_wait_12
	note NOTE_DURATION_5, F_4
	audio_wait_72
	note NOTE_DURATION_24
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note A_3
	audio_wait_12
	note NOTE_DURATION_5, F_4
	audio_wait_72
	note NOTE_DURATION_36
	audio_wait_36
	note NOTE_DURATION_12, E_4
	audio_wait_12
	note D_4
	audio_wait_12
	note C#4
	audio_wait_12
	note NOTE_DURATION_24, D_4
	audio_wait_24
	note F_4
	audio_wait_24
	note A_4
	audio_wait_24
	note NOTE_DURATION_60, G_4
	audio_wait_60
	note NOTE_DURATION_6, F#4
	audio_wait_6
	note F_4
	audio_wait_6
	note NOTE_DURATION_72, E_4
	audio_wait_72
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	note NOTE_DURATION_5, D_4, 17
	audio_wait_24
	note B_3
	audio_wait_24
	note G_3
	audio_wait_24
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_24, D_3, 17
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note NOTE_DURATION_5, D_3
	audio_wait_48
	note NOTE_DURATION_12
	audio_wait_12
	note NOTE_DURATION_12, E_3
	audio_wait_12
	note NOTE_DURATION_36, F#3
	audio_wait_36
	note NOTE_DURATION_12, D_3
	audio_wait_12
	note B_2
	audio_wait_12
	note F#3
	audio_wait_12
	note NOTE_DURATION_36, E_3
	audio_wait_48
	note NOTE_DURATION_12, B_2
	audio_wait_12
	note C#3
	audio_wait_12
	note NOTE_DURATION_5, D_3
	audio_wait_48
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_5, C_3
	audio_wait_48
	note NOTE_DURATION_24, C_4
	audio_wait_24
	note NOTE_DURATION_5, D_4
	audio_wait_48
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_5, C_4
	audio_wait_72
	audio_jump .loop
.end
	wave WAVE_1A
	volume 75
	audio_wait_72
	audio_wait_72
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_24, D_3, 17
	audio_wait_24
	audio_end

Music_AboveTheCloudsDay_Ch2:
	semitone_offset 0

.loop
	wave WAVE_48
	volume 75
	audio_wait_24
	note NOTE_DURATION_2, F#1, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
.sub1
	audio_wait_24
	note NOTE_DURATION_2, G_1, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

.sub2
	audio_wait_24
	note NOTE_DURATION_2, F#1, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
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
	audio_wait_72
.sub3
	audio_wait_24
	note NOTE_DURATION_2, B_1, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub3
.sub4
	audio_wait_24
	note NOTE_DURATION_2, A_1, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub4
.sub5
	audio_wait_24
	note NOTE_DURATION_2, G#1, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub5
.sub6
	audio_wait_24
	note NOTE_DURATION_2, C#2, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub6
.sub7
	audio_wait_24
	note NOTE_DURATION_2, D_2, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub7
.sub8
	audio_wait_24
	note NOTE_DURATION_2, C_2, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub8
	audio_call .sub3
	audio_call .sub3
	audio_call .sub8
	audio_call .sub6
.sub9
	audio_wait_12
	note NOTE_DURATION_2, F#1, 19
	audio_wait_12
	note A_1
	audio_wait_12
	note D_2
	audio_wait_12
	note A_1
	audio_wait_24
	audio_ret

	audio_call .sub9
.sub10
	audio_wait_12
	note NOTE_DURATION_2, G_1, 19
	audio_wait_12
	note B_1
	audio_wait_12
	note D_2
	audio_wait_12
	note B_1
	audio_wait_24
	audio_ret

	audio_call .sub10
	audio_call .sub9
	audio_call .sub9
	audio_call .sub10
	audio_call .sub10
	audio_wait_12
	note NOTE_DURATION_2, G#1, 19
	audio_wait_12
	note B_1
	audio_wait_12
	note E_2
	audio_wait_12
	note B_1
	audio_wait_24
	audio_wait_12
	note A_1
	audio_wait_12
	note C#2
	audio_wait_12
	note A_1
	audio_wait_12
	note C#2
	audio_wait_24
.sub11
	audio_wait_12
	note NOTE_DURATION_2, F#1, 19
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, A_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, F#1
	audio_wait_12
	audio_ret

	audio_wait_12
	note E_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, G_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, E_1
	audio_wait_12
	audio_call .sub11
	audio_wait_12
	note NOTE_DURATION_2, E_1, 19
	audio_wait_12
	note G_1
	audio_wait_48
	audio_jump .loop
.end
	wave WAVE_48
	volume 75
	audio_wait_24
	note NOTE_DURATION_2, F#1, 19
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_2
	audio_end

Music_AboveTheCloudsDay_Ch3:
	semitone_offset 0

.loop
	wave WAVE_61
	volume 108
	note NOTE_DURATION_2, D_1, 22
	audio_wait_24
	note A_1
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
.sub1
	note NOTE_DURATION_2, A_0, 22
	audio_wait_24
	note C_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

.sub2
	note NOTE_DURATION_2, D_1, 22
	audio_wait_24
	note A_1
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
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
	note NOTE_DURATION_2, D_1, 22
	audio_wait_24
	note E_1
	audio_wait_24
	note F#1
	audio_wait_24
.sub3
	note NOTE_DURATION_2, G_1, 22
	audio_wait_24
	note D_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub3
.sub4
	note NOTE_DURATION_2, F#1, 22
	audio_wait_24
	note D_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub4
.sub5
	note NOTE_DURATION_2, E_1, 22
	audio_wait_24
	note D_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub5
.sub6
	note NOTE_DURATION_2, A_0, 22
	audio_wait_24
	note E_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub6
	note NOTE_DURATION_2, A#0, 22
	audio_wait_24
	note F_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	note NOTE_DURATION_2, A#1
	audio_wait_24
	note F_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	note NOTE_DURATION_2, A_1
	audio_wait_24
	note F_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	note NOTE_DURATION_2, A_0
	audio_wait_24
	note F_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
.sub7
	note NOTE_DURATION_2, G_0, 22
	audio_wait_24
	note F_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_ret

	audio_call .sub7
	note NOTE_DURATION_2, C_1, 22
	audio_wait_24
	note E_2
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_24
	audio_call .sub6
.sub8
	note NOTE_DURATION_2, D_1, 22
	audio_wait_12
	note A_1
	audio_wait_12
	note D_2
	audio_wait_12
	note F#2
	audio_wait_12
	note D_2
	audio_wait_24
	audio_ret

	audio_call .sub8
.sub9
	note NOTE_DURATION_2, G_0, 22
	audio_wait_12
	note B_1
	audio_wait_12
	note D_2
	audio_wait_12
	note G_2
	audio_wait_12
	note D_2
	audio_wait_24
	audio_ret

	audio_call .sub9
	audio_call .sub8
	audio_call .sub8
	audio_call .sub9
	audio_call .sub9
	note NOTE_DURATION_2, E_0, 22
	audio_wait_12
	note B_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G#2
	audio_wait_12
	note E_2
	audio_wait_24
	note A_0
	audio_wait_12
	note C#2
	audio_wait_12
	note E_2
	audio_wait_12
	note C#2
	audio_wait_12
	note E_2
	audio_wait_24
.sub10
	note NOTE_DURATION_2, D_1, 22
	audio_wait_12
	note A_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, D_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, A_1
	audio_wait_12
	audio_ret

	note A_0
	audio_wait_12
	note G_1
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, C_2
	audio_wait_12
	note NOTE_DURATION_2
	audio_wait_12
	note NOTE_DURATION_2, G_1
	audio_wait_12
	audio_call .sub10
	note NOTE_DURATION_2, A_0, 22
	audio_wait_12
	note G_1
	audio_wait_12
	note C_2
	audio_wait_48
	audio_jump .loop
.end
	wave WAVE_61
	volume 108
	note NOTE_DURATION_2, D_1, 22
	audio_wait_24
	note A_1
	audio_wait_24
	note NOTE_DURATION_2
	audio_wait_2
	audio_end

Music_AboveTheCloudsDay:
	db $3, $2
	dw Music_AboveTheCloudsDay_Ch1
	dw Music_AboveTheCloudsDay_Ch2
	dw Music_AboveTheCloudsDay_Ch3

; unused?
	dw Music_AboveTheCloudsDay_Ch1.loop
	dw Music_AboveTheCloudsDay_Ch2.loop
	dw Music_AboveTheCloudsDay_Ch3.loop

	dw Music_AboveTheCloudsDay_Ch1.end
	dw Music_AboveTheCloudsDay_Ch2.end
	dw Music_AboveTheCloudsDay_Ch3.end
