Music_ZombieWario_Ch1:
	semitone_offset 1
	tempo 50
	wave WAVE_60
	volume 75
	audio_wait_8

.loop
	audio_wait_96
	audio_wait_88
	note NOTE_DURATION_8, D#3, 19
	audio_wait_8
	note NOTE_DURATION_4, D_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, C_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, B_2
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, G#2
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, G_2
	audio_wait_96
	audio_wait_96
	audio_wait_88
	note NOTE_DURATION_8, D#3
	audio_wait_8
	note NOTE_DURATION_4, D_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, C_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, B_2
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, C_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, B_2
	audio_wait_96
	audio_jump .loop
.end
	audio_end

Music_ZombieWario_Ch2:
	semitone_offset 1
	wave WAVE_52
	volume 75
	note NOTE_DURATION_4, G_0, 19
	audio_wait_4
	note B_0
	audio_wait_4

.loop
.sub1
	note NOTE_DURATION_4, C_1, 19
	audio_wait_40
	note G_0
	audio_wait_4
	note B_0
	audio_wait_4
	note C_1
	audio_wait_40
	note G_0
	audio_wait_4
	note B_0
	audio_wait_4
	audio_ret

	note C_1
	audio_wait_24
	note C_0
	audio_wait_64
	wave WAVE_1A
	note NOTE_DURATION_8, G_3
	audio_wait_8
	note NOTE_DURATION_4, F#3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, D#3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, D_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, C_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, B_2
	audio_wait_21
	note NOTE_DURATION_3, F#3
	audio_wait_3
	note NOTE_DURATION_4, G_3
	audio_wait_64
	wave WAVE_52
	note NOTE_DURATION_4, G_0
	audio_wait_4
	note B_0
	audio_wait_4
	audio_call .sub1
	note NOTE_DURATION_4, C_1, 19
	audio_wait_24
	note C_0
	audio_wait_64
	wave WAVE_1A
	note NOTE_DURATION_8, C_4
	audio_wait_8
	note NOTE_DURATION_4, B_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, G#3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, G_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, G#3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_4, G_3
	audio_wait_21
	note NOTE_DURATION_3, F#4
	audio_wait_3
	note NOTE_DURATION_4, G_4
	audio_wait_64
	wave WAVE_52
	note NOTE_DURATION_4, G_0
	audio_wait_4
	note B_0
	audio_wait_4
	audio_jump .loop
.end
	audio_end

Music_ZombieWario:
	db $2, $2
	dw Music_ZombieWario_Ch1
	dw Music_ZombieWario_Ch2

; unused?
	dw Music_ZombieWario_Ch1.loop
	dw Music_ZombieWario_Ch2.loop

	dw Music_ZombieWario_Ch1.end
	dw Music_ZombieWario_Ch2.end
