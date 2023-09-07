Music_TreasureFanfare_Ch1: ; 38a77 (0e:4a77)
	semitone_offset 1
	tempo 50
	wave WAVE_17
	vibrato_speed 25
	vibrato_delay 5
	vibrato_amplitude 20
	vibrato_disabled FALSE
	volume 75
	note NOTE_DURATION_10, C_3, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, E_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_10, F_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, F#3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_96, G_3
	audio_wait_96
	audio_end
; 0x38aa8

Music_TreasureFanfare_Ch2: ; 38aa8 (0e:4aa8)
	semitone_offset 1
	wave WAVE_0D
	volume 75
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_10, E_2, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, G_2
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_10, A_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, C_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_48, C_3
	audio_wait_48
	note NOTE_DURATION_48, B_2
	audio_wait_48
	audio_end
; 0x38ada

Music_TreasureFanfare_Ch3: ; 38ada (0e:4ada)
	semitone_offset 1
	wave WAVE_5D
	volume 108
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_10, C_2, 24
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, A#1
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_10, A_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, G#1
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, G#0
	audio_wait_8
	note G_0
	audio_wait_8
	note C_1
	audio_wait_8
	note D_1
	audio_wait_8
	note G_1
	audio_wait_8
	note D_1
	audio_wait_8
	note C_1
	audio_wait_8
	note NOTE_DURATION_48, G_0, 24
	audio_wait_48
	audio_end
; 0x38b17

Music_TreasureFanfare_Ch4: ; 38b17 (0e:4b17)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, F#0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_4
	note NOTE_DURATION_3
	audio_wait_3
	audio_end
; 0x38b5e

Music_TreasureFanfare: ; 38b5e (0e:4b5e)
	db 4, 0
	dw Music_TreasureFanfare_Ch1
	dw Music_TreasureFanfare_Ch2
	dw Music_TreasureFanfare_Ch3
	dw Music_TreasureFanfare_Ch4
