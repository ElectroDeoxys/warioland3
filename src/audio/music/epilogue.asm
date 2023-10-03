Music_Epilogue_Ch1:
	semitone_offset 0

.loop
	tempo 40
	wave WAVE_25
	volume 75
	note NOTE_DURATION_5, B_3, 19
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
.sub1
	note NOTE_DURATION_5, A_3, 19
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

.sub2
	note NOTE_DURATION_5, G_3, 19
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub1
.sub3
	note NOTE_DURATION_5, B_3, 19
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub2
.sub4
	note NOTE_DURATION_5, F#3, 19
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub3
	audio_call .sub1
	audio_call .sub2
	audio_call .sub4
.sub5
	note NOTE_DURATION_5, A#3, 19
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub5
	audio_call .sub5
	note NOTE_DURATION_5, C_4, 19
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_Epilogue_Ch2:
	semitone_offset 0

.loop
	wave WAVE_12
	volume 66
	note NOTE_DURATION_5, E_3, 17
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
.sub1
	note NOTE_DURATION_5, D_3, 17
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

.sub2
	note NOTE_DURATION_5, C_3, 17
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub1
.sub3
	note NOTE_DURATION_5, E_3, 17
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub2
.sub4
	note NOTE_DURATION_5, B_2, 17
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub3
	audio_call .sub1
	audio_call .sub2
	audio_call .sub4
.sub5
	note NOTE_DURATION_5, D#3, 17
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub5
	audio_call .sub3
	note NOTE_DURATION_5, F_3, 17
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5
	audio_wait_24
	note NOTE_DURATION_5, F#3
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_Epilogue_Ch3:
	semitone_offset 0

.loop
	wave WAVE_1C
	volume 66
	note NOTE_DURATION_24, C_2, 17
	audio_wait_84
	note NOTE_DURATION_6
	audio_wait_12
.sub1
	note NOTE_DURATION_24, B_1, 17
	audio_wait_84
	note NOTE_DURATION_6
	audio_wait_12
	audio_ret

	note NOTE_DURATION_24, A_1
	audio_wait_84
	note NOTE_DURATION_6
	audio_wait_12
	audio_call .sub1
.sub2
	note NOTE_DURATION_24, C_2, 17
	audio_wait_48
	note NOTE_DURATION_12, G_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_12, F#4
	audio_wait_12
	note NOTE_DURATION_2, D_4
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_24, B_1, 17
	audio_wait_48
	note NOTE_DURATION_12, G_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_12, F#4
	audio_wait_12
	note NOTE_DURATION_2, D_4
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_24, A_1, 17
	audio_wait_48
	note NOTE_DURATION_18, G_4
	audio_wait_18
	note NOTE_DURATION_6, A_4
	audio_wait_6
	note NOTE_DURATION_12, B_4
	audio_wait_12
	note NOTE_DURATION_2, D_5
	audio_wait_12
	audio_ret

.sub5
	note NOTE_DURATION_24, G_1, 17
	audio_wait_48
	note NOTE_DURATION_18, A_4
	audio_wait_18
	note NOTE_DURATION_6, B_4
	audio_wait_6
	note NOTE_DURATION_12, A_4
	audio_wait_12
	note NOTE_DURATION_2, F#4
	audio_wait_12
	audio_ret

	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	note NOTE_DURATION_24, C_2, 17
	audio_wait_48
	note NOTE_DURATION_12, G_3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_12, F_3
	audio_wait_12
	note D_3
	audio_wait_12
	note G_3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_12, F_3
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_24, G_3
	audio_wait_36
	note NOTE_DURATION_12, D_2
	audio_wait_12
	note NOTE_DURATION_24, C_2
	audio_wait_48
	note NOTE_DURATION_18, G_3
	audio_wait_18
	note NOTE_DURATION_6, A_3
	audio_wait_6
	note NOTE_DURATION_12, A#3
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_18, C_4
	audio_wait_18
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_12, C_4
	audio_wait_12
	note A#3
	audio_wait_12
	note NOTE_DURATION_10, A_3
	audio_wait_36
	note NOTE_DURATION_12, D_2
	audio_wait_12
	note NOTE_DURATION_24, D#2
	audio_wait_48
	note NOTE_DURATION_12, G_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_12, F_4
	audio_wait_12
	note NOTE_DURATION_2, D_4
	audio_wait_12
	note NOTE_DURATION_24, E_2
	audio_wait_48
	note NOTE_DURATION_12, G_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_12, A_4
	audio_wait_12
	note NOTE_DURATION_2, A#4
	audio_wait_12
	note NOTE_DURATION_24, F_2
	audio_wait_48
	note NOTE_DURATION_12, A_4
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_12, G_4
	audio_wait_12
	note A_4
	audio_wait_12
	note D_5
	audio_wait_24
	note D_4
	audio_wait_24
	note D_3
	audio_wait_24
	note D_2
	audio_wait_24
	audio_jump .loop
.end
	audio_end

Music_Epilogue:
	db 3, 2
	dw Music_Epilogue_Ch1
	dw Music_Epilogue_Ch2
	dw Music_Epilogue_Ch3

; unused?
	dw Music_Epilogue_Ch1.loop
	dw Music_Epilogue_Ch2.loop
	dw Music_Epilogue_Ch3.loop

	dw Music_Epilogue_Ch1.end
	dw Music_Epilogue_Ch2.end
	dw Music_Epilogue_Ch3.end
