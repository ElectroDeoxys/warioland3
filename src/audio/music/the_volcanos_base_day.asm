Music_TheVolcanosBaseDay_Ch1:
	semitone_offset 0

.loop
	tempo 40
	wave WAVE_55
	volume 85
	note NOTE_DURATION_3, C_2, 23
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C_2
	audio_wait_48
	audio_wait_96
.sub1
	note NOTE_DURATION_3, C_2, 23
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note G_2
	audio_wait_6
	note F#2
	audio_wait_12
	note D_2
	audio_wait_12
	note C_2
	audio_wait_48
	audio_ret

	audio_wait_96
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_48
	audio_wait_96
.sub2
	note NOTE_DURATION_3, C_3, 23
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_6
	note G_3
	audio_wait_6
	note F#3
	audio_wait_12
	note G_3
	audio_wait_12
	note C_4
	audio_wait_48
	audio_ret

	audio_wait_96
.sub3
	note NOTE_DURATION_3, B_2, 23
	audio_wait_12
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note F_2
	audio_wait_12
	note C_3
	audio_wait_48
	audio_ret

	audio_wait_48
	note B_3
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note C_4
	audio_wait_6
	note A_3
	audio_wait_12
	note F_3
	audio_wait_12
	note F#3
	audio_wait_12
	note G_3
	audio_wait_12
	note E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_3
	audio_wait_48
	audio_wait_48
	note F#2
	audio_wait_6
	note G_2
	audio_wait_6
	note F#2
	audio_wait_6
	note G_2
	audio_wait_6
	note E_2
	audio_wait_12
	note C_2
	audio_wait_12
	audio_call .sub3
	audio_wait_24
	note NOTE_DURATION_3, D_2, 23
	audio_wait_6
	note C#2
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note B_2
	audio_wait_12
	note A_2
	audio_wait_12
	note G_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note D_2
	audio_wait_12
	note G_2
	audio_wait_6
	note G_3
	audio_wait_6
	note G_2
	audio_wait_12
	note F_2
	audio_wait_12
	note D_2
	audio_wait_12
	note G_2
	audio_wait_96
	note C_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C_2
	audio_wait_48
	audio_wait_96
	audio_call .sub1
	audio_wait_96
	note NOTE_DURATION_3, C_3, 23
	audio_wait_6
	note C_4
	audio_wait_6
	note C_3
	audio_wait_6
	note C_4
	audio_wait_6
	note B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_48
	audio_wait_96
	audio_call .sub2
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_TheVolcanosBaseDay_Ch2:
	semitone_offset 0

.loop
	wave WAVE_10
	volume 66
	audio_wait_9
	note NOTE_DURATION_3, C_2, 18
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C_2
	audio_wait_36
	audio_wait_3
	audio_wait_96
.sub1
	audio_wait_9
	note NOTE_DURATION_3, C_2, 18
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note G_2
	audio_wait_6
	note F#2
	audio_wait_12
	note D_2
	audio_wait_12
	note C_2
	audio_wait_36
	audio_wait_3
	audio_ret

	audio_wait_96
	audio_wait_9
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_36
	audio_wait_3
	audio_wait_96
.sub2
	audio_wait_9
	note NOTE_DURATION_3, C_3, 18
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_6
	note G_3
	audio_wait_6
	note F#3
	audio_wait_12
	note G_3
	audio_wait_12
	note C_4
	audio_wait_36
	audio_wait_3
	audio_ret

	audio_wait_96
.sub3
	audio_wait_9
	note NOTE_DURATION_3, B_2, 18
	audio_wait_12
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note F_2
	audio_wait_12
	note C_3
	audio_wait_36
	audio_wait_3
	audio_ret

	audio_wait_56
	audio_wait_1
	note B_3
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note C_4
	audio_wait_6
	note A_3
	audio_wait_12
	note F_3
	audio_wait_3
	audio_wait_9
	note F#3
	audio_wait_12
	note G_3
	audio_wait_12
	note E_3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_3
	audio_wait_36
	audio_wait_3
	audio_wait_56
	audio_wait_1
	note F#2
	audio_wait_6
	note G_2
	audio_wait_6
	note F#2
	audio_wait_6
	note G_2
	audio_wait_6
	note E_2
	audio_wait_12
	note C_2
	audio_wait_3
	audio_call .sub3
	audio_wait_32
	audio_wait_1
	note NOTE_DURATION_3, D_2, 18
	audio_wait_6
	note C#2
	audio_wait_6
	note D_2
	audio_wait_6
	note F#2
	audio_wait_6
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note B_2
	audio_wait_12
	note A_2
	audio_wait_3
	audio_wait_9
	note G_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note D_2
	audio_wait_12
	note G_2
	audio_wait_6
	note G_3
	audio_wait_6
	note G_2
	audio_wait_12
	note F_2
	audio_wait_12
	note D_2
	audio_wait_3
	audio_wait_9
	note G_2
	audio_wait_84
	audio_wait_3
	audio_wait_9
	note C_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C_2
	audio_wait_36
	audio_wait_3
	audio_wait_96
	audio_call .sub1
	audio_wait_96
	audio_wait_9
	note NOTE_DURATION_3, C_3, 18
	audio_wait_6
	note C_4
	audio_wait_6
	note C_3
	audio_wait_6
	note C_4
	audio_wait_6
	note B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_36
	audio_wait_3
	audio_wait_96
	audio_call .sub2
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_TheVolcanosBaseDay_Ch3:
	semitone_offset 0

.loop
	wave WAVE_28
	volume 85
	note NOTE_DURATION_3, C_0, 23
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
	note NOTE_DURATION_3, C_0, 23
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

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
.sub2
	note NOTE_DURATION_3, C_0, 23
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

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_jump .loop
.end
	audio_end

Music_TheVolcanosBaseDay:
	db $3, $2
	dw Music_TheVolcanosBaseDay_Ch1
	dw Music_TheVolcanosBaseDay_Ch2
	dw Music_TheVolcanosBaseDay_Ch3

; unused?
	dw Music_TheVolcanosBaseDay_Ch1.loop
	dw Music_TheVolcanosBaseDay_Ch2.loop
	dw Music_TheVolcanosBaseDay_Ch3.loop

	dw Music_TheVolcanosBaseDay_Ch1.end
	dw Music_TheVolcanosBaseDay_Ch2.end
	dw Music_TheVolcanosBaseDay_Ch3.end
