Music_OverworldNight_Ch1:
	semitone_offset 0

.loop
	tempo 50
	wave WAVE_52
	volume 85
	audio_wait_12
	note NOTE_DURATION_3, A_2, 21
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_12
	note A_3
	audio_wait_48
	audio_wait_12
	note B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note G_3
	audio_wait_12
	note B_3
	audio_wait_48
.sub1
	audio_wait_12
	note NOTE_DURATION_3, G_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

.sub2
	audio_wait_12
	note NOTE_DURATION_3, E_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

.sub3
	audio_wait_12
	note NOTE_DURATION_3, A_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_call .sub1
	audio_call .sub2
	audio_wait_12
	note NOTE_DURATION_3, A_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub1
	audio_wait_12
	note NOTE_DURATION_3, D#3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_wait_12
	note NOTE_DURATION_3, F_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_call .sub1
	audio_wait_12
	note NOTE_DURATION_3, F_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_wait_12
	note NOTE_DURATION_3, G#3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_jump .loop
.end
	wave WAVE_52
	volume 85
	audio_wait_12
	note NOTE_DURATION_3, A_2, 21
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_12
	note A_3
	audio_wait_3
	audio_end

Music_OverworldNight_Ch2:
	semitone_offset 0

.loop
	wave WAVE_48
	volume 85
	audio_wait_12
	note NOTE_DURATION_3, F_2, 21
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_48
	audio_wait_12
	note G_2
	audio_wait_12
	note B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note G_3
	audio_wait_48
.sub1
	audio_wait_12
	note NOTE_DURATION_3, E_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

.sub2
	audio_wait_12
	note NOTE_DURATION_3, C_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

.sub3
	audio_wait_12
	note NOTE_DURATION_3, F_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_call .sub1
	audio_call .sub2
	audio_wait_12
	note NOTE_DURATION_3, F_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub1
	audio_call .sub2
	audio_wait_12
	note NOTE_DURATION_3, D_3, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_wait_12
	note NOTE_DURATION_3, D#3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_48
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub3
	audio_jump .loop
.end
	wave WAVE_48
	volume 85
	audio_wait_12
	note NOTE_DURATION_3, F_2, 21
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note F_3
	audio_wait_3
	audio_end

Music_OverworldNight_Ch3:
	semitone_offset 0

.loop
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, G_1, 21
	audio_wait_12
	note C_2
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_48
	note G_1
	audio_wait_12
	note D_2
	audio_wait_12
	note G_2
	audio_wait_12
	note B_2
	audio_wait_12
	note D_3
	audio_wait_48
.sub1
	note NOTE_DURATION_3, C_2, 21
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_48
	audio_ret

.sub2
	note NOTE_DURATION_3, A_1, 21
	audio_wait_12
	note B_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_2
	audio_wait_48
	audio_ret

	note D_1
	audio_wait_12
	note E_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_48
	note G_1
	audio_wait_12
	note A_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_2
	audio_wait_36
	note NOTE_DURATION_6, A_1
	audio_wait_6
	note B_1
	audio_wait_6
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, D_1, 21
	audio_wait_12
	note E_3
	audio_wait_12
	note D_3
	audio_wait_24
	note G_1
	audio_wait_12
	note A_2
	audio_wait_12
	note G_2
	audio_wait_24
	note C_2
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_36
	note NOTE_DURATION_6, C_2
	audio_wait_6
	note A#1
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_12
	note A#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#2
	audio_wait_36
	note G#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#2
	audio_wait_36
	note G#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_36
	note G#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_12
	note A#2
	audio_wait_24
	note G_1
	audio_wait_12
	note C_3
	audio_wait_12
	note B_2
	audio_wait_24
	note C_2
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_36
	note NOTE_DURATION_6, C_2
	audio_wait_6
	note B_1
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note B_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_2
	audio_wait_36
	note A_1
	audio_wait_12
	note D_1
	audio_wait_12
	note E_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_36
	note D_1
	audio_wait_12
	note C#1
	audio_wait_12
	note D#3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C#3
	audio_wait_36
	note C#1
	audio_wait_12
	audio_jump .loop
.end
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, G_1, 21
	audio_wait_12
	note C_2
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_3
	audio_end

Music_OverworldNight:
	db 3, 2
	dw Music_OverworldNight_Ch1
	dw Music_OverworldNight_Ch2
	dw Music_OverworldNight_Ch3

; unused?
	dw Music_OverworldNight_Ch1.loop
	dw Music_OverworldNight_Ch2.loop
	dw Music_OverworldNight_Ch3.loop

	dw Music_OverworldNight_Ch1.end
	dw Music_OverworldNight_Ch2.end
	dw Music_OverworldNight_Ch3.end
