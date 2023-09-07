Music_BossDefeat_Ch1: ; 394e6 (0e:54e6)
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_52
	volume 85
	note NOTE_DURATION_3, B_4, 19
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_4
	audio_wait_12
	note B_4
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_4
	audio_wait_12
.sub1
	note NOTE_DURATION_3, C_5, 19
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_12
	note C#4
	audio_wait_12
	audio_ret

	note B_4
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_4
	audio_wait_12
	note B_4
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_4
	audio_wait_12
	audio_call .sub1
.sub2
	note NOTE_DURATION_3, C#5, 19
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note C#5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	audio_ret

	note D_5
	audio_wait_12
	note A#4
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	note D_5
	audio_wait_12
	note A#4
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x39553

Music_BossDefeat_Ch2: ; 39553 (0e:5553)
	semitone_offset 0

.loop
	wave WAVE_10
	volume 47
	audio_wait_18
	note NOTE_DURATION_12, B_4, 12
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_4
	audio_wait_12
	note B_4
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_6
.sub1
	audio_wait_6
	note NOTE_DURATION_12, C_4, 12
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_6
	audio_ret

	audio_wait_6
	note C#4
	audio_wait_12
	note B_4
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_12
	note C_4
	audio_wait_12
	note B_4
	audio_wait_12
	note G_4
	audio_wait_12
	note E_4
	audio_wait_6
	audio_call .sub1
	audio_wait_6
	note NOTE_DURATION_12, C#4, 12
	audio_wait_12
	note C#5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note C#5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_6
	audio_wait_6
	note D_4
	audio_wait_12
	note D_5
	audio_wait_12
	note A#4
	audio_wait_12
	note G_4
	audio_wait_12
	note D#4
	audio_wait_12
	note D_5
	audio_wait_12
	note A#4
	audio_wait_12
	note G_4
	audio_wait_6
	audio_wait_6
	note D#4
	audio_wait_12
	note C#5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note C#5
	audio_wait_12
	note A_4
	audio_wait_12
	note F#4
	audio_wait_6
	audio_wait_6
	note D_4
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_12
	note C#4
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note F_4
	audio_wait_6
	audio_jump .loop
.end
	audio_wait_6
	note NOTE_DURATION_3, C#4, 12
	audio_wait_3
	audio_end
; 0x395e1

Music_BossDefeat: ; 395e1 (0e:55e1)
	db 2, 2
	dw Music_BossDefeat_Ch1
	dw Music_BossDefeat_Ch2

; unused?
	dw Music_BossDefeat_Ch1.loop
	dw Music_BossDefeat_Ch2.loop

	dw Music_BossDefeat_Ch1.end
	dw Music_BossDefeat_Ch2.end
; 0x395ef
