Music_TheVastPlainNight_Ch1:
	semitone_offset 0

.loop
	tempo 40
	wave WAVE_1C
	volume 66
	audio_wait 96
	audio_wait 96
	note NOTE_DURATION_3, C_4, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, A#3
	audio_wait 24
	note G_3
	audio_wait 24
	note C_4
	audio_wait 12
	audio_wait 96
.sub1
	note NOTE_DURATION_3, C_4, 19
	audio_wait 12
	note E_4
	audio_wait 12
	note G_4
	audio_wait 12
	note F_4
	audio_wait 24
	note D_4
	audio_wait 24
	note C_4
	audio_wait 12
	audio_ret

	audio_wait 96
	note C_5
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, A#4
	audio_wait 24
	note G_4
	audio_wait 24
	note C_5
	audio_wait 12
	audio_wait 96
	audio_call .sub1
	audio_wait 96
.sub2
	note NOTE_DURATION_3, C_5, 19
	audio_wait 12
	note A_4
	audio_wait 12
	note F_4
	audio_wait 12
	note C_5
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 36
	audio_ret

	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#4
	audio_wait 12
	note F_4
	audio_wait 12
	note C_5
	audio_wait 60
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note G_4
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 36
	note NOTE_DURATION_3, F#4
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note G_4
	audio_wait 60
	audio_call .sub2
	note NOTE_DURATION_3, D_4, 19
	audio_wait 12
	note F#4
	audio_wait 12
	note A_4
	audio_wait 12
	note C_5
	audio_wait 24
	note B_4
	audio_wait 24
	note A_4
	audio_wait 12
	note G_4
	audio_wait 12
	note F_4
	audio_wait 12
	note D_4
	audio_wait 12
	note G_4
	audio_wait 24
	note F_4
	audio_wait 24
	note D_4
	audio_wait 12
	note G_4
	audio_wait 96
	audio_jump .loop
.end
	wave WAVE_1C
	volume 85
	audio_wait 96
	audio_wait 96
	note NOTE_DURATION_3, C_4, 19
	audio_wait 3
	audio_end

Music_TheVastPlainNight_Ch2:
	semitone_offset 0

.loop
	wave WAVE_12
	volume 66
	audio_wait 96
	audio_wait 96
	note NOTE_DURATION_3, E_3, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, D_3
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 24
	note NOTE_DURATION_3, E_3
	audio_wait 12
	audio_wait 96
.sub1
	note NOTE_DURATION_3, E_3, 19
	audio_wait 12
	note C_4
	audio_wait 12
	note E_4
	audio_wait 12
	note D_4
	audio_wait 24
	note A#3
	audio_wait 24
	note E_3
	audio_wait 12
	audio_ret

	audio_wait 96
	note E_4
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, D_4
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 24
	note NOTE_DURATION_3, E_4
	audio_wait 12
	audio_wait 96
	audio_call .sub1
	audio_wait 96
.sub2
	note NOTE_DURATION_3, A_4, 19
	audio_wait 12
	note F_4
	audio_wait 12
	note C_4
	audio_wait 12
	note A_4
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 36
	audio_ret

	note NOTE_DURATION_3, G#4
	audio_wait 12
	note F_4
	audio_wait 12
	note C_4
	audio_wait 12
	note G#4
	audio_wait 60
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note G_3
	audio_wait 12
	note E_4
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 36
	note NOTE_DURATION_3, D#4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note E_4
	audio_wait 60
	audio_call .sub2
	note NOTE_DURATION_3, A_3, 19
	audio_wait 12
	note D_4
	audio_wait 12
	note F#4
	audio_wait 12
	note A_4
	audio_wait 24
	note G_4
	audio_wait 24
	note F#4
	audio_wait 12
	note B_3
	audio_wait 12
	note A_3
	audio_wait 12
	note F_3
	audio_wait 12
	note B_3
	audio_wait 24
	note A_3
	audio_wait 24
	note F_3
	audio_wait 12
	note B_3
	audio_wait 96
	audio_jump .loop
.end
	wave WAVE_12
	volume 85
	audio_wait 96
	audio_wait 96
	note NOTE_DURATION_3, E_3, 19
	audio_wait 3
	audio_end

Music_TheVastPlainNight_Ch3:
	semitone_offset 0

.loop
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, C_1, 19
	audio_wait 12
	note G_1
	audio_wait 12
	note E_2
	audio_wait 12
	note G_1
	audio_wait 12
	note G_0
	audio_wait 12
	note F_1
	audio_wait 12
	note D_2
	audio_wait 12
	note F_1
	audio_wait 12
.sub1
	note NOTE_DURATION_3, C_1, 19
	audio_wait 12
	note G_1
	audio_wait 12
	note E_2
	audio_wait 12
	note G_1
	audio_wait 12
	note G_0
	audio_wait 12
	note F_1
	audio_wait 12
	note D_2
	audio_wait 12
	note F_1
	audio_wait 12
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
.sub2
	note NOTE_DURATION_3, C_1, 19
	audio_wait 12
	note G_1
	audio_wait 12
	note E_2
	audio_wait 12
	note G_1
	audio_wait 12
	note E_2
	audio_wait 12
	note C_1
	audio_wait 12
	note D_1
	audio_wait 12
	note E_1
	audio_wait 12
	audio_ret

.sub3
	note NOTE_DURATION_3, F_1, 19
	audio_wait 12
	note A_1
	audio_wait 12
	note F_2
	audio_wait 12
	note A_1
	audio_wait 12
	note F_1
	audio_wait 12
	note A_1
	audio_wait 12
	note F_2
	audio_wait 12
	note A_1
	audio_wait 12
	audio_ret

	note F_1
	audio_wait 12
	note G#1
	audio_wait 12
	note F_2
	audio_wait 12
	note G#1
	audio_wait 12
	note F_1
	audio_wait 12
	note G#1
	audio_wait 12
	note F_2
	audio_wait 12
	note G#1
	audio_wait 12
	note C_1
	audio_wait 12
	note G_1
	audio_wait 12
	note E_2
	audio_wait 12
	note G_1
	audio_wait 12
	note G_0
	audio_wait 12
	note G_1
	audio_wait 12
	note E_2
	audio_wait 12
	note G_1
	audio_wait 12
	audio_call .sub2
	audio_call .sub3
	note NOTE_DURATION_3, D_1, 19
	audio_wait 12
	note A_1
	audio_wait 12
	note F#2
	audio_wait 12
	note A_1
	audio_wait 12
	note D_1
	audio_wait 12
	note A_1
	audio_wait 12
	note F#2
	audio_wait 12
	note A_1
	audio_wait 12
	note G_1
	audio_wait 12
	note B_1
	audio_wait 12
	note D_2
	audio_wait 12
	note B_2
	audio_wait 12
	note A_1
	audio_wait 12
	note C_2
	audio_wait 12
	note F_2
	audio_wait 12
	note C_3
	audio_wait 12
	note B_1
	audio_wait 12
	note D_2
	audio_wait 12
	note G_2
	audio_wait 12
	note D_3
	audio_wait 12
	note D_4
	audio_wait 12
	note G_0
	audio_wait 12
	note A_0
	audio_wait 12
	note B_0
	audio_wait 12
	audio_jump .loop
.end
	wave WAVE_25
	volume 108
	note NOTE_DURATION_3, C_1, 19
	audio_wait 12
	note G_1
	audio_wait 12
	note E_2
	audio_wait 12
	note G_1
	audio_wait 12
	note G_0
	audio_wait 12
	note F_1
	audio_wait 12
	note D_2
	audio_wait 12
	note F_1
	audio_wait 3
	audio_end

Music_TheVastPlainNight_Ch4:
	semitone_offset 0

.loop
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, C#0, 19
	audio_wait 12
	note F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
	note F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
.sub1
	note NOTE_DURATION_3, C#0, 19
	audio_wait 12
	note F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
	note F#0
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	audio_ret

.sub2
	note NOTE_DURATION_3, C#0, 19
	audio_wait 12
	note F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
	note F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
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
	audio_jump .loop
.end
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, C#0, 19
	audio_wait 12
	note F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note C#0
	audio_wait 12
	note F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 3
	audio_end

Music_TheVastPlainNight:
	db $4, $2
	dw Music_TheVastPlainNight_Ch1
	dw Music_TheVastPlainNight_Ch2
	dw Music_TheVastPlainNight_Ch3
	dw Music_TheVastPlainNight_Ch4

; unused?
	dw Music_TheVastPlainNight_Ch1.loop
	dw Music_TheVastPlainNight_Ch2.loop
	dw Music_TheVastPlainNight_Ch3.loop
	dw Music_TheVastPlainNight_Ch4.loop

	dw Music_TheVastPlainNight_Ch1.end
	dw Music_TheVastPlainNight_Ch2.end
	dw Music_TheVastPlainNight_Ch3.end
	dw Music_TheVastPlainNight_Ch4.end
