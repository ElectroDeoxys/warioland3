Music_BossReveal_Ch1: ; 397fa (0e:57fa)
	semitone_offset 0

.loop
	tempo 35
	wave WAVE_52
	volume 75
	note NOTE_DURATION_2, G_4, 19
	audio_wait_8
	note D_4
	audio_wait_8
	note C#4
	audio_wait_8
	note G_3
	audio_wait_8
	note C#4
	audio_wait_8
	note D_4
	audio_wait_8
	note G_4
	audio_wait_8
	note D_4
	audio_wait_8
	note C#4
	audio_wait_8
	note G_3
	audio_wait_8
	note C#4
	audio_wait_8
	note D_4
	audio_wait_8
.sub1
	note NOTE_DURATION_2, G#4, 19
	audio_wait_8
	note D#4
	audio_wait_8
	note D_4
	audio_wait_8
	note G#3
	audio_wait_8
	note D_4
	audio_wait_8
	note D#4
	audio_wait_8
	note G#4
	audio_wait_8
	note D#4
	audio_wait_8
	note D_4
	audio_wait_8
	note G#3
	audio_wait_8
	note D_4
	audio_wait_8
	note D#4
	audio_wait_8
	audio_ret

	note A_4
	audio_wait_8
	note E_4
	audio_wait_8
	note D#4
	audio_wait_8
	note A_3
	audio_wait_8
	note D#4
	audio_wait_8
	note E_4
	audio_wait_8
	note A_4
	audio_wait_8
	note E_4
	audio_wait_8
	note D#4
	audio_wait_8
	note A_3
	audio_wait_8
	note D#4
	audio_wait_8
	note E_4
	audio_wait_8
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x39856

Music_BossReveal_Ch2: ; 39856 (0e:5856)
	semitone_offset 0

.loop
	wave WAVE_10
	volume 37
	audio_wait_3
	note NOTE_DURATION_8, G_4, 14
	audio_wait_8
	note D_4
	audio_wait_8
	note C#4
	audio_wait_8
	note G_3
	audio_wait_8
	note C#4
	audio_wait_8
	note D_4
	audio_wait_8
	note G_4
	audio_wait_8
	note D_4
	audio_wait_8
	note C#4
	audio_wait_8
	note G_3
	audio_wait_8
	note C#4
	audio_wait_8
	note D_4
	audio_wait_5
.sub1
	audio_wait_3
	note NOTE_DURATION_8, G#4, 14
	audio_wait_8
	note D#4
	audio_wait_8
	note D_4
	audio_wait_8
	note G#3
	audio_wait_8
	note D_4
	audio_wait_8
	note D#4
	audio_wait_8
	note G#4
	audio_wait_8
	note D#4
	audio_wait_8
	note D_4
	audio_wait_8
	note G#3
	audio_wait_8
	note D_4
	audio_wait_8
	note D#4
	audio_wait_5
	audio_ret

	audio_wait_3
	note A_4
	audio_wait_8
	note E_4
	audio_wait_8
	note D#4
	audio_wait_8
	note A_3
	audio_wait_8
	note D#4
	audio_wait_8
	note E_4
	audio_wait_8
	note A_4
	audio_wait_8
	note E_4
	audio_wait_8
	note D#4
	audio_wait_8
	note A_3
	audio_wait_8
	note D#4
	audio_wait_8
	note E_4
	audio_wait_5
	audio_call .sub1
	audio_jump .loop
.end
	audio_wait_3
	audio_end
; 0x398b4

Music_BossReveal: ; 398b4 (0e:58b4)
	db 2, 2
	dw Music_BossReveal_Ch1
	dw Music_BossReveal_Ch2

; unused?
	dw Music_BossReveal_Ch1.loop
	dw Music_BossReveal_Ch2.loop

	dw Music_BossReveal_Ch1.end
	dw Music_BossReveal_Ch2.end
; 0x398c2
