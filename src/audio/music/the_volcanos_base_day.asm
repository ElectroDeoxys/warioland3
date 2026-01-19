Music_TheVolcanosBaseDay_Ch1:
	semitone_offset 0

.loop
	tempo 40
	wave WAVE_55
	volume 85
	note NOTE_DURATION_3, C_2, 23
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, B_1
	audio_wait 12
	note G_1
	audio_wait 12
	note C_2
	audio_wait 48
	audio_wait 96
.sub1
	note NOTE_DURATION_3, C_2, 23
	audio_wait 6
	note D_2
	audio_wait 6
	note E_2
	audio_wait 6
	note G_2
	audio_wait 6
	note F#2
	audio_wait 12
	note D_2
	audio_wait 12
	note C_2
	audio_wait 48
	audio_ret

	audio_wait 96
	note C_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note C_3
	audio_wait 48
	audio_wait 96
.sub2
	note NOTE_DURATION_3, C_3, 23
	audio_wait 6
	note D_3
	audio_wait 6
	note E_3
	audio_wait 6
	note G_3
	audio_wait 6
	note F#3
	audio_wait 12
	note G_3
	audio_wait 12
	note C_4
	audio_wait 48
	audio_ret

	audio_wait 96
.sub3
	note NOTE_DURATION_3, B_2, 23
	audio_wait 12
	note C_3
	audio_wait 12
	note A_2
	audio_wait 12
	note F_2
	audio_wait 12
	note C_3
	audio_wait 48
	audio_ret

	audio_wait 48
	note B_3
	audio_wait 6
	note C_4
	audio_wait 6
	note B_3
	audio_wait 6
	note C_4
	audio_wait 6
	note A_3
	audio_wait 12
	note F_3
	audio_wait 12
	note F#3
	audio_wait 12
	note G_3
	audio_wait 12
	note E_3
	audio_wait 12
	note C_3
	audio_wait 12
	note G_3
	audio_wait 48
	audio_wait 48
	note F#2
	audio_wait 6
	note G_2
	audio_wait 6
	note F#2
	audio_wait 6
	note G_2
	audio_wait 6
	note E_2
	audio_wait 12
	note C_2
	audio_wait 12
	audio_call .sub3
	audio_wait 24
	note NOTE_DURATION_3, D_2, 23
	audio_wait 6
	note C#2
	audio_wait 6
	note D_2
	audio_wait 6
	note F#2
	audio_wait 6
	note A_2
	audio_wait 12
	note C_3
	audio_wait 12
	note B_2
	audio_wait 12
	note A_2
	audio_wait 12
	note G_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, F_2
	audio_wait 12
	note D_2
	audio_wait 12
	note G_2
	audio_wait 6
	note G_3
	audio_wait 6
	note G_2
	audio_wait 12
	note F_2
	audio_wait 12
	note D_2
	audio_wait 12
	note G_2
	audio_wait 96
	note C_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, B_1
	audio_wait 12
	note G_1
	audio_wait 12
	note C_2
	audio_wait 48
	audio_wait 96
	audio_call .sub1
	audio_wait 96
	note NOTE_DURATION_3, C_3, 23
	audio_wait 6
	note C_4
	audio_wait 6
	note C_3
	audio_wait 6
	note C_4
	audio_wait 6
	note B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note C_3
	audio_wait 48
	audio_wait 96
	audio_call .sub2
	audio_wait 96
	audio_jump .loop
.end
	audio_end

Music_TheVolcanosBaseDay_Ch2:
	semitone_offset 0

.loop
	wave WAVE_10
	volume 66
	audio_wait 9
	note NOTE_DURATION_3, C_2, 18
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, B_1
	audio_wait 12
	note G_1
	audio_wait 12
	note C_2
	audio_wait 36
	audio_wait 3
	audio_wait 96
.sub1
	audio_wait 9
	note NOTE_DURATION_3, C_2, 18
	audio_wait 6
	note D_2
	audio_wait 6
	note E_2
	audio_wait 6
	note G_2
	audio_wait 6
	note F#2
	audio_wait 12
	note D_2
	audio_wait 12
	note C_2
	audio_wait 36
	audio_wait 3
	audio_ret

	audio_wait 96
	audio_wait 9
	note C_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note C_3
	audio_wait 36
	audio_wait 3
	audio_wait 96
.sub2
	audio_wait 9
	note NOTE_DURATION_3, C_3, 18
	audio_wait 6
	note D_3
	audio_wait 6
	note E_3
	audio_wait 6
	note G_3
	audio_wait 6
	note F#3
	audio_wait 12
	note G_3
	audio_wait 12
	note C_4
	audio_wait 36
	audio_wait 3
	audio_ret

	audio_wait 96
.sub3
	audio_wait 9
	note NOTE_DURATION_3, B_2, 18
	audio_wait 12
	note C_3
	audio_wait 12
	note A_2
	audio_wait 12
	note F_2
	audio_wait 12
	note C_3
	audio_wait 36
	audio_wait 3
	audio_ret

	audio_wait 56
	audio_wait 1
	note B_3
	audio_wait 6
	note C_4
	audio_wait 6
	note B_3
	audio_wait 6
	note C_4
	audio_wait 6
	note A_3
	audio_wait 12
	note F_3
	audio_wait 3
	audio_wait 9
	note F#3
	audio_wait 12
	note G_3
	audio_wait 12
	note E_3
	audio_wait 12
	note C_3
	audio_wait 12
	note G_3
	audio_wait 36
	audio_wait 3
	audio_wait 56
	audio_wait 1
	note F#2
	audio_wait 6
	note G_2
	audio_wait 6
	note F#2
	audio_wait 6
	note G_2
	audio_wait 6
	note E_2
	audio_wait 12
	note C_2
	audio_wait 3
	audio_call .sub3
	audio_wait 32
	audio_wait 1
	note NOTE_DURATION_3, D_2, 18
	audio_wait 6
	note C#2
	audio_wait 6
	note D_2
	audio_wait 6
	note F#2
	audio_wait 6
	note A_2
	audio_wait 12
	note C_3
	audio_wait 12
	note B_2
	audio_wait 12
	note A_2
	audio_wait 3
	audio_wait 9
	note G_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, F_2
	audio_wait 12
	note D_2
	audio_wait 12
	note G_2
	audio_wait 6
	note G_3
	audio_wait 6
	note G_2
	audio_wait 12
	note F_2
	audio_wait 12
	note D_2
	audio_wait 3
	audio_wait 9
	note G_2
	audio_wait 84
	audio_wait 3
	audio_wait 9
	note C_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, B_1
	audio_wait 12
	note G_1
	audio_wait 12
	note C_2
	audio_wait 36
	audio_wait 3
	audio_wait 96
	audio_call .sub1
	audio_wait 96
	audio_wait 9
	note NOTE_DURATION_3, C_3, 18
	audio_wait 6
	note C_4
	audio_wait 6
	note C_3
	audio_wait 6
	note C_4
	audio_wait 6
	note B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note C_3
	audio_wait 36
	audio_wait 3
	audio_wait 96
	audio_call .sub2
	audio_wait 96
	audio_jump .loop
.end
	audio_end

Music_TheVolcanosBaseDay_Ch3:
	semitone_offset 0

.loop
	wave WAVE_28
	volume 85
	note NOTE_DURATION_3, C_0, 23
	audio_wait 24
	note D_0
	audio_wait 24
	note C_0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, D_0
	audio_wait 24
.sub1
	note NOTE_DURATION_3, C_0, 23
	audio_wait 24
	note D_0
	audio_wait 24
	note C_0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, D_0
	audio_wait 24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
.sub2
	note NOTE_DURATION_3, C_0, 23
	audio_wait 24
	note D_0
	audio_wait 24
	note C_0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, D_0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
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
