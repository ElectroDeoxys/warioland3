Music_TreasureCollection_Ch1:
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_52
	volume 75
	note NOTE_DURATION_3, E_4, 19
	audio_wait_24
	note G_4
	audio_wait_72
.sub1
	note NOTE_DURATION_3, F_4, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_4
	audio_wait_72
	audio_ret

.sub2
	note NOTE_DURATION_3, C_4, 19
	audio_wait_24
	note E_4
	audio_wait_72
	audio_ret

.sub3
	note NOTE_DURATION_3, D_4, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_3
	audio_wait_72
	audio_ret

.sub4
	note NOTE_DURATION_3, A_3, 19
	audio_wait_24
	note C_4
	audio_wait_72
	audio_ret

.sub5
	note NOTE_DURATION_3, G_3, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_4
	audio_wait_72
	audio_ret

	note F#3
	audio_wait_24
	note A_3
	audio_wait_48
	note C_4
	audio_wait_12
	note E_4
	audio_wait_12
	note D_4
	audio_wait_48
	note G_4
	audio_wait_48
	note E_4
	audio_wait_24
	note G_4
	audio_wait_72
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	note NOTE_DURATION_3, F#3, 19
	audio_wait_12
	note A_3
	audio_wait_12
	note C_4
	audio_wait_12
	note E_4
	audio_wait_12
	note D_4
	audio_wait_24
	note G_4
	audio_wait_24
	note C_5
	audio_wait_96
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_TreasureCollection_Ch2:
	semitone_offset 0

.loop
	wave WAVE_48
	volume 75
	note NOTE_DURATION_3, C_4, 19
	audio_wait_24
	note E_4
	audio_wait_72
.sub1
	note NOTE_DURATION_3, D_4, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_3
	audio_wait_72
	audio_ret

.sub2
	note NOTE_DURATION_3, A_3, 19
	audio_wait_24
	note C_4
	audio_wait_72
	audio_ret

.sub3
	note NOTE_DURATION_3, B_3, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_3
	audio_wait_72
	audio_ret

.sub4
	note NOTE_DURATION_3, F_3, 19
	audio_wait_24
	note A_3
	audio_wait_72
	audio_ret

.sub5
	note NOTE_DURATION_3, E_3, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_3
	audio_wait_72
	audio_ret

	note D_3
	audio_wait_24
	note F#3
	audio_wait_48
	note A_3
	audio_wait_12
	note C_4
	audio_wait_12
	note B_3
	audio_wait_48
	note F#4
	audio_wait_48
	note C_4
	audio_wait_24
	note E_4
	audio_wait_72
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	note NOTE_DURATION_3, D_3, 19
	audio_wait_12
	note F#3
	audio_wait_12
	note A_3
	audio_wait_12
	note C_4
	audio_wait_12
	note B_3
	audio_wait_24
	note F#4
	audio_wait_24
	note B_4
	audio_wait_96
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_TreasureCollection_Ch3:
	semitone_offset 0

.loop
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, F#0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
.sub1
	note NOTE_DURATION_3, F#0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
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

Music_TreasureCollection:
	db 3, 2
	dw Music_TreasureCollection_Ch1
	dw Music_TreasureCollection_Ch2
	dw Music_TreasureCollection_Ch3

; unused?
	dw Music_TreasureCollection_Ch1.loop
	dw Music_TreasureCollection_Ch2.loop
	dw Music_TreasureCollection_Ch3.loop

	dw Music_TreasureCollection_Ch1.end
	dw Music_TreasureCollection_Ch2.end
	dw Music_TreasureCollection_Ch3.end
