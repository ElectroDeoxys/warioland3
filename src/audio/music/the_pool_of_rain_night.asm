Music_ThePoolOfRainNight_Ch1:
	semitone_offset 0

.loop
	tempo 40
	wave WAVE_51
	volume 75
	note NOTE_DURATION_2, C_4, 19
	audio_wait 24
	note B_3
	audio_wait 24
	note G_3
	audio_wait 48
	audio_wait 96
	note C_4
	audio_wait 12
	note D_4
	audio_wait 12
	note D#4
	audio_wait 12
	note G_4
	audio_wait 12
	note F#4
	audio_wait 48
	audio_wait 96
	note C_4
	audio_wait 24
	note B_3
	audio_wait 24
	note G_3
	audio_wait 48
	audio_wait 96
	note C_4
	audio_wait 12
	note D_4
	audio_wait 12
	note D#4
	audio_wait 12
	note A#4
	audio_wait 12
	note A_4
	audio_wait 48
	audio_wait 96
	note G_4
	audio_wait 24
	note D_4
	audio_wait 24
	note G_4
	audio_wait 48
	audio_wait 96
	note F#4
	audio_wait 24
	note C#4
	audio_wait 24
	note F#4
	audio_wait 48
	audio_wait 96
	note F_4
	audio_wait 24
	note C_4
	audio_wait 24
	note F_4
	audio_wait 48
	audio_wait 72
	note D#4
	audio_wait 12
	note B_3
	audio_wait 12
	note C_4
	audio_wait 96
	audio_wait 96
	audio_jump .loop
.end
	wave WAVE_51
	volume 75
	note NOTE_DURATION_2, C_4, 19
	audio_wait 24
	note B_3
	audio_wait 24
	note G_3
	audio_wait 2
	audio_end

Music_ThePoolOfRainNight_Ch2:
	semitone_offset 0

.loop
	wave WAVE_47
	volume 75
	note NOTE_DURATION_2, G_3, 19
	audio_wait 24
	note F#3
	audio_wait 24
	note D_3
	audio_wait 48
	audio_wait 96
	note G_3
	audio_wait 12
	note A_3
	audio_wait 12
	note A#3
	audio_wait 12
	note D_4
	audio_wait 12
	note C#4
	audio_wait 48
	audio_wait 96
	note G_3
	audio_wait 24
	note F#3
	audio_wait 24
	note D_3
	audio_wait 48
	audio_wait 96
	note G_3
	audio_wait 12
	note A_3
	audio_wait 12
	note A#3
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 48
	audio_wait 96
	note D_4
	audio_wait 24
	note A_3
	audio_wait 24
	note D_4
	audio_wait 48
	audio_wait 96
	note C#4
	audio_wait 24
	note G#3
	audio_wait 24
	note C#4
	audio_wait 48
	audio_wait 96
	note C_4
	audio_wait 24
	note G_3
	audio_wait 24
	note C_4
	audio_wait 48
	audio_wait 72
	note A#3
	audio_wait 12
	note F#3
	audio_wait 12
	note G_3
	audio_wait 96
	audio_wait 96
	audio_jump .loop
.end
	wave WAVE_47
	volume 75
	note NOTE_DURATION_2, G_3, 19
	audio_wait 24
	note F#3
	audio_wait 24
	note D_3
	audio_wait 2
	audio_end

Music_ThePoolOfRainNight_Ch3:
	semitone_offset 0

.loop
	wave WAVE_63
	volume 108
	note NOTE_DURATION_3, C_0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 84
.sub1
	note NOTE_DURATION_3, C_0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 84
	audio_ret

	audio_call .sub1
	note NOTE_DURATION_3, C_0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 60
	note NOTE_DURATION_24, G_0
	audio_wait 24
.sub2
	note NOTE_DURATION_3, C_1, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 84
	audio_ret

	audio_call .sub2
	audio_call .sub2
	note NOTE_DURATION_3, C_1, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 60
	note NOTE_DURATION_24, G_0
	audio_wait 24
.sub3
	note NOTE_DURATION_3, C_0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 60
	note NOTE_DURATION_24, C#0
	audio_wait 24
	audio_ret

	audio_call .sub1
	audio_call .sub3
	audio_call .sub1
	audio_call .sub3
	audio_call .sub1
	note NOTE_DURATION_3, C_0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 48
	note C#0
	audio_wait 12
	note D#0
	audio_wait 12
	note C#0
	audio_wait 12
	note NOTE_DURATION_3, C_0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 36
	note NOTE_DURATION_18, G_0
	audio_wait 24
	note NOTE_DURATION_18
	audio_wait 24
	audio_jump .loop
.end
	wave WAVE_63
	volume 108
	note NOTE_DURATION_3, C_0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 3
	audio_end

Music_ThePoolOfRainNight_Ch4:
	semitone_offset 0

.loop
	wave WAVE_28
	volume 75
	note NOTE_DURATION_1, C#0, 19
	audio_wait 12
	note NOTE_DURATION_3, F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_1, C#0
	audio_wait 12
	note NOTE_DURATION_3, F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
.sub1
	note NOTE_DURATION_1, C#0, 19
	audio_wait 12
	note NOTE_DURATION_3, F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_1, C#0
	audio_wait 12
	note NOTE_DURATION_3, F#0
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	audio_ret

.sub2
	note NOTE_DURATION_1, C#0, 19
	audio_wait 12
	note NOTE_DURATION_3, F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_1, C#0
	audio_wait 12
	note NOTE_DURATION_3, F#0
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
	audio_jump .loop
.end
	wave WAVE_28
	volume 75
	note NOTE_DURATION_1, C#0, 19
	audio_wait 12
	note NOTE_DURATION_3, F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_1, C#0
	audio_wait 12
	note NOTE_DURATION_3, F#0
	audio_wait 12
	note G#0
	audio_wait 12
	note F#0
	audio_wait 3
	audio_end

Music_ThePoolOfRainNight:
	db $4, $2
	dw Music_ThePoolOfRainNight_Ch1
	dw Music_ThePoolOfRainNight_Ch2
	dw Music_ThePoolOfRainNight_Ch3
	dw Music_ThePoolOfRainNight_Ch4

; unused?
	dw Music_ThePoolOfRainNight_Ch1.loop
	dw Music_ThePoolOfRainNight_Ch2.loop
	dw Music_ThePoolOfRainNight_Ch3.loop
	dw Music_ThePoolOfRainNight_Ch4.loop

	dw Music_ThePoolOfRainNight_Ch1.end
	dw Music_ThePoolOfRainNight_Ch2.end
	dw Music_ThePoolOfRainNight_Ch3.end
	dw Music_ThePoolOfRainNight_Ch4.end
