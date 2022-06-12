Music_TheTemple_Ch1: ; 39dcb (0e:5dcb)
	semitone_offset 0

.loop
	tempo 45
	wave WAVE_52
	volume 85
	note NOTE_DURATION_3, C_2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G_2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, F#2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, A#2, 19
	audio_wait_6
	note 9
	audio_wait_54
	note NOTE_DURATION_3, C_3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G_3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, F#3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, A#3, 19
	audio_wait_6
	note 9
	audio_wait_54
	note NOTE_DURATION_3, C_4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G_4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, F#4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, A#4, 19
	audio_wait_6
	note 9
	audio_wait_54
	audio_wait_96
	note NOTE_DURATION_3, C#2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G#2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G_2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, B_2, 19
	audio_wait_6
	note 9
	audio_wait_54
	note NOTE_DURATION_3, C#3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G#3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G_3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, B_3, 19
	audio_wait_6
	note 9
	audio_wait_54
	note NOTE_DURATION_3, C#4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G#4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, G_4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_3, B_4, 19
	audio_wait_6
	note 9
	audio_wait_54
	audio_wait_96
	audio_jump .loop
.end
	audio_end
; 0x39e69

Music_TheTemple_Ch2: ; 39e69 (0e:5e69)
	semitone_offset 0

.loop
	wave WAVE_10
	volume 42
	audio_wait_9
	note NOTE_DURATION_6, C_2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G_2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, F#2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, A#2, 19
	audio_wait_6
	note 9
	audio_wait_44
	audio_wait_1
	audio_wait_9
	note NOTE_DURATION_6, C_3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G_3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, F#3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, A#3, 19
	audio_wait_6
	note 9
	audio_wait_44
	audio_wait_1
	audio_wait_9
	note NOTE_DURATION_6, C_4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G_4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, F#4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, A#4, 19
	audio_wait_6
	note 9
	audio_wait_44
	audio_wait_1
	audio_wait_96
	audio_wait_9
	note NOTE_DURATION_6, C#2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G#2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G_2, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, B_2, 19
	audio_wait_6
	note 9
	audio_wait_44
	audio_wait_1
	audio_wait_9
	note NOTE_DURATION_6, C#3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G#3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G_3, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, B_3, 19
	audio_wait_6
	note 9
	audio_wait_44
	audio_wait_1
	audio_wait_9
	note NOTE_DURATION_6, C#4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G#4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, G_4, 19
	audio_wait_6
	note 9
	audio_wait_6
	note NOTE_DURATION_6, B_4, 19
	audio_wait_6
	note 9
	audio_wait_44
	audio_wait_1
	audio_wait_96
	audio_jump .loop
.end
	audio_end
; 0x39f11

Music_TheTemple: ; 39f11 (0e:5f11)
	db 2, 2
	dw Music_TheTemple_Ch1
	dw Music_TheTemple_Ch2

; unused?
	dw Music_TheTemple_Ch1.loop
	dw Music_TheTemple_Ch2.loop

	dw Music_TheTemple_Ch1.end
	dw Music_TheTemple_Ch2.end
; 0x39f1f
