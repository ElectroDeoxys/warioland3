Music_ActionHelp_Ch1: ; 398c2 (0e:58c2)
	semitone_offset 0

.loop
	tempo 75
	wave WAVE_52
	volume 66
	note NOTE_DURATION_3, C#1, 19
	audio_wait_12
	note F_2
	audio_wait_12
	note G#0
	audio_wait_12
	note F_2
	audio_wait_12
	note C#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#0
	audio_wait_12
	note F_2
	audio_wait_12
.sub1
	note NOTE_DURATION_3, D_1, 19
	audio_wait_12
	note F#2
	audio_wait_12
	note A_0
	audio_wait_12
	note F#2
	audio_wait_12
	note D_1
	audio_wait_12
	note F#2
	audio_wait_12
	note A_0
	audio_wait_12
	note F#2
	audio_wait_12
	audio_ret

	note C#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#0
	audio_wait_12
	note F_2
	audio_wait_12
	note C#1
	audio_wait_12
	note F_2
	audio_wait_12
	note G#0
	audio_wait_12
	note F_2
	audio_wait_12
	audio_call .sub1
.sub2
	note NOTE_DURATION_3, D#1, 19
	audio_wait_12
	note G_2
	audio_wait_12
	note A#0
	audio_wait_12
	note G_2
	audio_wait_12
	note D#1
	audio_wait_12
	note G_2
	audio_wait_12
	note A#0
	audio_wait_12
	note G_2
	audio_wait_12
	audio_ret

	note E_1
	audio_wait_12
	note G#2
	audio_wait_12
	note B_0
	audio_wait_12
	note G#2
	audio_wait_12
	note E_1
	audio_wait_12
	note G#2
	audio_wait_12
	note B_0
	audio_wait_12
	note G#2
	audio_wait_12
	audio_call .sub2
	note NOTE_DURATION_3, E_1, 19
	audio_wait_12
	note G#2
	audio_wait_12
	note B_0
	audio_wait_12
	note G#2
	audio_wait_12
	note D#1
	audio_wait_12
	note G_2
	audio_wait_12
	note D_1
	audio_wait_12
	note F#2
	audio_wait_12
	audio_jump .loop
.end
	audio_end
; 0x3993e

Music_ActionHelp_Ch2: ; 3993e (0e:593e)
	semitone_offset 0

.loop
	wave WAVE_61
	volume 75
	audio_wait_12
	note NOTE_DURATION_3, C_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
.sub1
	audio_wait_12
	note NOTE_DURATION_3, C#2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_wait_12
	note NOTE_DURATION_3, C_2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_call .sub1
.sub2
	audio_wait_12
	note NOTE_DURATION_3, D_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_wait_12
	note NOTE_DURATION_3, D#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_call .sub2
	audio_wait_12
	note NOTE_DURATION_3, D#2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, D_2
	audio_wait_24
	note C#2
	audio_wait_12
	audio_jump .loop
.end
	audio_end
; 0x39991

Music_ActionHelp: ; 39991 (0e:5991)
	db 2, 2
	dw Music_ActionHelp_Ch1
	dw Music_ActionHelp_Ch2

; unused?
	dw Music_ActionHelp_Ch1.loop
	dw Music_ActionHelp_Ch2.loop

	dw Music_ActionHelp_Ch1.end
	dw Music_ActionHelp_Ch2.end
; 0x3999f
