Music_SnowmanWario_Ch1:
	semitone_offset 0
	tempo 82
	wave WAVE_55
	volume 75
	audio_wait_96
	audio_wait_96

.loop
	note NOTE_DURATION_3, A#3, 19
	audio_wait_24
	note G_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#4
	audio_wait_12
	note D_4
	audio_wait_12
	note C_4
	audio_wait_12
	note D_4
	audio_wait_24
	note A#3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_4
	audio_wait_12
	note D#4
	audio_wait_12
	note D_4
	audio_wait_12
	note C_4
	audio_wait_24
	note A#3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_4
	audio_wait_12
	note F_4
	audio_wait_12
	note G_4
	audio_wait_12
	note F_4
	audio_wait_24
	note D#4
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, C_4
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_5
	audio_wait_12
	note A#4
	audio_wait_12
	note A_4
	audio_wait_12
	note A#4
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	audio_jump .loop
.end
	audio_end

Music_SnowmanWario_Ch2:
	semitone_offset 0
	wave WAVE_4B
	volume 75
	audio_wait_24
	note NOTE_DURATION_3, G_2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
.sub1
	audio_wait_24
	note NOTE_DURATION_3, G#2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.loop
.sub2
	audio_wait_24
	note NOTE_DURATION_3, G_2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_call .sub2
	audio_wait_24
	note NOTE_DURATION_3, D#2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_wait_24
	note NOTE_DURATION_3, A_2
	audio_wait_48
	note C_3
	audio_wait_24
	audio_wait_24
	note D#3
	audio_wait_24
	note D_3
	audio_wait_48
	audio_jump .loop
.end
	audio_end

Music_SnowmanWario_Ch3:
	semitone_offset 0
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, D#2, 24
	audio_wait_24
	note A#2
	audio_wait_24
	note A#1
	audio_wait_24
	note A#2
	audio_wait_24
.sub1
	note NOTE_DURATION_3, F_2, 24
	audio_wait_24
	note A#2
	audio_wait_24
	note A#1
	audio_wait_24
	note A#2
	audio_wait_24
	audio_ret

.loop
.sub2
	note NOTE_DURATION_3, D#2, 24
	audio_wait_24
	note A#2
	audio_wait_24
	note A#1
	audio_wait_24
	note A#2
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, D#2, 24
	audio_wait_24
	note A#2
	audio_wait_24
	note D_2
	audio_wait_24
	note B_2
	audio_wait_24
	note C_2
	audio_wait_24
	note A#2
	audio_wait_24
	note C_2
	audio_wait_24
	note A#2
	audio_wait_24
	note F_2
	audio_wait_24
	note C_3
	audio_wait_24
	note F_2
	audio_wait_24
	note D#3
	audio_wait_24
	note A#2
	audio_wait_24
	note F_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, A#2
	audio_wait_24
	audio_jump .loop
.end
	audio_end

Music_SnowmanWario:
	db $3, $2
	dw Music_SnowmanWario_Ch1
	dw Music_SnowmanWario_Ch2
	dw Music_SnowmanWario_Ch3

; unused?
	dw Music_SnowmanWario_Ch1.loop
	dw Music_SnowmanWario_Ch2.loop
	dw Music_SnowmanWario_Ch3.loop

	dw Music_SnowmanWario_Ch1.end
	dw Music_SnowmanWario_Ch2.end
	dw Music_SnowmanWario_Ch3.end
