Music_TheFrigidSea_Ch1:
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_52
	volume 85
	audio_wait_96
	audio_wait_96
.sub1
	note NOTE_DURATION_3, C#4, 19
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	note C#4
	audio_wait_12
	note C_4
	audio_wait_12
	audio_ret

	note G#3
	audio_wait_96
.sub2
	note NOTE_DURATION_3, C#4, 19
	audio_wait_12
	note D#4
	audio_wait_12
	note F_4
	audio_wait_12
	note G#4
	audio_wait_12
	note F#4
	audio_wait_12
	note D#4
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	audio_ret

	note C#4
	audio_wait_96
	note C#5
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note C#5
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note C#5
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_96
	audio_call .sub2
	note NOTE_DURATION_3, C#4, 19
	audio_wait_96
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#3
	audio_wait_12
	note F#3
	audio_wait_12
	note C#4
	audio_wait_12
	note A#3
	audio_wait_12
	note F#3
	audio_wait_12
	note C#4
	audio_wait_12
	note A#3
	audio_wait_12
	note C#4
	audio_wait_12
	note A_3
	audio_wait_12
	note F#3
	audio_wait_12
	note C#4
	audio_wait_12
	note A_3
	audio_wait_12
	note F#3
	audio_wait_12
	note C#4
	audio_wait_12
	note A_3
	audio_wait_12
	note C#4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_3
	audio_wait_12
	note C#4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_3
	audio_wait_12
	note C#4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note G#3
	audio_wait_12
	note F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note D#4
	audio_wait_12
	note A#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#4
	audio_wait_12
	note A#3
	audio_wait_12
	note G_3
	audio_wait_12
	note D#4
	audio_wait_12
	note A#3
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	note A#3
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	note A#3
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	note G#4
	audio_wait_12
	note D#4
	audio_wait_12
	note C_4
	audio_wait_12
	note A_3
	audio_wait_12
	note G#3
	audio_wait_12
	note D#3
	audio_wait_12
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#3
	audio_wait_12
	note G#3
	audio_wait_12
	note C_4
	audio_wait_48
	audio_call .sub1
	note NOTE_DURATION_3, G#3, 19
	audio_wait_96
	audio_call .sub2
	note NOTE_DURATION_3, C#4, 19
	audio_wait_96
	note C#5
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note C#5
	audio_wait_12
	note B_4
	audio_wait_12
	note G#4
	audio_wait_12
	note C#5
	audio_wait_12
	note B_4
	audio_wait_12
	note C#5
	audio_wait_12
	note A#4
	audio_wait_12
	note F#4
	audio_wait_12
	note C#5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_12
	note C#5
	audio_wait_12
	note D#5
	audio_wait_12
	note F_5
	audio_wait_12
	note C#5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_5
	audio_wait_12
	note D#5
	audio_wait_24
	note A#4
	audio_wait_12
	note C_5
	audio_wait_12
	note C#5
	audio_wait_96
	audio_wait_24
	note C_3
	audio_wait_24
	note C#3
	audio_wait_48
	audio_jump .loop
.end
	audio_end

Music_TheFrigidSea_Ch2:
	semitone_offset 0

.loop
	wave WAVE_48
	volume 85
	audio_wait_24
	note NOTE_DURATION_3, F_2, 19
	audio_wait_48
	note F#2
	audio_wait_24
.sub1
	audio_wait_24
	note NOTE_DURATION_3, F_2, 19
	audio_wait_48
	note F#2
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_wait_24
	note NOTE_DURATION_3, F_2, 19
	audio_wait_72
	audio_wait_24
	note A#2
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_wait_24
	note NOTE_DURATION_3, A_2
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
.sub2
	audio_wait_24
	note NOTE_DURATION_3, F_2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub2
.sub3
	audio_wait_24
	note NOTE_DURATION_3, G_2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub3
	audio_wait_96
	audio_wait_96
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_wait_24
	note NOTE_DURATION_3, C#2, 19
	audio_wait_48
	note NOTE_DURATION_3
	audio_wait_24
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	note NOTE_DURATION_3, F#2
	audio_wait_24
	note C#2
	audio_wait_96
	audio_wait_24
	note F#2
	audio_wait_24
	note F_2
	audio_wait_48
	audio_jump .loop
.end
	audio_end

Music_TheFrigidSea_Ch3:
	semitone_offset 0

.loop
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note G#2
	audio_wait_24
	note G#1
	audio_wait_24
	note G#2
	audio_wait_24
.sub1
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note G#2
	audio_wait_24
	note G#1
	audio_wait_24
	note G#2
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note G#2
	audio_wait_24
	note C#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#2
	audio_wait_12
	note F_2
	audio_wait_12
.sub2
	note NOTE_DURATION_3, F#2, 19
	audio_wait_24
	note C#3
	audio_wait_24
	note C#2
	audio_wait_24
	note C#3
	audio_wait_24
	audio_ret

	audio_call .sub2
	audio_call .sub1
	audio_call .sub1
.sub3
	note NOTE_DURATION_3, D#2, 19
	audio_wait_24
	note A#2
	audio_wait_24
	note A#1
	audio_wait_24
	note A#2
	audio_wait_24
	audio_ret

	audio_call .sub3
	note NOTE_DURATION_3, G#2, 19
	audio_wait_96
	audio_wait_12
	note G#1
	audio_wait_12
	note C_2
	audio_wait_12
	note D#2
	audio_wait_12
	note G#2
	audio_wait_48
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note G#2
	audio_wait_24
	note B_1
	audio_wait_24
	note G#2
	audio_wait_24
	note A#1
	audio_wait_24
	note F#2
	audio_wait_24
	note A_1
	audio_wait_24
	note F#2
	audio_wait_24
	note G#1
	audio_wait_24
	note F_2
	audio_wait_24
	note G#1
	audio_wait_24
	note G#2
	audio_wait_24
	note F_2
	audio_wait_12
	note C#2
	audio_wait_12
	note C_2
	audio_wait_12
	note A#1
	audio_wait_12
	note G#1
	audio_wait_12
	note F#1
	audio_wait_12
	note F_1
	audio_wait_12
	note D#1
	audio_wait_12
	note C#1
	audio_wait_24
	note G#0
	audio_wait_24
	note C#1
	audio_wait_48
	audio_jump .loop
.end
	audio_end

Music_TheFrigidSea:
	db $3, $2
	dw Music_TheFrigidSea_Ch1
	dw Music_TheFrigidSea_Ch2
	dw Music_TheFrigidSea_Ch3

; unused?
	dw Music_TheFrigidSea_Ch1.loop
	dw Music_TheFrigidSea_Ch2.loop
	dw Music_TheFrigidSea_Ch3.loop

	dw Music_TheFrigidSea_Ch1.end
	dw Music_TheFrigidSea_Ch2.end
	dw Music_TheFrigidSea_Ch3.end
