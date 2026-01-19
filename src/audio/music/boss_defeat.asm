Music_BossDefeat_Ch1:
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_52
	volume 85
	note NOTE_DURATION_3, B_4, 19
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note B_4
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
.sub1
	note NOTE_DURATION_3, C_5, 19
	audio_wait 12
	note G#4
	audio_wait 12
	note F_4
	audio_wait 12
	note C#4
	audio_wait 12
	note C_5
	audio_wait 12
	note G#4
	audio_wait 12
	note F_4
	audio_wait 12
	note C#4
	audio_wait 12
	audio_ret

	note B_4
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note B_4
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	audio_call .sub1
.sub2
	note NOTE_DURATION_3, C#5, 19
	audio_wait 12
	note A_4
	audio_wait 12
	note F#4
	audio_wait 12
	note D_4
	audio_wait 12
	note C#5
	audio_wait 12
	note A_4
	audio_wait 12
	note F#4
	audio_wait 12
	note D_4
	audio_wait 12
	audio_ret

	note D_5
	audio_wait 12
	note A#4
	audio_wait 12
	note G_4
	audio_wait 12
	note D#4
	audio_wait 12
	note D_5
	audio_wait 12
	note A#4
	audio_wait 12
	note G_4
	audio_wait 12
	note D#4
	audio_wait 12
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_BossDefeat_Ch2:
	semitone_offset 0

.loop
	wave WAVE_10
	volume 47
	audio_wait 18
	note NOTE_DURATION_12, B_4, 12
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note B_4
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 6
.sub1
	audio_wait 6
	note NOTE_DURATION_12, C_4, 12
	audio_wait 12
	note C_5
	audio_wait 12
	note G#4
	audio_wait 12
	note F_4
	audio_wait 12
	note C#4
	audio_wait 12
	note C_5
	audio_wait 12
	note G#4
	audio_wait 12
	note F_4
	audio_wait 6
	audio_ret

	audio_wait 6
	note C#4
	audio_wait 12
	note B_4
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note B_4
	audio_wait 12
	note G_4
	audio_wait 12
	note E_4
	audio_wait 6
	audio_call .sub1
	audio_wait 6
	note NOTE_DURATION_12, C#4, 12
	audio_wait 12
	note C#5
	audio_wait 12
	note A_4
	audio_wait 12
	note F#4
	audio_wait 12
	note D_4
	audio_wait 12
	note C#5
	audio_wait 12
	note A_4
	audio_wait 12
	note F#4
	audio_wait 6
	audio_wait 6
	note D_4
	audio_wait 12
	note D_5
	audio_wait 12
	note A#4
	audio_wait 12
	note G_4
	audio_wait 12
	note D#4
	audio_wait 12
	note D_5
	audio_wait 12
	note A#4
	audio_wait 12
	note G_4
	audio_wait 6
	audio_wait 6
	note D#4
	audio_wait 12
	note C#5
	audio_wait 12
	note A_4
	audio_wait 12
	note F#4
	audio_wait 12
	note D_4
	audio_wait 12
	note C#5
	audio_wait 12
	note A_4
	audio_wait 12
	note F#4
	audio_wait 6
	audio_wait 6
	note D_4
	audio_wait 12
	note C_5
	audio_wait 12
	note G#4
	audio_wait 12
	note F_4
	audio_wait 12
	note C#4
	audio_wait 12
	note C_5
	audio_wait 12
	note G#4
	audio_wait 12
	note F_4
	audio_wait 6
	audio_jump .loop
.end
	audio_wait 6
	note NOTE_DURATION_3, C#4, 12
	audio_wait 3
	audio_end

Music_BossDefeat:
	db 2, 2
	dw Music_BossDefeat_Ch1
	dw Music_BossDefeat_Ch2

; unused?
	dw Music_BossDefeat_Ch1.loop
	dw Music_BossDefeat_Ch2.loop

	dw Music_BossDefeat_Ch1.end
	dw Music_BossDefeat_Ch2.end
