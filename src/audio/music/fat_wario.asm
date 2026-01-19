Music_FatWario_Ch1:
	semitone_offset 1
	tempo 37
	wave WAVE_52
	volume 79
	audio_wait 24

.loop
	audio_wait 72
	note NOTE_DURATION_4, F#4, 19
	audio_wait 24
	audio_wait 72
	note NOTE_DURATION_4
	audio_wait 24
	audio_wait 96
	audio_wait 12
	note NOTE_DURATION_4, A_3
	audio_wait 12
	note A_4
	audio_wait 12
	note A_3
	audio_wait 12
	note B_3
	audio_wait 24
	note F#4
	audio_wait 24
	audio_wait 72
	note NOTE_DURATION_4
	audio_wait 24
	audio_wait 72
	note NOTE_DURATION_4
	audio_wait 24
	audio_wait 96
	audio_wait 12
	note NOTE_DURATION_4, G_3
	audio_wait 12
	note G_4
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 48
	audio_jump .loop
.end
	audio_end

Music_FatWario_Ch2:
	semitone_offset 1
	wave WAVE_5A
	volume 103
	note NOTE_DURATION_6, G_0, 24
	audio_wait 6
	note F_0
	audio_wait 6
	note E_0
	audio_wait 6
	note D_0
	audio_wait 6

.loop
	note NOTE_DURATION_18, C_0, 24
	audio_wait 18
	note NOTE_DURATION_6, E_0
	audio_wait 6
	note NOTE_DURATION_3, G_0
	audio_wait 12
	note NOTE_DURATION_4, C_1
	audio_wait 12
	note B_0
	audio_wait 12
	wave WAVE_61
	note NOTE_DURATION_4, G_3
	audio_wait 12
	note G_4
	audio_wait 24
.sub1
	wave WAVE_5A
	note NOTE_DURATION_18, C_0, 24
	audio_wait 18
	note NOTE_DURATION_6, E_0
	audio_wait 6
	note NOTE_DURATION_4, G_0
	audio_wait 12
	note C_1
	audio_wait 12
	note B_0
	audio_wait 12
	wave WAVE_61
	note NOTE_DURATION_4, G_3
	audio_wait 12
	note G_4
	audio_wait 24
	audio_ret

.sub2
	wave WAVE_5A
	note NOTE_DURATION_18, C_0, 24
	audio_wait 18
	note NOTE_DURATION_6, E_0
	audio_wait 6
	note NOTE_DURATION_4, G_0
	audio_wait 12
	note C_1
	audio_wait 12
	note NOTE_DURATION_18, F_0
	audio_wait 18
	note NOTE_DURATION_6, A_0
	audio_wait 6
	note NOTE_DURATION_4, C_1
	audio_wait 12
	note F_1
	audio_wait 12
	audio_ret

	note NOTE_DURATION_12, E_1
	audio_wait 12
	note NOTE_DURATION_6, D_1
	audio_wait 6
	note C_1
	audio_wait 6
	note B_0
	audio_wait 6
	note A_0
	audio_wait 6
	note B_0
	audio_wait 6
	note C_1
	audio_wait 6
	note NOTE_DURATION_4, D_1
	audio_wait 12
	wave WAVE_61
	note NOTE_DURATION_4, G_3
	audio_wait 12
	note G_4
	audio_wait 12
	wave WAVE_5A
	note NOTE_DURATION_4, G_0
	audio_wait 12
	note NOTE_DURATION_18, C_0
	audio_wait 18
	note NOTE_DURATION_6, E_0
	audio_wait 6
	note NOTE_DURATION_4, G_0
	audio_wait 12
	note C_1
	audio_wait 12
	note B_0
	audio_wait 12
	wave WAVE_61
	note NOTE_DURATION_4, G_3
	audio_wait 12
	note G_4
	audio_wait 24
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_4, E_1, 24
	audio_wait 24
	note NOTE_DURATION_24, G_0
	audio_wait 24
	note NOTE_DURATION_4, C_1
	audio_wait 24
	note NOTE_DURATION_6, G_0
	audio_wait 6
	note F_0
	audio_wait 6
	note E_0
	audio_wait 6
	note D_0
	audio_wait 6
	audio_jump .loop
.end
	audio_end

Music_FatWario_Ch3:
	semitone_offset 0
	wave WAVE_28
	volume 66
	audio_wait 24

.loop
.sub1
	note NOTE_DURATION_4, C_0, 17
	audio_wait 24
	note D#0
	audio_wait 12
	note NOTE_DURATION_4
	audio_wait 12
	note NOTE_DURATION_4, C_0
	audio_wait 24
	note D#0
	audio_wait 12
	note NOTE_DURATION_4
	audio_wait 12
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_FatWario:
	db $3, $2
	dw Music_FatWario_Ch1
	dw Music_FatWario_Ch2
	dw Music_FatWario_Ch3

; unused?
	dw Music_FatWario_Ch1.loop
	dw Music_FatWario_Ch2.loop
	dw Music_FatWario_Ch3.loop

	dw Music_FatWario_Ch1.end
	dw Music_FatWario_Ch2.end
	dw Music_FatWario_Ch3.end
