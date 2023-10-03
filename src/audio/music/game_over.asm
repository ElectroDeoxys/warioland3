Music_GameOver_Ch1:
	semitone_offset 0

.loop
	tempo 40
	wave WAVE_60
	volume 75
	audio_wait_9
	note NOTE_DURATION_3, C_1, 19
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_3
.sub1
	audio_wait_9
	note NOTE_DURATION_3, B_0, 19
	audio_wait_12
	note F#1
	audio_wait_12
	note D#2
	audio_wait_12
	note F#1
	audio_wait_12
	note B_0
	audio_wait_12
	note F#1
	audio_wait_12
	note D#2
	audio_wait_12
	note F#1
	audio_wait_3
	audio_ret

.sub2
	audio_wait_9
	note NOTE_DURATION_3, C_1, 19
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_3
	audio_ret

.sub3
	audio_wait_9
	note NOTE_DURATION_3, C#1, 19
	audio_wait_12
	note G#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#1
	audio_wait_12
	note C#1
	audio_wait_12
	note G#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#1
	audio_wait_3
	audio_ret

	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
.sub4
	audio_wait_9
	note NOTE_DURATION_3, D_1, 19
	audio_wait_12
	note A_1
	audio_wait_12
	note F#2
	audio_wait_12
	note A_1
	audio_wait_12
	note D_1
	audio_wait_12
	note A_1
	audio_wait_12
	note F#2
	audio_wait_12
	note A_1
	audio_wait_3
	audio_ret

.sub5
	audio_wait_9
	note NOTE_DURATION_3, D#1, 19
	audio_wait_12
	note A#1
	audio_wait_12
	note G_2
	audio_wait_12
	note A#1
	audio_wait_12
	note D#1
	audio_wait_12
	note A#1
	audio_wait_12
	note G_2
	audio_wait_12
	note A#1
	audio_wait_3
	audio_ret

	audio_call .sub4
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub4
	audio_call .sub3
	audio_jump .loop
.end
	audio_end

Music_GameOver_Ch2:
	semitone_offset 0

.loop
	wave WAVE_4B
	volume 75
	audio_wait_24
	note NOTE_DURATION_3, B_1, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
.sub1
	audio_wait_24
	note NOTE_DURATION_3, A#1, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub2
	audio_wait_24
	note NOTE_DURATION_3, B_1, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub3
	audio_wait_24
	note NOTE_DURATION_3, C_2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
.sub4
	audio_wait_24
	note NOTE_DURATION_3, C#2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub5
	audio_wait_24
	note NOTE_DURATION_3, D_2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub4
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub4
	audio_call .sub3
	audio_jump .loop
.end
	audio_end

Music_GameOver_Ch3:
	semitone_offset 0

.loop
	wave WAVE_55
	volume 75
	note NOTE_DURATION_3, C_1, 19
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_12
.sub1
	note NOTE_DURATION_3, B_0, 19
	audio_wait_12
	note F#1
	audio_wait_12
	note D#2
	audio_wait_12
	note F#1
	audio_wait_12
	note B_0
	audio_wait_12
	note F#1
	audio_wait_12
	note D#2
	audio_wait_12
	note F#1
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_3, C_1, 19
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note E_2
	audio_wait_12
	note G_1
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_3, C#1, 19
	audio_wait_12
	note G#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#1
	audio_wait_12
	note C#1
	audio_wait_12
	note G#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#1
	audio_wait_12
	audio_ret

	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
.sub4
	note NOTE_DURATION_3, D_1, 19
	audio_wait_12
	note A_1
	audio_wait_12
	note F#2
	audio_wait_12
	note A_1
	audio_wait_12
	note D_1
	audio_wait_12
	note A_1
	audio_wait_12
	note F#2
	audio_wait_12
	note A_1
	audio_wait_12
	audio_ret

.sub5
	note NOTE_DURATION_3, D#1, 19
	audio_wait_12
	note A#1
	audio_wait_12
	note G_2
	audio_wait_12
	note A#1
	audio_wait_12
	note D#1
	audio_wait_12
	note A#1
	audio_wait_12
	note G_2
	audio_wait_12
	note A#1
	audio_wait_12
	audio_ret

	audio_call .sub4
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub4
	audio_call .sub3
	audio_jump .loop
.end
	audio_end

Music_GameOver:
	db 3, 2
	dw Music_GameOver_Ch1
	dw Music_GameOver_Ch2
	dw Music_GameOver_Ch3

; unused?
	dw Music_GameOver_Ch1.loop
	dw Music_GameOver_Ch2.loop
	dw Music_GameOver_Ch3.loop

	dw Music_GameOver_Ch1.end
	dw Music_GameOver_Ch2.end
	dw Music_GameOver_Ch3.end
