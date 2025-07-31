Sfx_02e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 80
	note NOTE_DURATION_1, F_4, 17
	audio_wait_3
	note F#4
	audio_wait_3
	note G_4
	audio_wait_3
	note G#4
	audio_wait_3
	note A_4
	audio_wait_3
	audio_end

Sfx_02e:
	db 1, 0
	dw Sfx_02e_Ch1

Sfx_Switch_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 94
	note NOTE_DURATION_1, E_3, 24
	audio_wait_1
	note G_3
	audio_wait_3
	note B_3
	audio_wait_3
	audio_end

Sfx_Switch:
	db 1, 0
	dw Sfx_Switch_Ch1

Sfx_PipeEnter_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_35
	volume 120
	note NOTE_DURATION_8, C_4, 24
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_16
	audio_end

Sfx_PipeEnter:
	db 1, 0
	dw Sfx_PipeEnter_Ch1

Sfx_MusicalCoin_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 66
	audio_wait_18
	note NOTE_DURATION_4, A_1, 17
	audio_wait_4
	note E_2
	audio_wait_4
	note G_2
	audio_wait_4
	note A_2
	audio_wait_4
	note C#3
	audio_wait_4
	note G_3
	audio_wait_4
	note E_3
	audio_wait_4
	note A#1
	audio_wait_4
	note F_2
	audio_wait_4
	note G#2
	audio_wait_4
	note A#2
	audio_wait_4
	note C_3
	audio_wait_4
	note G#3
	audio_wait_4
	note F#3
	audio_wait_4
	note B_1
	audio_wait_4
	note F#2
	audio_wait_4
	note A_2
	audio_wait_4
	note B_2
	audio_wait_4
	note C#3
	audio_wait_4
	note A_3
	audio_wait_4
	note F#3
	audio_wait_4
	note B_4
	audio_wait_4
	audio_end

Sfx_MusicalCoin_Ch2:
	semitone_offset 0
	wave WAVE_61
	volume 108
	note NOTE_DURATION_4, A_1, 22
	audio_wait_4
	note E_2
	audio_wait_4
	note G_2
	audio_wait_4
	note A_2
	audio_wait_4
	note C#3
	audio_wait_4
	note G_3
	audio_wait_4
	note E_3
	audio_wait_4
	note A#1
	audio_wait_4
	note F_2
	audio_wait_4
	note G#2
	audio_wait_4
	note A#2
	audio_wait_4
	note C_3
	audio_wait_4
	note G#3
	audio_wait_4
	note F#3
	audio_wait_4
	note B_1
	audio_wait_4
	note F#2
	audio_wait_4
	note A_2
	audio_wait_4
	note B_2
	audio_wait_4
	note C#3
	audio_wait_4
	note A_3
	audio_wait_4
	note F#3
	audio_wait_4
	note B_4
	audio_wait_4
	audio_end

Sfx_MusicalCoin:
	db 2, 0
	dw Sfx_MusicalCoin_Ch1
	dw Sfx_MusicalCoin_Ch2

Sfx_Key_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_47
	volume 94
	note NOTE_DURATION_3, D_2, 22
	audio_wait_3
	note A_2
	audio_wait_3
	note C_3
	audio_wait_3
	note E_3
	audio_wait_3
	note F_3
	audio_wait_3
	note A_3
	audio_wait_3
	note C_4
	audio_wait_3
	note E_4
	audio_wait_3
	note D#2
	audio_wait_3
	note A#2
	audio_wait_3
	note C#3
	audio_wait_3
	note F_3
	audio_wait_3
	note F#3
	audio_wait_3
	note A#3
	audio_wait_3
	note C#4
	audio_wait_3
	note F_4
	audio_wait_3
	note E_2
	audio_wait_3
	note B_2
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note G_3
	audio_wait_3
	note B_3
	audio_wait_3
	note D_4
	audio_wait_3
	note F#4
	audio_wait_3
	note G_2
	audio_wait_3
	note D_3
	audio_wait_3
	note F_3
	audio_wait_3
	note A_3
	audio_wait_3
	note A#3
	audio_wait_3
	note D_4
	audio_wait_3
	note F_4
	audio_wait_3
	note A_4
	audio_wait_3
	audio_end

Sfx_Key_Ch2:
	semitone_offset 0
	wave WAVE_5D
	volume 66
	audio_wait_18
	note NOTE_DURATION_3, D_2, 17
	audio_wait_3
	note A_2
	audio_wait_3
	note C_3
	audio_wait_3
	note E_3
	audio_wait_3
	note F_3
	audio_wait_3
	note A_3
	audio_wait_3
	note C_4
	audio_wait_3
	note E_4
	audio_wait_3
	note D#2
	audio_wait_3
	note A#2
	audio_wait_3
	note C#3
	audio_wait_3
	note F_3
	audio_wait_3
	note F#3
	audio_wait_3
	note A#3
	audio_wait_3
	note C#4
	audio_wait_3
	note F_4
	audio_wait_3
	note E_2
	audio_wait_3
	note B_2
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note G_3
	audio_wait_3
	note B_3
	audio_wait_3
	note D_4
	audio_wait_3
	note F#4
	audio_wait_3
	note G_2
	audio_wait_3
	note D_3
	audio_wait_3
	note F_3
	audio_wait_3
	note NOTE_DURATION_3, A_3, 19
	audio_wait_3
	note A#3
	audio_wait_3
	note NOTE_DURATION_3, D_4, 20
	audio_wait_3
	note F_4
	audio_wait_3
	note NOTE_DURATION_3, A_4, 25
	audio_wait_3
	audio_end

Sfx_Key:
	db 2, 0
	dw Sfx_Key_Ch1
	dw Sfx_Key_Ch2

Sfx_GroundPound_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6E
	volume 120
	note NOTE_DURATION_10, C_1, 31
	audio_wait_12
	note NOTE_DURATION_10, C_1, 31
	audio_wait_12
	audio_end

Sfx_GroundPound:
	db 1, 0
	dw Sfx_GroundPound_Ch1

Sfx_034_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_45
	volume 120
	note NOTE_DURATION_3, A_3, 31
	audio_wait_3
	note NOTE_DURATION_1, A_3, 9
	audio_wait_1
	note NOTE_DURATION_6, A_3, 31
	audio_wait_6
	note NOTE_DURATION_2, A_3, 9
	audio_wait_2
	note NOTE_DURATION_2, A_3, 4
	audio_wait_2
	audio_end

Sfx_034_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	note NOTE_DURATION_2, F_3, 31
	audio_wait_2
	note NOTE_DURATION_1, F_3, 12
	audio_wait_1
	note NOTE_DURATION_1, A_3, 4
	audio_wait_1
	note NOTE_DURATION_3, F_3, 31
	audio_wait_3
	note NOTE_DURATION_3, F_3, 12
	audio_wait_3
	note NOTE_DURATION_2, A_3, 4
	audio_wait_2
	note NOTE_DURATION_2, A_3, 2
	audio_wait_2
	audio_end

Sfx_034:
	db 2, 0
	dw Sfx_034_Ch1
	dw Sfx_034_Ch2

Sfx_035_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 94
	note NOTE_DURATION_2, B_1, 29
	audio_wait_3
	note G_1, 9
	audio_wait_3
	note B_1, 24
	audio_wait_3
	note G_1, 7
	audio_wait_3
	audio_end

Sfx_035:
	db 1, 0
	dw Sfx_035_Ch1

Sfx_Sleep_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 47
	audio_wait_30
	note NOTE_DURATION_30, D_3, 7
	audio_wait_30
	wave WAVE_65
	note NOTE_DURATION_40, D_3, 7
	audio_wait_40
	note NOTE_DURATION_20, D_3, 4
	audio_wait_20
	wave WAVE_66
	note NOTE_DURATION_10, D_3, 2
	audio_wait_10
	audio_end

Sfx_Sleep:
	db 1, 0
	dw Sfx_Sleep_Ch1

Sfx_WaterSurface_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	vibrato_amplitude 50
	volume 66
	pitch_offset 0
	note NOTE_DURATION_5, F_1, 24
	audio_wait_6
	note NOTE_DURATION_5
	audio_wait_6
	note NOTE_DURATION_5
	audio_wait_6
	note NOTE_DURATION_5, D_1
	audio_wait_10
	audio_end

Sfx_WaterSurface:
	db 1, 0
	dw Sfx_WaterSurface_Ch1

Sfx_Climb_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6C
	volume 56
	note NOTE_DURATION_16, F_1, 19
	audio_wait_16
	note NOTE_DURATION_16
	audio_wait_16
	audio_end

Sfx_Climb_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 113
	note NOTE_DURATION_3, F_0, 24
	audio_wait_16
	note NOTE_DURATION_3
	audio_wait_16
	audio_end

Sfx_Climb:
	db 2, 0
	dw Sfx_Climb_Ch1
	dw Sfx_Climb_Ch2

Sfx_039_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	vibrato_amplitude 0
	volume 113
	pitch_offset 0
	note NOTE_DURATION_1, C_5, 17
	audio_wait_3
	note G_4
	audio_wait_3
	note D#4
	audio_wait_3
	note C_4
	audio_wait_3
	note C#4
	audio_wait_3
	note A_4
	audio_wait_3
	note F#4
	audio_wait_3
	note G_4
	audio_wait_3
	note C_4
	audio_wait_3
	note D#4
	audio_wait_3
	note D_4
	audio_wait_1
	audio_end

Sfx_039:
	db 1, 0
	dw Sfx_039_Ch1

Sfx_03a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 113
	note NOTE_DURATION_3, G_1, 29
	audio_wait_5
	wave WAVE_3F
	note NOTE_DURATION_3, F_1, 29
	audio_wait_5
	wave WAVE_36
	note NOTE_DURATION_3, G_1, 29
	audio_wait_5
	wave WAVE_3F
	note NOTE_DURATION_3, F_1, 29
	audio_wait_5
	wave WAVE_36
	note NOTE_DURATION_3, G_1, 29
	audio_wait_5
	wave WAVE_3F
	note NOTE_DURATION_3, F_1, 29
	audio_wait_44
	wave WAVE_3E
	volume 103
	pitch_offset -74
	note NOTE_DURATION_14, C#1, 27
	audio_wait_24
	wave WAVE_64
	volume 94
	note NOTE_DURATION_1, B_4, 24
	audio_wait_6
	note F#3
	audio_wait_2
	audio_end

Sfx_03a:
	db 1, 0
	dw Sfx_03a_Ch1

Sfx_FatWalk_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3F
	volume 113
	note NOTE_DURATION_6, G_1, 29
	audio_wait_6
	wave WAVE_36
	note NOTE_DURATION_4, F_1, 29
	audio_wait_22
	audio_end

Sfx_FatWalk:
	db 1, 0
	dw Sfx_FatWalk_Ch1

Sfx_03c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	vibrato_amplitude 0
	volume 113
	pitch_offset 0
	note NOTE_DURATION_1, D_4, 17
	audio_wait_3
	note D#4
	audio_wait_3
	note C_4
	audio_wait_3
	note G_4
	audio_wait_3
	note F#4
	audio_wait_3
	note A_4
	audio_wait_3
	note C#4
	audio_wait_3
	note C_4
	audio_wait_3
	note G_4
	audio_wait_2
	note C_5
	audio_wait_2
	audio_end

Sfx_03c:
	db 1, 0
	dw Sfx_03c_Ch1

Sfx_03d_Ch1:
	volume 66
	semitone_offset 0
	tempo 74
	wave WAVE_10
	pitch_offset 6
	note NOTE_DURATION_15, C_3, 14
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_1
	note NOTE_DURATION_15, C_3, 4
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_10
	pitch_offset 6
	note NOTE_DURATION_15, C_3, 14
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_1
	note NOTE_DURATION_15, C_3, 4
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_10
	audio_end

Sfx_03d:
	db 1, 0
	dw Sfx_03d_Ch1

Sfx_03e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	audio_wait_10
	note NOTE_DURATION_1, C_2, 24
	audio_wait_3
	note D_3
	audio_wait_3
	note A#3
	audio_wait_12
	note C_2
	audio_wait_3
	note D_3
	audio_wait_3
	note A#3
	audio_wait_54
	wave WAVE_0A
	volume 120
	note NOTE_DURATION_1, G_2, 31
	audio_wait_3
	note D#0
	audio_wait_3
	note A_5
	audio_wait_12
	note G_2
	audio_wait_3
	note D#0
	audio_wait_3
	note A_5
	audio_wait_12
	note G_2
	audio_wait_3
	note D#0
	audio_wait_3
	note A_5
	audio_wait_12
	note G_2
	audio_wait_3
	note D#0
	audio_wait_3
	note A_5
	audio_wait_12
	note G_2
	audio_wait_3
	note D#0
	audio_wait_3
	note A_5
	audio_wait_28
	volume 120
	wave WAVE_0B
	note NOTE_DURATION_2, G_4, 31
	audio_wait_2
	note NOTE_DURATION_16, G_5
	audio_wait_16
	audio_end

Sfx_03e:
	db 1, 0
	dw Sfx_03e_Ch1

Sfx_03f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 0
	volume 120
	pitch_offset 0
	note NOTE_DURATION_5, C#4, 24
	audio_wait_6
	note D_4
	audio_wait_6
	volume 94
	note NOTE_DURATION_4, C#4, 19
	audio_wait_6
	note D_4
	audio_wait_6
	volume 75
	note NOTE_DURATION_3, C#4, 17
	audio_wait_6
	note D_4
	audio_wait_6
	volume 56
	note NOTE_DURATION_3, C#4, 14
	audio_wait_6
	note D_4
	audio_wait_6
	volume 37
	note NOTE_DURATION_3, C#4, 9
	audio_wait_6
	note D_4
	audio_wait_3
	audio_end

Sfx_03f_Ch2:
	semitone_offset 0
	wave WAVE_14
	volume 120
	vibrato_amplitude 0
	pitch_offset 0
	note NOTE_DURATION_5, G_3, 24
	audio_wait_6
	note G#3
	audio_wait_6
	volume 94
	note NOTE_DURATION_4, G_3, 19
	audio_wait_6
	note G#3
	audio_wait_6
	volume 75
	note NOTE_DURATION_3, G_3, 17
	audio_wait_6
	note G#3
	audio_wait_6
	volume 56
	note NOTE_DURATION_3, G_3, 14
	audio_wait_6
	note G#3
	audio_wait_6
	volume 37
	note NOTE_DURATION_3, G_3, 9
	audio_wait_6
	note G#3
	audio_wait_3
	audio_end

Sfx_03f:
	db 2, 0
	dw Sfx_03f_Ch1
	dw Sfx_03f_Ch2

Sfx_040_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	vibrato_amplitude 30
	volume 94
	note NOTE_DURATION_16, C_3, 17
	audio_wait_16
	audio_end

Sfx_040:
	db 1, 0
	dw Sfx_040_Ch1

Sfx_041_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 103
	note NOTE_DURATION_2, B_3, 19
	audio_wait_4
	note C_5
	audio_wait_4
	note A#3
	audio_wait_4
	note A#4
	audio_wait_4
	note A_3
	audio_wait_4
	note F_4
	audio_wait_4
	note C_4
	audio_wait_4
	note F#3
	audio_wait_4
	note C_4
	audio_wait_4
	note E_4
	audio_wait_4
	note D_5
	audio_wait_4
	note E_4
	audio_wait_2
	audio_end

Sfx_041:
	db 1, 0
	dw Sfx_041_Ch1

Sfx_042_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_8, C_5, 9
	audio_wait_8
	note D#5
	audio_wait_8
	note D_5, 17
	audio_wait_8
	note D#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note D#5, 24
	audio_wait_8
	note D_5, 19
	audio_wait_8
	note D#5, 12
	audio_wait_8
	note C_5, 9
	audio_wait_8
	note D#5
	audio_wait_8
	note D_5, 17
	audio_wait_8
	note D#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note D#5, 24
	audio_wait_8
	note D_5, 19
	audio_wait_8
	note D#5, 12
	audio_wait_8
	audio_end

Sfx_042:
	db 1, 0
	dw Sfx_042_Ch1

Sfx_043_Ch1:
	volume 66
	semitone_offset 0
	tempo 74
	wave WAVE_10
	pitch_offset 6
	note NOTE_DURATION_15, C_3, 14
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_1
	note NOTE_DURATION_15, C_3, 4
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_10
	note E_2
	audio_wait_1
	note NOTE_DURATION_15, C_3, 14
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_1
	note NOTE_DURATION_15, C_3, 4
	audio_wait_8
	pitch_offset 12
	audio_wait_1
	note D#3
	audio_wait_1
	note E_4
	audio_wait_1
	note B_4
	audio_wait_1
	note F_5
	audio_wait_2
	note A#6
	audio_wait_10
	note E_2
	audio_wait_1
	audio_end

Sfx_043:
	db 1, 0
	dw Sfx_043_Ch1

Sfx_044_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 94
	audio_wait_28
	note NOTE_DURATION_1, G_1, 29
	audio_wait_1
	note G#1
	audio_wait_1
	note A_1
	audio_wait_1
	note A#1
	audio_wait_1
	note B_1
	audio_wait_1
	note C_2
	audio_wait_1
	note C#2
	audio_wait_1
	note D_2
	audio_wait_1
	note D#2
	audio_wait_1
	note E_2
	audio_wait_1
	note F_2
	audio_wait_1
	note F#2
	audio_wait_1
	note G_2
	audio_wait_1
	note NOTE_DURATION_1, G#2, 7
	audio_wait_1
	note A_2
	audio_wait_1
	note A#2
	audio_wait_1
	note B_2, 5
	audio_wait_1
	note C_3
	audio_wait_1
	note C#3, 3
	audio_wait_1
	note D_3
	audio_wait_1
	note D#3, 1
	audio_wait_1
	note E_3
	audio_wait_1
	note F_3
	audio_wait_1
	note F#3, 0
	audio_wait_1
	note G_3
	audio_wait_66
	note G_3, 29
	audio_wait_1
	note F#3
	audio_wait_1
	note F_3
	audio_wait_1
	note E_3
	audio_wait_1
	note D#3
	audio_wait_1
	note D_3
	audio_wait_1
	note D#3
	audio_wait_1
	note C_3
	audio_wait_1
	note B_2
	audio_wait_1
	note A#2
	audio_wait_1
	note A_2
	audio_wait_1
	note G#2
	audio_wait_1
	note G_2
	audio_wait_1
	note NOTE_DURATION_1, F#2, 7
	audio_wait_1
	note F_2
	audio_wait_1
	note E_2
	audio_wait_1
	note D#2, 5
	audio_wait_1
	note D_2
	audio_wait_1
	note C#2, 3
	audio_wait_1
	note C_2
	audio_wait_1
	audio_end

Sfx_044:
	db 1, 0
	dw Sfx_044_Ch1

Sfx_045_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_2, D#2, 19
	audio_wait_3
	note F_2
	audio_wait_3
	note G_2
	audio_wait_3
	note A_2
	audio_wait_3
	note B_2
	audio_wait_3
	note C#3
	audio_wait_3
	note D#3
	audio_wait_3
	note F_3
	audio_wait_3
	note G_3
	audio_wait_3
	note A_3
	audio_wait_3
	note B_3
	audio_wait_3
	note A_3
	audio_wait_3
	note G_3
	audio_wait_3
	note F_3
	audio_wait_3
	note D#3
	audio_wait_3
	note C#3
	audio_wait_3
	note B_2
	audio_wait_3
	note A_2
	audio_wait_3
	note F_2
	audio_wait_3
	note D#2
	audio_wait_3
	audio_end

Sfx_045_Ch2:
	semitone_offset 0
	wave WAVE_1A
	volume 94
	note NOTE_DURATION_2, A_2, 19
	audio_wait_3
	note B_2
	audio_wait_3
	note C#3
	audio_wait_3
	note D#3
	audio_wait_3
	note F_3
	audio_wait_3
	note G_3
	audio_wait_3
	note A_3
	audio_wait_3
	note B_3
	audio_wait_3
	note C#4
	audio_wait_3
	note D#4
	audio_wait_3
	note F_4
	audio_wait_3
	note D#4
	audio_wait_3
	note C#4
	audio_wait_3
	note B_3
	audio_wait_3
	note A_3
	audio_wait_3
	note G_3
	audio_wait_3
	note F_3
	audio_wait_3
	note D#3
	audio_wait_3
	note C#3
	audio_wait_3
	note B_2
	audio_wait_3
	audio_end

Sfx_045_Ch3:
	semitone_offset 0
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F#1, 31
	audio_wait_10
	note NOTE_DURATION_8, F#1, 4
	audio_wait_10
	audio_end

Sfx_045:
	db 3, 0
	dw Sfx_045_Ch1
	dw Sfx_045_Ch2
	dw Sfx_045_Ch3

Sfx_046_Ch1:
	semitone_offset 1
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_2, D#2, 19
	audio_wait_3
	note F_2
	audio_wait_3
	note G_2
	audio_wait_3
	note A_2
	audio_wait_3
	note B_2
	audio_wait_3
	note C#3
	audio_wait_3
	note D#3
	audio_wait_3
	note F_3
	audio_wait_3
	note G_3
	audio_wait_3
	note A_3
	audio_wait_3
	note B_3
	audio_wait_3
	note A_3
	audio_wait_3
	note G_3
	audio_wait_3
	note F_3
	audio_wait_3
	note D#3
	audio_wait_3
	note C#3
	audio_wait_3
	note B_2
	audio_wait_3
	note A_2
	audio_wait_3
	note F_2
	audio_wait_3
	note D#2
	audio_wait_3
	note C#2
	audio_wait_3
	audio_end

Sfx_046_Ch2:
	semitone_offset 1
	wave WAVE_1A
	volume 94
	note NOTE_DURATION_2, A_2, 19
	audio_wait_3
	note B_2
	audio_wait_3
	note C#3
	audio_wait_3
	note D#3
	audio_wait_3
	note F_3
	audio_wait_3
	note G_3
	audio_wait_3
	note A_3
	audio_wait_3
	note B_3
	audio_wait_3
	note C#4
	audio_wait_3
	note D#4
	audio_wait_3
	note F_4
	audio_wait_3
	note D#4
	audio_wait_3
	note C#4
	audio_wait_3
	note B_3
	audio_wait_3
	note A_3
	audio_wait_3
	note G_3
	audio_wait_3
	note F_3
	audio_wait_3
	note D#3
	audio_wait_3
	note C#3
	audio_wait_3
	note B_2
	audio_wait_3
	note A_2
	audio_wait_3
	audio_end

Sfx_046_Ch3:
	semitone_offset 0
	wave WAVE_65
	volume 120
	audio_wait_32
	note NOTE_DURATION_8, G#1, 31
	audio_wait_10
	note NOTE_DURATION_8, G#1, 9
	audio_wait_10
	audio_end

Sfx_046:
	db 3, 0
	dw Sfx_046_Ch1
	dw Sfx_046_Ch2
	dw Sfx_046_Ch3

Sfx_047_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3F
	volume 120
	note NOTE_DURATION_6, G_1, 31
	audio_wait_10
	note NOTE_DURATION_6, G_1, 31
	audio_wait_30
	wave WAVE_36
	note NOTE_DURATION_4, F_1, 31
	audio_wait_16
	wave WAVE_10
	volume 90
	pitch_offset_mult 14
	pitch_offset 0
	note NOTE_DURATION_7, C_1, 27
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_7, C_1, 19
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_7, C_1, 19
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_56
	pitch_offset 0
	wave WAVE_6A
	volume 127
	note NOTE_DURATION_1, D_2, 31
	audio_wait_3
	note 14
	audio_wait_3
	note 14
	audio_wait_3
	audio_end

Sfx_047:
	db 1, 0
	dw Sfx_047_Ch1

Sfx_048_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	pitch_offset 8
	note NOTE_DURATION_10, F#0, 31
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 12
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 7
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2
	audio_end

Sfx_048_Ch2:
	semitone_offset 0
	volume 94
	wave WAVE_65
	note NOTE_DURATION_5, D_4, 29
	audio_wait_5
	wave WAVE_68
	note NOTE_DURATION_5, D_4, 29
	audio_wait_5
	wave WAVE_65
	note NOTE_DURATION_16, D_4, 29
	audio_wait_16
	note NOTE_DURATION_5, D_4, 27
	audio_wait_5
	note 24
	audio_wait_5
	note 23
	audio_wait_5
	note 21
	audio_wait_5
	note 17
	audio_wait_5
	wave WAVE_66
	note NOTE_DURATION_5, D_4, 17
	audio_wait_5
	audio_end

Sfx_048:
	db 2, 0
	dw Sfx_048_Ch1
	dw Sfx_048_Ch2

Sfx_049_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_2, D#3, 31
	audio_wait_6
	note C_4
	audio_wait_2
	audio_end

Sfx_049:
	db 1, 0
	dw Sfx_049_Ch1

Sfx_CrouchWalk_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	audio_wait_1
	note NOTE_DURATION_1, B_4, 24
	audio_wait_6
	note F#3
	audio_wait_14
	audio_end

Sfx_CrouchWalk:
	db 1, 0
	dw Sfx_CrouchWalk_Ch1

Sfx_ColourCoin_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 113
	note NOTE_DURATION_2, C_3, 21
	audio_wait_3
	note G_3
	audio_wait_3
	note C_4
	audio_wait_3
	note B_3
	audio_wait_3
	note A#3
	audio_wait_3
	note A_3
	audio_wait_3
	note G#3
	audio_wait_3
	note G_3
	audio_wait_3
	note F#3
	audio_wait_3
	note C_3
	audio_wait_3
	note G_3
	audio_wait_3
	note C_4
	audio_wait_3
	note E_4
	audio_wait_3
	note C_3, 9
	audio_wait_3
	note G_3
	audio_wait_3
	note C_4
	audio_wait_3
	note E_4
	audio_wait_3
	note C_3, 2
	audio_wait_3
	note G_3
	audio_wait_3
	note C_4
	audio_wait_3
	note E_4
	audio_wait_3
	audio_end

Sfx_ColourCoin:
	db 1, 0
	dw Sfx_ColourCoin_Ch1

Sfx_04c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_11
	volume 120
	note NOTE_DURATION_8, C_5, 9
	audio_wait_8
	note D#5
	audio_wait_8
	note D_5, 17
	audio_wait_8
	note D#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note D#5, 24
	audio_wait_8
	note D_5, 19
	audio_wait_8
	note D#5, 12
	audio_wait_8
	note C_5, 9
	audio_wait_8
	note D#5
	audio_wait_8
	note D_5, 17
	audio_wait_8
	note D#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note D#5, 24
	audio_wait_8
	note D_5, 19
	audio_wait_8
	note D#5, 12
	audio_wait_8
	audio_end

Sfx_04c_Ch2:
	semitone_offset 0
	wave WAVE_60
	volume 66
	audio_wait_6
	note NOTE_DURATION_8, C_5, 9
	audio_wait_8
	note D#5
	audio_wait_8
	note D_5, 17
	audio_wait_8
	note D#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note D#5, 24
	audio_wait_8
	note D_5, 19
	audio_wait_8
	note D#5, 12
	audio_wait_8
	note C_5, 9
	audio_wait_8
	note D#5
	audio_wait_8
	note D_5, 17
	audio_wait_8
	note D#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note D#5, 24
	audio_wait_8
	note D_5, 19
	audio_wait_8
	note D#5, 12
	audio_wait_8
	audio_end

Sfx_04c:
	db 2, 0
	dw Sfx_04c_Ch1
	dw Sfx_04c_Ch2

Sfx_061_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_9, G_1, 26
	audio_wait_9
	volume 94
	note NOTE_DURATION_8, 18
	audio_wait_9
	volume 66
	note NOTE_DURATION_8
	audio_wait_9
	volume 47
	note NOTE_DURATION_8
	audio_wait_9
	volume 28
	note NOTE_DURATION_8
	audio_wait_8
	audio_end

Sfx_061:
	db 1, 0
	dw Sfx_061_Ch1

Sfx_062_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 94
	note NOTE_DURATION_1, F_2, 29
	audio_wait_3
	note NOTE_DURATION_1, 4
	audio_wait_3
	note NOTE_DURATION_1, F_2, 12
	audio_wait_3
	note NOTE_DURATION_1, 1
	audio_wait_3
	audio_end

Sfx_Click:
	db 1, 0
	dw Sfx_062_Ch1

Sfx_063_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_9, F#1, 26
	audio_wait_10
	volume 94
	note NOTE_DURATION_8, 18
	audio_wait_10
	volume 66
	note NOTE_DURATION_8
	audio_wait_10
	volume 47
	note NOTE_DURATION_8
	audio_wait_10
	volume 28
	note NOTE_DURATION_8
	audio_wait_9
	audio_end

Sfx_063:
	db 1, 0
	dw Sfx_063_Ch1

Sfx_064_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	vibrato_amplitude 30
	pitch_offset_mult 7
	pitch_offset 24
	note NOTE_DURATION_48, C_1, 24
	audio_wait_1
	pitch_offset 32
	audio_wait_1
	note C_4
	audio_wait_1
	note E_4
	audio_wait_1
	note F#4
	audio_wait_1
	note A_4
	audio_wait_1
	note C#5
	audio_wait_1
	note A_5
	audio_wait_1
	note C#6
	audio_wait_1
	note E_6
	audio_wait_1
	note F#6
	audio_wait_1
	note G#6
	audio_wait_1
	note A_6
	audio_wait_1
	note B_6
	audio_wait_2
	note C#7
	audio_wait_1
	note D#7
	audio_wait_1
	note F_7
	audio_wait_1
	note G_7
	audio_wait_16
	note C#7
	audio_wait_1
	note G#6
	audio_wait_1
	note D_6
	audio_wait_1
	note G#5
	audio_wait_1
	note G#4
	audio_wait_1
	note C#4
	audio_wait_1
	note G#3
	audio_wait_1
	note E_3
	audio_wait_1
	note B_2
	audio_wait_1
	note A_2
	audio_wait_1
	note G#2
	audio_wait_1
	note G_2
	audio_wait_6
	note F_2
	audio_wait_1
	note E_2
	audio_end

Sfx_064:
	db 1, 0
	dw Sfx_064_Ch1

Sfx_065_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	vibrato_amplitude 0
	note NOTE_DURATION_6, A_1, 31
	audio_wait_12
	note NOTE_DURATION_2, 18
	audio_wait_2
	audio_end

Sfx_065:
	db 1, 0
	dw Sfx_065_Ch1

Sfx_066_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_40
	volume 94
	note NOTE_DURATION_1, F_1, 27
	audio_wait_8
	note NOTE_DURATION_1, F_1, 12
	audio_wait_8
	audio_end

Sfx_066:
	db 1, 0
	dw Sfx_066_Ch1

Sfx_067_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_43
	volume 75
	note NOTE_DURATION_24, C_3, 19
	audio_wait_10
	pitch_offset 2
	audio_wait_1
	note G_2
	audio_wait_1
	note G_3
	audio_wait_1
	note C_5
	audio_wait_1
	note E_7
	audio_wait_1
	note G_7
	audio_wait_19
	note E_2
	audio_end

Sfx_067:
	db 1, 0
	dw Sfx_067_Ch1

Sfx_068_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 113
	note NOTE_DURATION_6, E_1, 19
	audio_wait_6
	wave WAVE_65
	note NOTE_DURATION_12, E_1, 24
	audio_wait_12
	note NOTE_DURATION_12, E_1, 29
	audio_wait_12
	audio_end

Sfx_068:
	db 1, 0
	dw Sfx_068_Ch1

Sfx_069_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3E
	volume 85
	pitch_offset -74
	note NOTE_DURATION_16, C_1, 22
	audio_wait_16
	audio_end

Sfx_069:
	db 1, 0
	dw Sfx_069_Ch1

Sfx_06a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 56
	pitch_offset_mult 14
	pitch_offset 0
	note NOTE_DURATION_7, B_2, 14
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	audio_end

Sfx_06a:
	db 1, 0
	dw Sfx_06a_Ch1

Sfx_06b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_5D
	volume 103
	note NOTE_DURATION_1, B_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note 24
	audio_wait_1
	note 12
	audio_wait_2
	audio_end

Sfx_06b:
	db 1, 0
	dw Sfx_06b_Ch1

Sfx_06c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	vibrato_amplitude 0
	pitch_offset 8
	note NOTE_DURATION_20, D#0, 31
	audio_wait_2
	pitch_offset 8
	audio_wait_2
	note G#2
	audio_wait_2
	note C_2
	audio_wait_2
	note G#0
	audio_wait_2
	note D#0
	audio_wait_2
	note 27
	audio_wait_2
	note 22
	audio_wait_2
	note 21
	audio_wait_2
	note 20
	audio_wait_2
	note E_2, NOTE_DURATION_20, 19
	audio_wait_2
	pitch_offset 8
	audio_wait_2
	note G#2
	audio_wait_2
	note C_2
	audio_wait_2
	note G#0
	audio_wait_2
	note D#0
	audio_wait_2
	note 27
	audio_wait_2
	note 22
	audio_wait_2
	note 21
	audio_wait_2
	note 20
	audio_wait_2
	note E_2, NOTE_DURATION_20, 12
	audio_wait_2
	pitch_offset 8
	audio_wait_2
	note G#2
	audio_wait_2
	note C_2
	audio_wait_2
	note G#0
	audio_wait_2
	note D#0
	audio_wait_2
	note 27
	audio_wait_2
	note 22
	audio_wait_2
	note 21
	audio_wait_2
	note 20
	audio_wait_2
	note E_2, NOTE_DURATION_20, 7
	audio_wait_2
	pitch_offset 8
	audio_wait_2
	note G#2
	audio_wait_2
	note C_2
	audio_wait_2
	note G#0
	audio_wait_2
	note D#0
	audio_wait_2
	note 27
	audio_wait_2
	note 22
	audio_wait_2
	note 21
	audio_wait_2
	note 20
	audio_wait_2
	note E_2
	audio_end

Sfx_06c:
	db 1, 0
	dw Sfx_06c_Ch1

Sfx_06d_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	vibrato_amplitude 0
	volume 120
	note NOTE_DURATION_2, B_1, 31
	audio_wait_8
	note 12
	audio_wait_8
	audio_end

Sfx_06d:
	db 1, 0
	dw Sfx_06d_Ch1

Sfx_06e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_11
	volume 94
	note NOTE_DURATION_2, C#5, 24
	audio_wait_3
	note C_5
	audio_wait_3
	note B_4
	audio_wait_3
	note A#4
	audio_wait_3
	note B_4
	audio_wait_3
	note C_5
	audio_wait_3
	note NOTE_DURATION_10, C#5
	audio_wait_10
	audio_end

Sfx_06e:
	db 1, 0
	dw Sfx_06e_Ch1

Sfx_06f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	volume 94
	note NOTE_DURATION_2, G_2, 24
	audio_wait_2
	note A_2
	audio_wait_2
	note G#2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note B_2
	audio_wait_2
	note A#2
	audio_wait_2
	note C_3
	audio_wait_2
	audio_end

Sfx_06f:
	db 1, 0
	dw Sfx_06f_Ch1

Sfx_070_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 120
	note NOTE_DURATION_1, C#2, 31
	audio_wait_3
	note D_2
	audio_wait_3
	note D#2
	audio_wait_3
	note E_2
	audio_wait_3
	note F_2
	audio_wait_3
	note F#2
	audio_wait_3
	audio_end

Sfx_070:
	db 1, 0
	dw Sfx_070_Ch1

Sfx_071_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 66
	note NOTE_DURATION_2, C_3, 22
	audio_wait_4
	note NOTE_DURATION_3, C_3, 12
	audio_wait_4
	note 22
	audio_wait_4
	note 12
	audio_wait_4
	audio_end

Sfx_071:
	db 1, 2
	dw Sfx_071_Ch1

Sfx_072_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 85
	pitch_offset -50
	note NOTE_DURATION_2, C#2, 19
	audio_wait_3
	note NOTE_DURATION_2, C#3, 19
	audio_wait_3
	note NOTE_DURATION_2, C#2, 19
	audio_wait_3
	wave WAVE_68
	volume 66
	pitch_offset 0
	note NOTE_DURATION_5, D_4, 15
	audio_wait_5
	wave WAVE_65
	note NOTE_DURATION_5, D_4, 13
	audio_wait_5
	note 12
	audio_wait_5
	note 11
	audio_wait_5
	note 8
	audio_wait_5
	note 6
	audio_wait_5
	note 5
	audio_wait_5
	note 3
	audio_wait_5
	audio_end

Sfx_072:
	db 1, 0
	dw Sfx_072_Ch1

Sfx_073_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F#1, 31
	audio_wait_10
	note NOTE_DURATION_8, F#1, 4
	audio_wait_10
	audio_end

Sfx_073:
	db 1, 0
	dw Sfx_073_Ch1

Sfx_074_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0D
	vibrato_amplitude 80
	volume 94
	pitch_offset_mult 5
	pitch_offset 0
	note NOTE_DURATION_30, B_2, 24
	audio_wait_8
	pitch_offset 2
	audio_wait_1
	note F#2
	audio_wait_1
	note A#2
	audio_wait_1
	note B_2
	audio_wait_1
	note C#3
	audio_wait_1
	note D#3
	audio_wait_1
	note E_3
	audio_wait_1
	note G_3
	audio_wait_1
	note A#3
	audio_wait_1
	note D#4
	audio_wait_1
	note F_4
	audio_wait_1
	note B_4
	audio_wait_1
	note D_5
	audio_wait_1
	note A_5
	audio_wait_1
	note C#6
	audio_wait_1
	note A#6
	audio_wait_11
	note NOTE_DURATION_2, 12
	audio_wait_2
	note NOTE_DURATION_2, 7
	audio_wait_2
	audio_end

Sfx_074:
	db 1, 0
	dw Sfx_074_Ch1

Sfx_075_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_40
	vibrato_amplitude 46
	volume 120
	pitch_offset 0
	note NOTE_DURATION_6, F_0, 31
	audio_wait_6
	note NOTE_DURATION_6, G_0, 24
	audio_wait_6
	note NOTE_DURATION_6, C_1, 22
	audio_wait_6
	note NOTE_DURATION_6, C_1, 12
	audio_wait_6
	audio_end

Sfx_075:
	db 1, 0
	dw Sfx_075_Ch1

Sfx_076_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 56
	note NOTE_DURATION_8, C_3, 12
	audio_wait_8
	note NOTE_DURATION_8, C_3, 13
	audio_wait_8
	note NOTE_DURATION_10, C_3, 14
	audio_wait_10
	audio_end

Sfx_076:
	db 1, 0
	dw Sfx_076_Ch1

Sfx_077_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_64
	volume 120
	note NOTE_DURATION_2, F#3, 31
	audio_wait_2
	note F_3
	audio_wait_2
	note F#3
	audio_wait_2
	note F_3
	audio_wait_2
	note F#3
	audio_wait_2
	note F_3
	audio_wait_2
	note E_3
	audio_wait_2
	note E_3, 24
	audio_wait_2
	note E_3, 19
	audio_wait_2
	note E_3, 14
	audio_wait_2
	audio_end

Sfx_077:
	db 1, 0
	dw Sfx_077_Ch1

Sfx_078_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_6, F#1, 31
	audio_wait_6
	note NOTE_DURATION_2, 18
	audio_wait_2
	audio_end

Sfx_078:
	db 1, 0
	dw Sfx_078_Ch1

Sfx_079_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 47
	pitch_offset_mult 7
	note NOTE_DURATION_48, C_2, 12
	audio_wait_4
	pitch_offset 6
	audio_wait_1
	note B_2
	audio_wait_1
	note B_3
	audio_wait_1
	note D_5
	audio_wait_1
	note A#5
	audio_wait_1
	note E_7
	audio_wait_1
	note G_7
	audio_wait_30
	note G_6
	audio_wait_1
	note B_5
	audio_wait_1
	note G_4
	audio_wait_1
	note C_4
	audio_wait_1
	note F_3
	audio_wait_1
	note C#3
	audio_wait_1
	note C_3
	audio_wait_1
	note B_2
	audio_wait_1
	note G#2
	audio_wait_1
	note E_2
	audio_wait_1
	audio_end

Sfx_079:
	db 1, 0
	dw Sfx_079_Ch1

Sfx_07a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, F#1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, F#1, 24
	audio_wait_4
	audio_end

Sfx_07a:
	db 1, 0
	dw Sfx_07a_Ch1

Sfx_07b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 94
	note NOTE_DURATION_8, B_1, 24
	audio_wait_9
	note NOTE_DURATION_8, 14
	audio_wait_9
	note NOTE_DURATION_8, 9
	audio_wait_9
	audio_end

Sfx_07b:
	db 1, 0
	dw Sfx_07b_Ch1

Sfx_07c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0D
	volume 94
	vibrato_amplitude 0
	pitch_offset 8
	note NOTE_DURATION_10, C_3, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 14
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 9
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 4
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2
	audio_end

Sfx_07c_Ch2:
	semitone_offset 0
	wave WAVE_5D
	volume 94
	vibrato_amplitude 0
	pitch_offset 8
	note NOTE_DURATION_10, E_2, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 14
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 9
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 4
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2
	audio_end

Sfx_07c:
	db 2, 0
	dw Sfx_07c_Ch1
	dw Sfx_07c_Ch2

Sfx_07d_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 75
	note NOTE_DURATION_3, G_1, 19
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	audio_end

Sfx_07d:
	db 1, 0
	dw Sfx_07d_Ch1

Sfx_07e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 120
	note NOTE_DURATION_4, A_0, 31
	audio_wait_8
	note NOTE_DURATION_4, A_0, 14
	audio_wait_8
	audio_end

Sfx_07e:
	db 1, 0
	dw Sfx_07e_Ch1

Sfx_07f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 103
	pitch_offset_mult 14
	pitch_offset 0
	note NOTE_DURATION_7, G_1, 27
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_7, G_1, 12
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	audio_end

Sfx_07f:
	db 1, 0
	dw Sfx_07f_Ch1

Sfx_080_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6D
	volume 120
	note NOTE_DURATION_3, B_2, 31
	audio_wait_3
	note A#2
	audio_wait_3
	note A_2
	audio_wait_3
	note B_2
	audio_wait_3
	note A#2
	audio_wait_3
	note A_2
	audio_wait_3
	note B_2
	audio_wait_3
	note A#2
	audio_wait_3
	note A_2
	audio_wait_3
	audio_end

Sfx_080:
	db 1, 0
	dw Sfx_080_Ch1

Sfx_081_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 56
	note NOTE_DURATION_2, G_3, 12
	audio_wait_3
	note E_3
	audio_wait_3
	note F_3
	audio_wait_3
	note D_3
	audio_wait_3
	note G_3
	audio_wait_3
	note E_3
	audio_wait_3
	note F_3
	audio_wait_3
	note D_3
	audio_wait_3
	note G_3
	audio_wait_3
	note E_3
	audio_wait_3
	note F_3
	audio_wait_3
	note D_3
	audio_wait_3
	wave WAVE_10
	volume 60
	pitch_offset_mult 7
	note NOTE_DURATION_76, C#1, 14
	audio_wait_1
	pitch_offset 32
	audio_wait_1
	note C_4
	audio_wait_1
	note E_4
	audio_wait_1
	note F#4
	audio_wait_1
	note A_4
	audio_wait_1
	note C#5
	audio_wait_1
	note A_5
	audio_wait_1
	note C#6
	audio_wait_1
	note E_6
	audio_wait_1
	note F#6
	audio_wait_1
	note G#6
	audio_wait_1
	note A_6
	audio_wait_1
	note B_6
	audio_wait_2
	note C#7
	audio_wait_1
	note D#7
	audio_wait_1
	note F_7
	audio_wait_1
	note G_7
	audio_wait_44
	note C#7
	audio_wait_1
	note G#6
	audio_wait_1
	note D_6
	audio_wait_1
	note G#5
	audio_wait_1
	note G#4
	audio_wait_1
	note C#4
	audio_wait_1
	note G#3
	audio_wait_1
	note E_3
	audio_wait_1
	note B_2
	audio_wait_1
	note A_2
	audio_wait_1
	note G#2
	audio_wait_1
	note G_2
	audio_wait_6
	note F_2
	audio_wait_1
	note E_2
	audio_end

Sfx_081:
	db 1, 0
	dw Sfx_081_Ch1

Sfx_082_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 0
	volume 94
	note NOTE_DURATION_4, E_2, 24
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 19
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 14
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 9
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 4
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	audio_end

Sfx_082_Ch2:
	semitone_offset 0
	wave WAVE_63
	vibrato_amplitude 100
	volume 108
	pitch_offset 0
	note NOTE_DURATION_24, E_2, 27
	audio_wait_3
	pitch_offset 4
	audio_wait_1
	note F#2
	audio_wait_2
	note C_2
	audio_wait_1
	note G#1
	audio_wait_1
	note G#0
	audio_wait_1
	note D_0
	audio_wait_1
	note 34
	audio_wait_1
	note 31
	audio_wait_1
	note 30
	audio_wait_2
	note 31
	audio_wait_1
	note 34
	audio_wait_1
	note F_0
	audio_wait_1
	note A_0
	audio_wait_1
	note C#1
	audio_wait_1
	note E_1
	audio_wait_1
	note G_1
	audio_wait_1
	note G#1
	audio_wait_3
	note 31
	audio_wait_1
	note 34
	audio_wait_1
	note F_0
	audio_wait_1
	note A_0
	audio_wait_1
	note C#1
	audio_wait_1
	note E_1
	audio_wait_1
	note G_1
	audio_wait_1
	note G#1
	audio_wait_3
	audio_end

Sfx_082:
	db 2, 0
	dw Sfx_082_Ch1
	dw Sfx_082_Ch2

Sfx_083_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_12
	volume 94
	pitch_offset_mult 17
	note NOTE_DURATION_13, C_1, 24
	audio_wait_1
	pitch_offset 2
	audio_wait_1
	note E_2
	audio_wait_1
	note D_3
	audio_wait_1
	note G#3
	audio_wait_1
	note E_4
	audio_wait_1
	note D#5
	audio_wait_1
	note G_5
	audio_wait_1
	note E_6
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	note G_7, 15
	audio_wait_1
	note G_7, 7
	audio_wait_1
	note E_2
	audio_end

Sfx_083_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 37
	note NOTE_DURATION_5, C#3, 31
	audio_wait_5
	wave WAVE_65
	note NOTE_DURATION_5, C#3, 24
	audio_wait_5
	note 22
	audio_wait_5
	note 17
	audio_wait_5
	note 12
	audio_wait_5
	note 7
	audio_wait_5
	note 4
	audio_wait_5
	note 2
	audio_wait_5
	audio_end

Sfx_083:
	db 2, 0
	dw Sfx_083_Ch1
	dw Sfx_083_Ch2

Sfx_084_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_42
	volume 94
	pitch_offset -50
	note NOTE_DURATION_13, G#1, 24
	audio_wait_2
	pitch_offset -88
	audio_wait_2
	note 0
	audio_wait_7
	note A#0
	audio_wait_2
	note C#6
	audio_wait_2
	note G_7
	audio_wait_22
	note E_2
	audio_end

Sfx_084:
	db 1, 0
	dw Sfx_084_Ch1

Sfx_085_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_60
	volume 108
	note NOTE_DURATION_1, C#2, 28
	audio_wait_3
	note D#2
	audio_wait_3
	note F_2
	audio_wait_2
	audio_end

Sfx_085:
	db 1, 0
	dw Sfx_085_Ch1

Sfx_086_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	note NOTE_DURATION_1, C#5, 19
	audio_wait_3
	note B_4
	audio_wait_3
	note A_4
	audio_wait_3
	note G_4
	audio_wait_3
	note F_4
	audio_wait_3
	note D#4
	audio_wait_3
	note C#4
	audio_wait_3
	audio_end

Sfx_086:
	db 1, 0
	dw Sfx_086_Ch1

Sfx_087_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 75
	note NOTE_DURATION_2, F_3, 22
	audio_wait_3
	note NOTE_DURATION_2, E_3, 20
	audio_wait_3
	audio_end

Sfx_087:
	db 1, 0
	dw Sfx_087_Ch1

Sfx_088_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0F
	volume 66
	pitch_offset_mult 24
	pitch_offset 0
	note NOTE_DURATION_22, C#5, 17
	audio_wait_3
	pitch_offset -2
	audio_wait_1
	note B_1
	audio_wait_1
	note G#1
	audio_wait_1
	note F_1
	audio_wait_1
	note A#0
	audio_wait_1
	note F_0
	audio_wait_1
	note C#0
	audio_wait_1
	note 33
	audio_wait_1
	note 26
	audio_wait_1
	note 22
	audio_wait_1
	note 19
	audio_wait_1
	note 17
	audio_wait_1
	note 12
	audio_wait_1
	note 10
	audio_wait_1
	note 9
	audio_wait_1
	note 8
	audio_wait_1
	note 9
	audio_wait_1
	note 14
	audio_wait_1
	note 24
	audio_wait_1
	note E_2
	audio_end

Sfx_088_Ch2:
	semitone_offset 0
	wave WAVE_23
	volume 66
	pitch_offset_mult 24
	pitch_offset 0
	note NOTE_DURATION_22, C_4, 17
	audio_wait_3
	pitch_offset -2
	audio_wait_1
	note B_1
	audio_wait_1
	note G#1
	audio_wait_1
	note F_1
	audio_wait_1
	note A#0
	audio_wait_1
	note F_0
	audio_wait_1
	note C#0
	audio_wait_1
	note 33
	audio_wait_1
	note 26
	audio_wait_1
	note 22
	audio_wait_1
	note 19
	audio_wait_1
	note 17
	audio_wait_1
	note 12
	audio_wait_1
	note 10
	audio_wait_1
	note 9
	audio_wait_1
	note 8
	audio_wait_1
	note 9
	audio_wait_1
	note 14
	audio_wait_1
	note 24
	audio_wait_1
	note E_2
	audio_end

Sfx_088:
	db 2, 0
	dw Sfx_088_Ch1
	dw Sfx_088_Ch2

Sfx_089_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 113
	note NOTE_DURATION_12, F_1, 16
	audio_wait_12
	wave WAVE_65
	note NOTE_DURATION_8, F_1, 19
	audio_wait_8
	note NOTE_DURATION_96, F_1, 23
	audio_wait_96
	note NOTE_DURATION_32, F_1, 23
	audio_wait_32
	audio_end

Sfx_089:
	db 1, 0
	dw Sfx_089_Ch1

Sfx_08a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	volume 94
	note NOTE_DURATION_2, G#2, 24
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note A_2
	audio_wait_2
	note G#2
	audio_wait_2
	note G_2
	audio_wait_2
	note F#2
	audio_wait_2
	note G_2
	audio_wait_2
	note G#2
	audio_wait_2
	note A_2
	audio_wait_2
	note A#2
	audio_wait_2
	note B_2
	audio_wait_2
	audio_end

Sfx_08a_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_2, D_2, 24
	audio_wait_2
	note E_2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note F_2
	audio_wait_2
	note E_2
	audio_wait_2
	note D#2
	audio_wait_2
	note D_2
	audio_wait_2
	note D#2
	audio_wait_2
	note E_2
	audio_wait_2
	note F_2
	audio_wait_2
	note F#2
	audio_wait_2
	note G_2
	audio_wait_2
	audio_end

Sfx_08a:
	db 2, 0
	dw Sfx_08a_Ch1
	dw Sfx_08a_Ch2

Sfx_08b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 120
	note NOTE_DURATION_7, C_1, 31
	audio_wait_8
	note NOTE_DURATION_7, B_0, 27
	audio_wait_8
	note NOTE_DURATION_7, A#0, 24
	audio_wait_8
	note NOTE_DURATION_7, A_0, 22
	audio_wait_8
	note NOTE_DURATION_7, G_0, 19
	audio_wait_8
	note NOTE_DURATION_7, F_0, 19
	audio_wait_8
	note NOTE_DURATION_7, E_0, 19
	audio_wait_8
	audio_end

Sfx_08b:
	db 1, 0
	dw Sfx_08b_Ch1

Sfx_08c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 94
	note NOTE_DURATION_2, G_3, 22
	audio_wait_2
	note G#3
	audio_wait_2
	note A_3
	audio_wait_2
	note A#3
	audio_wait_2
	note B_3
	audio_wait_2
	note C_4
	audio_wait_2
	note C#4
	audio_wait_2
	note D_4
	audio_wait_2
	note C#4
	audio_wait_2
	note C_4
	audio_wait_2
	note B_3
	audio_wait_2
	note A#3
	audio_wait_2
	note A_3
	audio_wait_2
	note G#3
	audio_wait_2
	note G_3
	audio_wait_2
	audio_end

Sfx_08c:
	db 1, 0
	dw Sfx_08c_Ch1

Sfx_08d_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	volume 120
	pitch_offset 8
	note NOTE_DURATION_8, A_0, 31
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_8, A#0, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_8, B_0, 12
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_8, C_1, 7
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 20
	audio_wait_1
	note E_2
	audio_end

Sfx_08d:
	db 1, 0
	dw Sfx_08d_Ch1

Sfx_08e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_4A
	volume 94
	note NOTE_DURATION_1, B_4, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C#5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, D_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, B_4, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C#5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, D_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, B_4, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, C_5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, C#5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, D_5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, B_4, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, C_5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, C#5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, D_5, 17
	audio_wait_1
	note 7
	audio_wait_2
	audio_end

Sfx_08e:
	db 1, 0
	dw Sfx_08e_Ch1

Sfx_08f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 85
	pitch_offset 0
	note NOTE_DURATION_5, D_4, 17
	audio_wait_5
	wave WAVE_65
	note NOTE_DURATION_5, D_4, 15
	audio_wait_5
	note 13
	audio_wait_5
	note 11
	audio_wait_5
	note 8
	audio_wait_5
	note 6
	audio_wait_5
	note 5
	audio_wait_5
	note 3
	audio_wait_5
	audio_end

Sfx_08f:
	db 1, 0
	dw Sfx_08f_Ch1

Sfx_0a1_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 75
	note NOTE_DURATION_1, C_2, 24
	audio_wait_1
	note NOTE_DURATION_1, C_2, 7
	audio_wait_1
	note NOTE_DURATION_1, C_3, 19
	audio_wait_1
	note NOTE_DURATION_1, C_3, 7
	audio_wait_1
	note NOTE_DURATION_1, F_3, 14
	audio_wait_1
	note NOTE_DURATION_1, F_3, 4
	audio_wait_1
	note NOTE_DURATION_1, G_2, 9
	audio_wait_1
	note NOTE_DURATION_1, G_2, 4
	audio_wait_1
	note NOTE_DURATION_1, C_3, 7
	audio_wait_1
	note NOTE_DURATION_1, C_3, 2
	audio_wait_1
	note NOTE_DURATION_1, C_3, 7
	audio_wait_1
	note NOTE_DURATION_1, C_3, 2
	audio_wait_1
	note NOTE_DURATION_1, C_3, 7
	audio_wait_1
	note NOTE_DURATION_1, C_3, 2
	audio_wait_1
	audio_end

Sfx_0a1:
	db 1, 0
	dw Sfx_0a1_Ch1

Sfx_0a2_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	pitch_offset_mult 24
	pitch_offset 0
	note NOTE_DURATION_11, B_4, 19
	audio_wait_1
	pitch_offset -2
	audio_wait_1
	note G#1
	audio_wait_1
	note A#0
	audio_wait_1
	note F_0
	audio_wait_1
	note 33
	audio_wait_1
	note 26
	audio_wait_1
	note 17
	audio_wait_1
	note 12
	audio_wait_1
	note 9
	audio_wait_1
	note 24
	audio_wait_1
	note E_2
	audio_end

Sfx_0a2_Ch2:
	semitone_offset 0
	wave WAVE_60
	volume 75
	pitch_offset_mult 24
	pitch_offset 0
	note NOTE_DURATION_11, A#3, 19
	audio_wait_1
	pitch_offset -2
	audio_wait_1
	note G#1
	audio_wait_1
	note A#0
	audio_wait_1
	note F_0
	audio_wait_1
	note 33
	audio_wait_1
	note 26
	audio_wait_1
	note 17
	audio_wait_1
	note 12
	audio_wait_1
	note 9
	audio_wait_1
	note 24
	audio_wait_1
	note E_2
	audio_end

Sfx_0a2:
	db 2, 0
	dw Sfx_0a2_Ch1
	dw Sfx_0a2_Ch2

Sfx_0a3_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3A
	volume 75
	note NOTE_DURATION_20, C_4, 19
	audio_wait_20
	audio_end

Sfx_0a3:
	db 1, 0
	dw Sfx_0a3_Ch1

Sfx_0a4_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_25
	volume 94
	note NOTE_DURATION_2, C_4, 24
	audio_wait_8
	note F_3
	audio_wait_8
	note F#4
	audio_wait_8
	note A_4
	audio_wait_8
	note A_3
	audio_wait_8
	note E_4
	audio_wait_8
	note D_5
	audio_wait_8
	note E_4
	audio_wait_8
	note C_4
	audio_wait_8
	note F#3
	audio_wait_8
	note C_4
	audio_wait_8
	note F_4
	audio_wait_8
	note A#4
	audio_wait_8
	note A#3
	audio_wait_8
	note C_5
	audio_wait_8
	note B_3
	audio_wait_8
	audio_end

Sfx_0a4:
	db 1, 0
	dw Sfx_0a4_Ch1

Sfx_0a5_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_42
	volume 120
	note NOTE_DURATION_7, B_0, 31
	audio_wait_7
	audio_end

Sfx_0a5:
	db 1, 0
	dw Sfx_0a5_Ch1

Sfx_0a6_Ch1:
	semitone_offset 250
	tempo 74
	wave WAVE_63
	volume 120
	pitch_offset_mult 10
	vibrato_amplitude 100
	note NOTE_DURATION_3, G_2, 24
	pitch_offset -2
	audio_wait_1
	note C_2
	audio_wait_1
	note A#1
	audio_wait_1
	note NOTE_DURATION_4, G#2
	pitch_offset -18
	audio_wait_1
	note E_1
	audio_wait_1
	note F#0
	audio_wait_1
	note C#0
	audio_wait_1
	note NOTE_DURATION_4, A_2
	pitch_offset -64
	audio_wait_1
	note 23
	audio_wait_1
	note 18
	audio_wait_1
	note 14
	audio_wait_1
	note NOTE_DURATION_4, A#2
	pitch_offset -106
	audio_wait_1
	note 5
	audio_wait_1
	note 4
	audio_wait_1
	note 3
	audio_wait_1
	note NOTE_DURATION_9, B_2
	pitch_offset -120
	audio_wait_3
	note 6
	audio_wait_3
	note E_2
	audio_wait_3
	audio_end

Sfx_0a6:
	db 1, 0
	dw Sfx_0a6_Ch1

Sfx_0a7_Ch1:
	semitone_offset 6
	tempo 74
	wave WAVE_63
	volume 120
	note NOTE_DURATION_2, C_1, 31, D_1
	audio_wait_2
	note E_1
	audio_wait_2
	note C#1
	audio_wait_2
	note D#1, F_1
	audio_wait_2
	note D_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1, F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note G_1
	audio_wait_2
	note E_1, F#1
	audio_wait_2
	note G#1
	audio_wait_2
	note F_1
	audio_wait_2
	note G_1, A_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1, A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note B_1
	audio_wait_2
	note F#1, G#1
	audio_wait_2
	note A#1
	audio_wait_2
	note F_1
	audio_wait_2
	note G_1, A_1
	audio_wait_2
	note E_1
	audio_wait_2
	note F#1
	audio_wait_2
	note D#1, G#1
	audio_wait_2
	note F_1
	audio_wait_2
	note G_1
	audio_wait_2
	note D_1, E_1
	audio_wait_2
	note F#1
	audio_wait_2
	note C#1
	audio_wait_2
	note D#1, F_1
	audio_wait_2
	note C_1
	audio_wait_2
	note D_1
	audio_wait_2
	note E_1
	audio_end

Sfx_0a7:
	db 1, 0
	dw Sfx_0a7_Ch1

Sfx_0a8_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 75
	note NOTE_DURATION_4, G_2, 19
	audio_wait_4
	note F_2
	audio_wait_4
	note E_2
	audio_wait_4
	note D_2
	audio_wait_4
	note C_2
	audio_wait_4
	note B_1
	audio_wait_4
	note A_1
	audio_wait_4
	note G_1
	audio_wait_4
	note F_1
	audio_wait_4
	note E_1
	audio_wait_4
	note D_1
	audio_wait_4
	note C_1
	audio_wait_4
	note D_1
	audio_wait_4
	note E_1
	audio_wait_4
	note F_1
	audio_wait_4
	note G_1
	audio_wait_4
	note A_1
	audio_wait_4
	note B_1
	audio_wait_4
	note C_2
	audio_wait_4
	note D_2
	audio_wait_4
	note E_2
	audio_wait_4
	note F_2
	audio_wait_4
	note G_2
	audio_wait_4
	note A_2
	audio_wait_4
	audio_end

Sfx_0a8_Ch2:
	semitone_offset 0
	wave WAVE_3A
	volume 120
	note NOTE_DURATION_96, G_1, 31
	audio_wait_96
	audio_end

Sfx_0a8:
	db 2, 0
	dw Sfx_0a8_Ch1
	dw Sfx_0a8_Ch2

Sfx_0a9_Ch1:
	semitone_offset 3
	tempo 74
	wave WAVE_63
	vibrato_amplitude 50
	volume 120
	note NOTE_DURATION_2, C_2, 31
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note D_1
	audio_wait_2
	note D#1
	audio_wait_2
	note D_1
	audio_wait_2
	note C#1
	audio_wait_2
	note D_1
	audio_wait_2
	note C#1
	audio_wait_2
	note C_1
	audio_wait_2
	note C#1
	audio_wait_2
	note C_1
	audio_wait_2
	note B_0
	audio_wait_2
	audio_end

Sfx_0a9:
	db 1, 0
	dw Sfx_0a9_Ch1

Sfx_0aa_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_45
	volume 120
	note NOTE_DURATION_6, F#3, 31
	audio_wait_6
	note NOTE_DURATION_2, F#3, 19
	audio_wait_2
	note NOTE_DURATION_2, F#3, 14
	audio_wait_2
	note NOTE_DURATION_2, F#3, 9
	audio_wait_2
	audio_end

Sfx_0aa_Ch2:
	semitone_offset 0
	wave WAVE_6A
	volume 94
	note NOTE_DURATION_7, G#1, 24
	audio_wait_8
	note NOTE_DURATION_5, G#1, 9
	audio_wait_6
	note NOTE_DURATION_4, G_1, 4
	audio_wait_5
	audio_end

Sfx_0aa:
	db 2, 0
	dw Sfx_0aa_Ch1
	dw Sfx_0aa_Ch2

Sfx_0ab_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 56
	pitch_offset_mult 14
	pitch_offset 0
	note NOTE_DURATION_7, B_2, 14
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	audio_end

Sfx_0ab:
	db 1, 0
	dw Sfx_0ab_Ch1

Sfx_0ac_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	vibrato_amplitude 0
	volume 75
	pitch_offset 0
	note NOTE_DURATION_28, C_3, 19
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2, NOTE_DURATION_28, C_2, 17
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2, NOTE_DURATION_28, B_2, 15
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2, NOTE_DURATION_28, B_1, 13
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2, NOTE_DURATION_28, A#2, 11
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2, NOTE_DURATION_28, A#1, 9
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2, NOTE_DURATION_28, A_2, 7
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2, NOTE_DURATION_28, G_1, 5
	audio_wait_2
	pitch_offset 2
	audio_wait_2
	note A_2
	audio_wait_2
	note C_3
	audio_wait_2
	note D#3
	audio_wait_2
	note F#3
	audio_wait_2
	note D_4
	audio_wait_2
	note F#4
	audio_wait_2
	note D_5
	audio_wait_2
	note G_5
	audio_wait_2
	note E_6
	audio_wait_2
	note G#6
	audio_wait_2
	note C_7
	audio_wait_2
	note G_7
	audio_wait_2
	note E_2
	audio_end

Sfx_0ac:
	db 1, 0
	dw Sfx_0ac_Ch1

Sfx_0ad_Ch1:
	semitone_offset 1
	tempo 74
	wave WAVE_32
	volume 113
	note NOTE_DURATION_4, F_1, 29
	audio_wait_5
	note NOTE_DURATION_4
	audio_wait_5
	note NOTE_DURATION_4, A_1
	audio_wait_5
	audio_end

Sfx_0ad:
	db 1, 0
	dw Sfx_0ad_Ch1

Sfx_0ae_Ch1:
	semitone_offset 2
	tempo 74
	wave WAVE_3B
	volume 85
	note NOTE_DURATION_6, C_2, 19
	audio_wait_12
	wave WAVE_42
	note NOTE_DURATION_6, C_2, 19
	audio_wait_12
	audio_end

Sfx_0ae:
	db 1, 0
	dw Sfx_0ae_Ch1

Sfx_0af_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_44
	volume 120
	note NOTE_DURATION_2, C_2, 31
	audio_wait_4
	note B_1
	audio_wait_4
	note C_2
	audio_wait_4
	note B_1
	audio_wait_4
	audio_end

Sfx_0af:
	db 1, 0
	dw Sfx_0af_Ch1

Sfx_0b0_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 66
	pitch_offset_mult 7
	vibrato_amplitude 10
	note NOTE_DURATION_40, F_2, 17
	audio_wait_4
	pitch_offset -6
	audio_wait_1
	note A_1
	audio_wait_1
	note A_0
	audio_wait_1
	note 30
	audio_wait_1
	note 22
	audio_wait_1
	note 4
	audio_wait_1
	note 1
	audio_wait_20
	note 13
	audio_wait_1
	note 21
	audio_wait_1
	note C#0
	audio_wait_1
	note G#0
	audio_wait_1
	note D#1
	audio_wait_1
	note G_1
	audio_wait_1
	note G#1
	audio_wait_1
	note A_1
	audio_wait_1
	note C_2
	audio_wait_1
	note E_2
	audio_wait_1
	audio_end

Sfx_0b0_Ch2:
	semitone_offset 0
	wave WAVE_40
	volume 120
	pitch_offset 0
	note NOTE_DURATION_12, C_2, 31
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 43
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 39
	pitch_offset -8
	audio_wait_1
	vibrato_amplitude 32
	pitch_offset -40
	audio_wait_1
	note D#0
	audio_wait_1
	vibrato_amplitude 24
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 11
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 7
	pitch_offset -86
	audio_wait_1
	vibrato_amplitude 6
	pitch_offset -88
	audio_wait_1
	note 19
	audio_wait_1
	vibrato_amplitude 4
	audio_wait_1
	note 7
	pitch_offset 0
	note NOTE_DURATION_12, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 21
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 33
	pitch_offset -8
	audio_wait_1
	vibrato_amplitude 41
	pitch_offset -40
	audio_wait_1
	vibrato_amplitude 49
	pitch_offset -50
	audio_wait_1
	vibrato_amplitude 51
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 54
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 53
	pitch_offset -86
	audio_wait_1
	note 20
	audio_wait_1
	vibrato_amplitude 43
	pitch_offset -90
	audio_wait_1
	vibrato_amplitude 37
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_12, 12
	audio_wait_1
	vibrato_amplitude 25
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 22
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	vibrato_amplitude 26
	pitch_offset -50
	audio_wait_1
	vibrato_amplitude 34
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 46
	pitch_offset -84
	audio_wait_1
	note 21
	audio_wait_1
	vibrato_amplitude 77
	pitch_offset -88
	audio_wait_1
	vibrato_amplitude 81
	pitch_offset -90
	audio_wait_2
	note E_2, NOTE_DURATION_12, 7
	audio_wait_1
	vibrato_amplitude 77
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 68
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	vibrato_amplitude 55
	pitch_offset -40
	audio_wait_1
	vibrato_amplitude 28
	pitch_offset -50
	audio_wait_1
	note 27
	audio_wait_1
	vibrato_amplitude 18
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 12
	pitch_offset -86
	audio_wait_1
	note 20
	audio_wait_1
	vibrato_amplitude 15
	pitch_offset -90
	audio_wait_2
	vibrato_amplitude 37
	audio_wait_1
	note E_1
	audio_wait_1
	note G_2
	audio_wait_1
	note C#3
	audio_wait_1
	note D#3
	audio_wait_1
	note C#3
	audio_wait_1
	note G#2
	audio_wait_1
	note C#2
	audio_wait_1
	note F_1
	audio_wait_1
	note G#0
	audio_wait_1
	note C#0
	audio_wait_1
	note 32
	audio_wait_1
	note 31
	audio_wait_3
	note 34
	audio_wait_1
	note A#0
	audio_wait_1
	note C_2
	audio_wait_1
	note D#3
	audio_wait_1
	note B_3
	audio_wait_1
	note E_4
	audio_wait_1
	note F#4
	audio_wait_2
	note F_4
	audio_wait_1
	note B_3
	audio_wait_1
	note E_3
	audio_wait_1
	note G#2
	audio_wait_1
	note C#2
	audio_wait_2
	note F_1
	audio_wait_1
	note B_0
	audio_wait_1
	note F#0
	audio_wait_1
	note D_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 33
	audio_wait_1
	note 32
	audio_wait_1
	note 31
	audio_end

Sfx_0b0:
	db 2, 0
	dw Sfx_0b0_Ch1
	dw Sfx_0b0_Ch2

Sfx_0b1_Ch1:
	semitone_offset 5
	tempo 74
	wave WAVE_6F
	volume 120
	note NOTE_DURATION_2, C_2, 31
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note A#1
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	audio_end

Sfx_0b1:
	db 1, 0
	dw Sfx_0b1_Ch1

Sfx_0b2_Ch1:
	semitone_offset 5
	tempo 74
	wave WAVE_6F
	volume 120
	note NOTE_DURATION_2, F#1, 31
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note C_2
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note A#1
	audio_wait_2
	note B_1
	audio_wait_2
	note E_2
	audio_wait_2
	note D#2
	audio_wait_2
	note D_2
	audio_wait_2
	note C#2
	audio_wait_2
	note C#2
	audio_wait_2
	note D_2
	audio_wait_2
	audio_end

Sfx_0b2_Ch2:
	semitone_offset 2
	wave WAVE_65
	volume 94
	note NOTE_DURATION_3, C_2, 24
	audio_wait_3
	note C#2
	audio_wait_3
	note D_2
	audio_wait_3
	note D#2
	audio_wait_3
	note NOTE_DURATION_3, C#2, 22
	audio_wait_3
	note D_2
	audio_wait_3
	note D#2
	audio_wait_3
	note E_2
	audio_wait_3
	note NOTE_DURATION_3, D_2, 19
	audio_wait_3
	note D#2
	audio_wait_3
	note E_2
	audio_wait_3
	note F_2
	audio_wait_3
	note NOTE_DURATION_3, D#2, 17
	audio_wait_3
	note E_2
	audio_wait_3
	note F_2
	audio_wait_3
	note F#2
	audio_wait_3
	note NOTE_DURATION_3, E_2, 14
	audio_wait_3
	note F_2
	audio_wait_3
	note F#2
	audio_wait_3
	note G_2
	audio_wait_3
	note NOTE_DURATION_3, F_2, 12
	audio_wait_3
	note F#2
	audio_wait_3
	note G_2
	audio_wait_3
	note G#2
	audio_wait_3
	note NOTE_DURATION_3, F#2, 9
	audio_wait_3
	note G_2
	audio_wait_3
	note G#2
	audio_wait_3
	note A_2
	audio_wait_3
	note NOTE_DURATION_3, G_2, 7
	audio_wait_3
	note G#2
	audio_wait_3
	note A_2
	audio_wait_3
	note A#2
	audio_wait_3
	audio_end

Sfx_0b2:
	db 2, 0
	dw Sfx_0b2_Ch1
	dw Sfx_0b2_Ch2

Sfx_0b3_Ch1:
	volume 120
	semitone_offset 0
	tempo 74
	wave WAVE_63
	vibrato_amplitude 100
	pitch_offset_mult 10
	pitch_offset 0
	note NOTE_DURATION_28, C_1, 29
	pitch_offset -18
	audio_wait_2
	note A#0
	audio_wait_2
	note E_0
	audio_wait_2
	note C#0
	audio_wait_2
	note 34
	audio_wait_2
	note 30
	audio_wait_2
	note 27
	audio_wait_2
	note 25
	audio_wait_2
	note 22
	audio_wait_2
	note 20
	audio_wait_2
	note 16
	audio_wait_2
	note 13
	audio_wait_2
	note 5
	audio_wait_2
	note 2
	audio_wait_2
	audio_end

Sfx_0b3:
	db 1, 0
	dw Sfx_0b3_Ch1

Sfx_0b4_Ch1:
	semitone_offset 244
	tempo 74
	wave WAVE_63
	volume 120
	vibrato_amplitude 100
	note NOTE_DURATION_4, G_2, 24
	audio_wait_2
	pitch_offset -2
	audio_wait_1
	note C_2
	audio_wait_1
	note A#1, NOTE_DURATION_4, G#2
	audio_wait_1
	pitch_offset -18
	audio_wait_1
	note E_1
	audio_wait_1
	note F#0
	audio_wait_1
	note C#0, NOTE_DURATION_4, A_2
	audio_wait_1
	pitch_offset -64
	audio_wait_1
	note 23
	audio_wait_1
	note 18
	audio_wait_1
	note 14, NOTE_DURATION_4, A#2
	audio_wait_1
	pitch_offset -106
	audio_wait_1
	note 5
	audio_wait_1
	note 4
	audio_wait_1
	note 3, NOTE_DURATION_4, B_2
	audio_wait_3
	pitch_offset -120
	audio_wait_1
	note 6, NOTE_DURATION_4, C_3
	audio_wait_1
	pitch_offset -110
	audio_wait_1
	note 17
	audio_wait_1
	note 22
	audio_wait_1
	note 27, NOTE_DURATION_4, C#3
	audio_wait_1
	pitch_offset -64
	audio_wait_1
	note F#0
	audio_wait_1
	note C_1
	audio_wait_1
	note E_1, NOTE_DURATION_4, C_3
	audio_wait_1
	pitch_offset -2
	audio_wait_1
	note G#2
	audio_wait_1
	note C#3
	audio_wait_1
	note F_3, NOTE_DURATION_4, B_2
	audio_wait_1
	pitch_offset 44
	audio_wait_1
	note G_4
	audio_wait_1
	note A#4
	audio_wait_1
	note D_5, NOTE_DURATION_4, A#2
	audio_wait_1
	pitch_offset 78
	audio_wait_1
	note A_5
	audio_wait_1
	note A#5
	audio_wait_1
	note B_5, NOTE_DURATION_4, A_2
	audio_wait_1
	pitch_offset 88
	audio_wait_3
	note A#5, NOTE_DURATION_4, G#2
	audio_wait_1
	pitch_offset 78
	audio_wait_1
	note D#5
	audio_wait_1
	note A#4
	audio_wait_1
	note E_4, NOTE_DURATION_24, G_2
	audio_wait_1
	pitch_offset 24
	audio_wait_1
	note B_2
	audio_wait_1
	note F_2
	audio_wait_1
	note C_2
	audio_wait_1
	note D_1
	audio_wait_1
	note A#0
	audio_wait_1
	note G_0
	audio_wait_1
	note E_0
	audio_wait_1
	note 33
	audio_wait_1
	note 31
	audio_wait_1
	note 29
	audio_wait_1
	note 27
	audio_wait_1
	note 24
	audio_wait_5
	note 25
	audio_wait_1
	note 27
	audio_wait_1
	note 31
	audio_wait_1
	note 34
	audio_wait_1
	note D#0
	audio_wait_1
	note G_0
	audio_wait_1
	note C_1
	audio_wait_1
	note A#1
	audio_wait_1
	note D_2
	audio_wait_1
	note F_2
	audio_wait_1
	note C#3
	audio_wait_1
	note E_3
	audio_wait_1
	note G_3
	audio_wait_1
	note C#4
	audio_wait_2
	note F#4
	audio_wait_1
	note A_4
	audio_wait_1
	note C_5
	audio_wait_1
	note F_5
	audio_wait_1
	note G_5
	audio_wait_1
	note A_5
	audio_wait_4
	note E_2
	audio_wait_1
	note C#6
	audio_wait_1
	note E_2
	audio_end

Sfx_0b4:
	db 1, 0
	dw Sfx_0b4_Ch1

Sfx_0b5_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_4B
	vibrato_amplitude 0
	volume 75
	pitch_offset 0
	note NOTE_DURATION_2, G_4, 15
	audio_wait_2
	note D#5
	audio_wait_2
	note F#4
	audio_wait_2
	note D_4
	audio_wait_2
	note F_5
	audio_wait_2
	note C#4
	audio_wait_2
	note G_3
	audio_wait_2
	audio_end

Sfx_0b5_Ch2:
	semitone_offset 0
	wave WAVE_1A
	vibrato_amplitude 0
	volume 56
	pitch_offset 0
	audio_wait_8
	note NOTE_DURATION_2, G_4, 15
	audio_wait_2
	note D#5
	audio_wait_2
	note F#4
	audio_wait_2
	note D_4
	audio_wait_2
	note F_5
	audio_wait_2
	note C#4
	audio_wait_2
	note G_3
	audio_wait_2
	audio_end

Sfx_0b5:
	db 2, 0
	dw Sfx_0b5_Ch1
	dw Sfx_0b5_Ch2

Sfx_0b6_Ch1:
	semitone_offset 255
	tempo 74
	wave WAVE_4B
	vibrato_amplitude 0
	volume 75
	pitch_offset 0
	note NOTE_DURATION_2, G_4, 19
	audio_wait_2
	note D#5
	audio_wait_2
	note F#4
	audio_wait_2
	note D_4
	audio_wait_2
	note F_5
	audio_wait_2
	note C#4
	audio_wait_2
	note G_3
	audio_wait_2
	audio_end

Sfx_0b6_Ch2:
	semitone_offset 255
	wave WAVE_1A
	vibrato_amplitude 0
	volume 56
	pitch_offset 0
	audio_wait_8
	note NOTE_DURATION_2, G_4, 15
	audio_wait_2
	note D#5
	audio_wait_2
	note F#4
	audio_wait_2
	note D_4
	audio_wait_2
	note F_5
	audio_wait_2
	note C#4
	audio_wait_2
	note G_3
	audio_wait_2
	audio_end

Sfx_0b6:
	db 2, 0
	dw Sfx_0b6_Ch1
	dw Sfx_0b6_Ch2

Sfx_0b7_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_4B
	vibrato_amplitude 0
	volume 75
	pitch_offset 0
	note NOTE_DURATION_3, G_3, 15
	audio_wait_3
	note C#4
	audio_wait_3
	note F_5
	audio_wait_3
	note D_4
	audio_wait_3
	note F#4
	audio_wait_3
	note D#5
	audio_wait_3
	note G_4
	audio_wait_3
	audio_end

Sfx_0b7_Ch2:
	semitone_offset 0
	wave WAVE_1A
	volume 56
	vibrato_amplitude 0
	pitch_offset 0
	audio_wait_9
	note NOTE_DURATION_3, G_3, 15
	audio_wait_3
	note C#4
	audio_wait_3
	note F_5
	audio_wait_3
	note D_4
	audio_wait_3
	note F#4
	audio_wait_3
	note D#5
	audio_wait_3
	note G_4
	audio_wait_3
	audio_end

Sfx_0b7:
	db 2, 0
	dw Sfx_0b7_Ch1
	dw Sfx_0b7_Ch2

Sfx_0b8_Ch1:
	semitone_offset 1
	tempo 74
	wave WAVE_4B
	vibrato_amplitude 0
	volume 75
	pitch_offset 0
	note NOTE_DURATION_3, G_3, 15
	audio_wait_3
	note C#4
	audio_wait_3
	note F_5
	audio_wait_3
	note D_4
	audio_wait_3
	note F#4
	audio_wait_3
	note D#5
	audio_wait_3
	note G_4
	audio_wait_3
	audio_end

Sfx_0b8_Ch2:
	semitone_offset 1
	wave WAVE_1A
	volume 56
	vibrato_amplitude 0
	pitch_offset 0
	audio_wait_9
	note NOTE_DURATION_3, G_3, 15
	audio_wait_3
	note C#4
	audio_wait_3
	note F_5
	audio_wait_3
	note D_4
	audio_wait_3
	note F#4
	audio_wait_3
	note D#5
	audio_wait_3
	note G_4
	audio_wait_3
	audio_end

Sfx_0b8:
	db 2, 0
	dw Sfx_0b8_Ch1
	dw Sfx_0b8_Ch2

Sfx_0b9_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_32
	volume 113
	note NOTE_DURATION_4, A_1, 29
	audio_wait_5
	note NOTE_DURATION_4
	audio_wait_5
	note NOTE_DURATION_4
	audio_wait_5
	note NOTE_DURATION_4, B_1
	audio_wait_5
	note NOTE_DURATION_4
	audio_wait_5
	note NOTE_DURATION_4
	audio_wait_5
	note NOTE_DURATION_4, C_2
	audio_wait_5
	audio_end

Sfx_0b9:
	db 1, 0
	dw Sfx_0b9_Ch1

Sfx_0ba_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3C
	volume 120
	note NOTE_DURATION_12, E_3, 24
	audio_wait_12
	audio_end

Sfx_0ba_Ch2:
	semitone_offset 0
	wave WAVE_69
	volume 120
	note NOTE_DURATION_1, D_2, 10
	audio_wait_2
	note G_3, 17
	audio_wait_2
	note D_3, 24
	audio_wait_2
	audio_end

Sfx_0ba:
	db 2, 0
	dw Sfx_0ba_Ch1
	dw Sfx_0ba_Ch2

Sfx_0bb_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 113
	note NOTE_DURATION_2, C_4, 17
	audio_wait_2
	note D_4
	audio_wait_2
	note E_4
	audio_wait_2
	note F_4
	audio_wait_2
	note C_5
	audio_wait_2
	note NOTE_DURATION_2, C_4, 11
	audio_wait_2
	note D_4
	audio_wait_2
	note E_4
	audio_wait_2
	note F_4
	audio_wait_2
	note C_5
	audio_wait_2
	audio_end

Sfx_0bb_Ch2:
	semitone_offset 0
	wave WAVE_60
	volume 113
	note NOTE_DURATION_2, E_3, 17
	audio_wait_2
	note F_3
	audio_wait_2
	note G_3
	audio_wait_2
	note A_3
	audio_wait_2
	note E_4
	audio_wait_2
	note NOTE_DURATION_2, E_3, 11
	audio_wait_2
	note F_3
	audio_wait_2
	note G_3
	audio_wait_2
	note A_3
	audio_wait_2
	note E_4
	audio_wait_2
	audio_end

Sfx_0bb:
	db 2, 0
	dw Sfx_0bb_Ch1
	dw Sfx_0bb_Ch2

Sfx_0bc_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_8, C#5, 9
	audio_wait_8
	note C_5
	audio_wait_8
	note G_4, 17
	audio_wait_8
	note C#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note G_4, 24
	audio_wait_8
	note C#5, 19
	audio_wait_8
	note C_5, 12
	audio_wait_8
	note C#5, 9
	audio_wait_8
	note C_5
	audio_wait_8
	note G_4, 17
	audio_wait_8
	note C#5
	audio_wait_8
	note C_5, 22
	audio_wait_8
	note G_4, 24
	audio_wait_8
	note C#5, 19
	audio_wait_8
	note C_5, 12
	audio_wait_8
	audio_end

Sfx_0bc:
	db 1, 0
	dw Sfx_0bc_Ch1

Sfx_0bd_Ch1:
	semitone_offset 2
	tempo 74
	wave WAVE_63
	vibrato_amplitude 100
	volume 113
	note NOTE_DURATION_2, C_5, 29
	audio_wait_2
	note C_4
	audio_wait_2
	note C_3
	audio_wait_2
	note C_2
	audio_wait_2
	note B_4
	audio_wait_2
	note B_3
	audio_wait_2
	note B_2
	audio_wait_2
	note B_1
	audio_wait_2
	note A#4
	audio_wait_2
	note A#3
	audio_wait_2
	note A#2
	audio_wait_2
	note A#1
	audio_wait_2
	note A_4
	audio_wait_2
	note A_3
	audio_wait_2
	note A_2
	audio_wait_2
	note A_1
	audio_wait_2
	note G#4
	audio_wait_2
	note G#3
	audio_wait_2
	note G#2
	audio_wait_2
	note G#1
	audio_wait_2
	note NOTE_DURATION_2, C_5, 29
	audio_wait_2
	note C_4
	audio_wait_2
	note C_3
	audio_wait_2
	note C_2
	audio_wait_2
	note B_4
	audio_wait_2
	note B_3
	audio_wait_2
	note B_2
	audio_wait_2
	note B_1
	audio_wait_2
	note A#4
	audio_wait_2
	note A#3
	audio_wait_2
	note A#2
	audio_wait_2
	note A#1
	audio_wait_2
	note A_4
	audio_wait_2
	note A_3
	audio_wait_2
	note A_2
	audio_wait_2
	note A_1
	audio_wait_2
	note G#4
	audio_wait_2
	note G#3
	audio_wait_2
	note G#2
	audio_wait_2
	note G#1
	audio_wait_2
	note NOTE_DURATION_2, C_5, 29
	audio_wait_2
	note C_4
	audio_wait_2
	note C_3
	audio_wait_2
	note C_2
	audio_wait_2
	note B_4
	audio_wait_2
	note B_3
	audio_wait_2
	note B_2
	audio_wait_2
	note B_1
	audio_wait_2
	note A#4
	audio_wait_2
	note A#3
	audio_wait_2
	note A#2
	audio_wait_2
	note A#1
	audio_wait_2
	note A_4
	audio_wait_2
	note A_3
	audio_wait_2
	note A_2
	audio_wait_2
	note A_1
	audio_wait_2
	note G#4
	audio_wait_2
	note G#3
	audio_wait_2
	note G#2
	audio_wait_2
	note G#1
	audio_wait_2
	note G_4, 24
	audio_wait_2
	note G_3
	audio_wait_2
	note G_2
	audio_wait_2
	note G_1
	audio_wait_2
	note G_4, 17
	audio_wait_2
	note G_3
	audio_wait_2
	note G_2
	audio_wait_2
	note G_1
	audio_wait_2
	note G_4, 12
	audio_wait_2
	note G_3
	audio_wait_2
	note G_2
	audio_wait_2
	note G_1
	audio_wait_2
	audio_end

Sfx_0bd:
	db 1, 0
	dw Sfx_0bd_Ch1

Sfx_0be_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_63
	volume 94
	pitch_offset 6
	pitch_offset_mult 5
	note NOTE_DURATION_12, E_3, 24
	audio_wait_1
	pitch_offset 14
	audio_wait_1
	note B_3
	audio_wait_1
	note A#4
	audio_wait_1
	note A#6
	audio_wait_1
	note G_7
	audio_wait_6
	note E_2
	audio_wait_1
	note NOTE_DURATION_12, F_3, 31
	audio_wait_1
	pitch_offset 14
	audio_wait_1
	note B_3
	audio_wait_1
	note A#4
	audio_wait_1
	note A#6
	audio_wait_1
	note G_7
	audio_wait_6
	note E_2
	audio_wait_1
	audio_end

Sfx_0be:
	db 1, 0
	dw Sfx_0be_Ch1

Sfx_0bf_Ch1:
	semitone_offset 12
	tempo 74
	wave WAVE_63
	volume 113
	note NOTE_DURATION_2, C_1, 29
	audio_wait_2
	note C#1
	audio_wait_2
	note D_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note NOTE_DURATION_2, C_1, 17
	audio_wait_2
	note C#1
	audio_wait_2
	note D_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	audio_end

Sfx_0bf:
	db 1, 0
	dw Sfx_0bf_Ch1

Sfx_0c0_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_63
	vibrato_amplitude 100
	volume 113
	note NOTE_DURATION_2, C_3, 29
	audio_wait_2
	note F#2
	audio_wait_2
	note C#2
	audio_wait_2
	note B_2
	audio_wait_2
	note F_2
	audio_wait_2
	note C_2
	audio_wait_2
	note A#2
	audio_wait_2
	note E_2
	audio_wait_2
	note B_1
	audio_wait_2
	note A_2
	audio_wait_2
	note D#2
	audio_wait_2
	note A#1
	audio_wait_2
	note G#2
	audio_wait_2
	note D_2
	audio_wait_2
	note A_1
	audio_wait_2
	note G_2
	audio_wait_2
	note C#2
	audio_wait_2
	note G#1
	audio_wait_2
	note F#2
	audio_wait_2
	note C_2
	audio_wait_2
	note G_1
	audio_wait_2
	note F_2
	audio_wait_2
	note B_1
	audio_wait_2
	note F#1
	audio_wait_2
	note E_2
	audio_wait_2
	note A#1
	audio_wait_2
	note F_1
	audio_wait_2
	note D#2
	audio_wait_2
	note A_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D_2
	audio_wait_2
	note G#1
	audio_wait_2
	note D#1
	audio_wait_2
	note C#2
	audio_wait_2
	note G_1
	audio_wait_2
	note D_1
	audio_wait_2
	note C_2
	audio_wait_2
	note C#1
	audio_wait_2
	note F#1
	audio_wait_2
	audio_end

Sfx_0c0:
	db 1, 0
	dw Sfx_0c0_Ch1

Sfx_0c1_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_60
	volume 108
	note NOTE_DURATION_1, C#2, 28
	audio_wait_3
	note C#2
	audio_wait_3
	note C#2
	audio_wait_2
	audio_end

Sfx_0c1_Ch2:
	semitone_offset 0
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F_1, 24
	audio_wait_8
	audio_end

Sfx_0c1:
	db 2, 0
	dw Sfx_0c1_Ch1
	dw Sfx_0c1_Ch2

Sfx_0c2_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_4, C#5, 9
	audio_wait_4
	note C_5
	audio_wait_4
	note B_4, 17
	audio_wait_4
	note A#4
	audio_wait_4
	note C#5, 22
	audio_wait_4
	note C_5, 24
	audio_wait_4
	note B_4, 19
	audio_wait_4
	note A#4, 12
	audio_wait_4
	note C#5, 9
	audio_wait_4
	note C_5
	audio_wait_4
	note B_4, 17
	audio_wait_4
	note A#4
	audio_wait_4
	note C#5, 22
	audio_wait_4
	note C_5, 24
	audio_wait_4
	note B_4, 19
	audio_wait_4
	note A#4, 12
	audio_wait_4
	note C#5, 9
	audio_wait_4
	note C_5
	audio_wait_4
	note B_4, 17
	audio_wait_4
	note A#4
	audio_wait_4
	note C#5, 22
	audio_wait_4
	note C_5, 24
	audio_wait_4
	note B_4, 19
	audio_wait_4
	note A#4, 12
	audio_wait_4
	audio_end

Sfx_0c2:
	db 1, 0
	dw Sfx_0c2_Ch1

Sfx_0c3_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_44
	volume 75
	note NOTE_DURATION_10, F_2, 19
	audio_wait_20
	audio_end

Sfx_0c3:
	db 1, 0
	dw Sfx_0c3_Ch1

Sfx_0c4_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3D
	volume 94
	note NOTE_DURATION_10, C_3, 17
	audio_wait_10
	audio_end

Sfx_0c4:
	db 1, 0
	dw Sfx_0c4_Ch1

Sfx_0c5_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_1, B_5, 24
	audio_wait_6
	note F#4
	audio_wait_14
	audio_end

Sfx_0c5:
	db 1, 0
	dw Sfx_0c5_Ch1

Sfx_0c6_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3B
	volume 75
	note NOTE_DURATION_2, C_1, 24
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note F_1
	audio_wait_2
	audio_end

Sfx_0c6:
	db 1, 0
	dw Sfx_0c6_Ch1

Sfx_0c7_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0D
	vibrato_speed 127
	vibrato_delay 0
	vibrato_amplitude 50
	vibrato_disabled FALSE
	volume 103
	note NOTE_DURATION_5, E_3, 27
	audio_wait_12
	note NOTE_DURATION_24
	audio_wait_24
	vibrato_amplitude 0
	wave WAVE_64
	volume 120
	pitch_offset_mult 10
	note NOTE_DURATION_24, D_5, 31
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note F_2
	audio_wait_1
	note D_2
	audio_wait_1
	note C_2
	audio_wait_1
	note A#1
	audio_wait_1
	note F_1
	audio_wait_1
	note D#1
	audio_wait_2
	note C_1
	audio_wait_2
	note A#0
	audio_wait_2
	note B_0
	audio_wait_2
	note D_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G#1
	audio_wait_2
	note C#2
	audio_wait_2
	note E_2
	audio_wait_1
	note NOTE_DURATION_5, 19
	audio_wait_5
	audio_end

Sfx_0c7_Ch2:
	semitone_offset 0
	wave WAVE_5D
	vibrato_speed 127
	vibrato_delay 0
	vibrato_amplitude 50
	vibrato_disabled FALSE
	volume 103
	note NOTE_DURATION_5, D_3, 27
	audio_wait_12
	note NOTE_DURATION_24
	audio_wait_24
	vibrato_amplitude 0
	wave WAVE_68
	volume 85
	note NOTE_DURATION_12, B_1, 16
	audio_wait_12
	wave WAVE_65
	note NOTE_DURATION_4, B_1, 18
	audio_wait_4
	note NOTE_DURATION_8, B_1, 20
	audio_wait_8
	note NOTE_DURATION_8, B_1, 22
	audio_wait_8
	note NOTE_DURATION_16, B_1, 24
	audio_wait_16
	note NOTE_DURATION_36, B_1, 27
	audio_wait_36
	note NOTE_DURATION_8, B_1, 22
	audio_wait_8
	wave WAVE_66
	note NOTE_DURATION_24, B_1, 18
	audio_wait_24
	audio_end

Sfx_0c7:
	db 2, 0
	dw Sfx_0c7_Ch1
	dw Sfx_0c7_Ch2

Sfx_0c8_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_40
	volume 120
	pitch_offset 0
	note NOTE_DURATION_12, E_1, 24
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 43
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 39
	pitch_offset -8
	audio_wait_1
	vibrato_amplitude 32
	pitch_offset -40
	audio_wait_1
	note D#0
	audio_wait_1
	vibrato_amplitude 24
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 11
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 7
	pitch_offset -86
	audio_wait_1
	vibrato_amplitude 6
	pitch_offset -88
	audio_wait_1
	note 19
	audio_wait_1
	vibrato_amplitude 4
	audio_wait_1
	note 7
	pitch_offset 0
	note NOTE_DURATION_12, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 21
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 33
	pitch_offset -8
	audio_wait_1
	vibrato_amplitude 41
	pitch_offset -40
	audio_wait_1
	vibrato_amplitude 49
	pitch_offset -50
	audio_wait_1
	vibrato_amplitude 51
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 54
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 53
	pitch_offset -86
	audio_wait_1
	note 20
	audio_wait_1
	vibrato_amplitude 43
	pitch_offset -90
	audio_wait_1
	vibrato_amplitude 37
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_12, 12
	audio_wait_1
	vibrato_amplitude 25
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 22
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	vibrato_amplitude 26
	pitch_offset -50
	audio_wait_1
	vibrato_amplitude 34
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 46
	pitch_offset -84
	audio_wait_1
	note 21
	audio_wait_1
	vibrato_amplitude 77
	pitch_offset -88
	audio_wait_1
	vibrato_amplitude 81
	pitch_offset -90
	audio_wait_2
	note E_2, NOTE_DURATION_12, 7
	audio_wait_1
	vibrato_amplitude 77
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 68
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	vibrato_amplitude 55
	pitch_offset -40
	audio_wait_1
	vibrato_amplitude 28
	pitch_offset -50
	audio_wait_1
	note 27
	audio_wait_1
	vibrato_amplitude 18
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 12
	pitch_offset -86
	audio_wait_1
	note 20
	audio_wait_1
	vibrato_amplitude 15
	pitch_offset -90
	audio_wait_2
	vibrato_amplitude 37
	audio_wait_1
	note E_1
	audio_wait_1
	note G_2
	audio_wait_1
	note C#3
	audio_wait_1
	note D#3
	audio_wait_1
	note C#3
	audio_wait_1
	note G#2
	audio_wait_1
	note C#2
	audio_wait_1
	note F_1
	audio_wait_1
	note G#0
	audio_wait_1
	note C#0
	audio_wait_1
	note 32
	audio_wait_1
	note 31
	audio_wait_3
	note 34
	audio_wait_1
	note A#0
	audio_wait_1
	note C_2
	audio_wait_1
	note D#3
	audio_wait_1
	note B_3
	audio_wait_1
	note E_4
	audio_wait_1
	note F#4
	audio_wait_2
	note F_4
	audio_wait_1
	note B_3
	audio_wait_1
	note E_3
	audio_wait_1
	note G#2
	audio_wait_1
	note C#2
	audio_wait_2
	note F_1
	audio_wait_1
	note B_0
	audio_wait_1
	note F#0
	audio_wait_1
	note D_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 33
	audio_wait_1
	note 32
	audio_wait_1
	note 31
	audio_end

Sfx_0c8:
	db 1, 0
	dw Sfx_0c8_Ch1

Sfx_0c9_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_2, A_1, 31
	audio_wait_6
	note G#2
	audio_wait_2
	audio_end

Sfx_0c9:
	db 1, 0
	dw Sfx_0c9_Ch1

Sfx_0ca_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_1A
	volume 75
	note NOTE_DURATION_3, G_1, 19
	audio_wait_4
	note D_2
	audio_wait_4
	note C#2
	audio_wait_4
	note C_2
	audio_wait_4
	note F_2
	audio_wait_4
	note B_2
	audio_wait_4
	note F_2, 12
	audio_wait_4
	note B_2
	audio_wait_4
	note F_3, 9
	audio_wait_4
	note B_3
	audio_wait_4
	note F_3
	audio_wait_4
	note B_3
	audio_wait_4
	note F_4, 7
	audio_wait_4
	note B_4
	audio_wait_4
	note F_4
	audio_wait_4
	note B_4
	audio_wait_4
	audio_end

Sfx_0ca_Ch2:
	semitone_offset 0
	wave WAVE_10
	volume 75
	note NOTE_DURATION_3, G_0, 19
	audio_wait_4
	note D_1
	audio_wait_4
	note C#1
	audio_wait_4
	note C_1
	audio_wait_4
	note F_1
	audio_wait_4
	note B_1
	audio_wait_4
	note F_1, 12
	audio_wait_4
	note B_1
	audio_wait_4
	note F_2, 9
	audio_wait_4
	note B_2
	audio_wait_4
	note F_2
	audio_wait_4
	note B_2
	audio_wait_4
	note F_3, 7
	audio_wait_4
	note B_3
	audio_wait_4
	note F_3
	audio_wait_4
	note B_3
	audio_wait_4
	audio_end

Sfx_0ca:
	db 2, 0
	dw Sfx_0ca_Ch1
	dw Sfx_0ca_Ch2

Sfx_0cb_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 94
	note NOTE_DURATION_1, G_1, 29
	audio_wait_1
	note G#1
	audio_wait_1
	note A_1
	audio_wait_1
	note A#1
	audio_wait_1
	note B_1
	audio_wait_1
	note C_2
	audio_wait_1
	note C#2
	audio_wait_1
	note D_2
	audio_wait_1
	note D#2
	audio_wait_1
	note E_2
	audio_wait_1
	note F_2
	audio_wait_1
	note F#2
	audio_wait_1
	note G_2
	audio_wait_1
	note NOTE_DURATION_1, G#2, 7
	audio_wait_1
	note A_2
	audio_wait_1
	note A#2
	audio_wait_1
	note B_2, 5
	audio_wait_1
	note C_3
	audio_wait_1
	audio_end

Sfx_0cb:
	db 1, 0
	dw Sfx_0cb_Ch1

Sfx_0cc_Ch1:
	semitone_offset 4
	tempo 74
	wave WAVE_5C
	vibrato_amplitude 80
	volume 113
	pitch_offset 0

.sub1
	note NOTE_DURATION_14, C_2, 24
	audio_wait_2
	pitch_offset -18
	audio_wait_2
	note C#1
	audio_wait_2
	note E_0
	audio_wait_2
	note C_0
	audio_wait_2
	note 34
	audio_wait_2
	note 33
	audio_wait_2
	note E_2, NOTE_DURATION_14, C_2, 12
	audio_wait_2
	pitch_offset -18
	audio_wait_2
	note C#1
	audio_wait_2
	note E_0
	audio_wait_2
	note C_0
	audio_wait_2
	note 34
	audio_wait_2
	note 33
	audio_wait_2
	note E_2, NOTE_DURATION_7, F_1, 24
	audio_wait_1
	pitch_offset -18
	audio_wait_1
	note C#1
	audio_wait_1
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_7, F_1, 12
	audio_wait_1
	pitch_offset -18
	audio_wait_1
	note C#1
	audio_wait_1
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_7, D_1, 24
	audio_wait_1
	pitch_offset -18
	audio_wait_1
	note C#1
	audio_wait_1
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_7, D_1, 12
	audio_wait_1
	pitch_offset -18
	audio_wait_1
	note C#1
	audio_wait_1
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_7, C#1, 24
	audio_wait_1
	pitch_offset -18
	audio_wait_1
	note C#1
	audio_wait_1
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_7, C#1, 12
	audio_wait_1
	pitch_offset -18
	audio_wait_1
	note C#1
	audio_wait_1
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_10, C_1, 24
	audio_wait_2
	pitch_offset -18
	audio_wait_2
	note C#1
	audio_wait_2
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_10, C_1, 12
	audio_wait_2
	pitch_offset -18
	audio_wait_2
	note C#1
	audio_wait_2
	note E_0
	audio_wait_1
	note C_0
	audio_wait_1
	note 34
	audio_wait_1
	note 33
	audio_wait_1
	note E_2, NOTE_DURATION_14, B_0, 24
	audio_wait_2
	pitch_offset -18
	audio_wait_2
	note C#1
	audio_wait_2
	note E_0
	audio_wait_2
	note C_0
	audio_wait_2
	note 34
	audio_wait_2
	note 33
	audio_wait_2
	note E_2, NOTE_DURATION_14, B_0, 12
	audio_wait_2
	pitch_offset -18
	audio_wait_2
	note C#1
	audio_wait_2
	note E_0
	audio_wait_2
	note C_0
	audio_wait_2
	note 34
	audio_wait_2
	note 33
	audio_wait_2
	note E_2
	audio_ret

	audio_end

Sfx_0cc_Ch2:
	semitone_offset 4
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 80
	volume 113
	pitch_offset 0
	audio_wait_6
	audio_call Sfx_0cc_Ch1.sub1
	audio_end

Sfx_0cc:
	db 2, 0
	dw Sfx_0cc_Ch1
	dw Sfx_0cc_Ch2

Sfx_0cd_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	vibrato_amplitude 50
	volume 94
	vibrato_amplitude 58
	pitch_offset 0
	note NOTE_DURATION_6, C_3, 22
	audio_wait_1
	vibrato_amplitude 62
	audio_wait_1
	note D#2
	audio_wait_1
	note E_2
	audio_wait_3
	note NOTE_DURATION_6, B_2
	audio_wait_6
	note A#2
	audio_wait_6
	note A_2
	audio_wait_6
	note G#2
	audio_wait_9
	vibrato_amplitude 63
	audio_wait_1
	note D_2
	audio_wait_1
	note A#1
	audio_wait_1
	note G_1
	audio_wait_1
	note C_1
	audio_wait_1
	note D#0
	audio_wait_1
	note 34
	audio_wait_1
	note 26
	audio_wait_1
	note 20
	audio_wait_1
	note 12
	audio_wait_1
	note 8
	audio_wait_1
	note 2
	audio_wait_1
	note 0
	audio_end

Sfx_0cd_Ch2:
	semitone_offset 0
	wave WAVE_1A
	vibrato_amplitude 0
	volume 66
	pitch_offset 0
	audio_wait_6
	vibrato_amplitude 58
	note NOTE_DURATION_6, C_3, 22
	audio_wait_1
	vibrato_amplitude 62
	audio_wait_1
	note D#2
	audio_wait_1
	note E_2
	audio_wait_3
	note NOTE_DURATION_6, B_2
	audio_wait_6
	note A#2
	audio_wait_6
	note A_2
	audio_wait_6
	note G#2
	audio_wait_9
	vibrato_amplitude 63
	audio_wait_1
	note D_2
	audio_wait_1
	note A#1
	audio_wait_1
	note G_1
	audio_wait_1
	note C_1
	audio_wait_1
	note D#0
	audio_wait_1
	note 34
	audio_wait_1
	note 26
	audio_wait_1
	note 20
	audio_wait_1
	note 12
	audio_wait_1
	note 8
	audio_wait_1
	note 2
	audio_wait_1
	note 0
	audio_end

Sfx_0cd_Ch3:
	semitone_offset 0
	wave WAVE_60
	vibrato_amplitude 0
	volume 47
	pitch_offset 0
	audio_wait_12
	vibrato_amplitude 58
	note NOTE_DURATION_6, C_3, 22
	audio_wait_1
	vibrato_amplitude 62
	audio_wait_1
	note D#2
	audio_wait_1
	note E_2
	audio_wait_3
	note NOTE_DURATION_6, B_2
	audio_wait_6
	note A#2
	audio_wait_6
	note A_2
	audio_wait_6
	note G#2
	audio_wait_9
	vibrato_amplitude 63
	audio_wait_1
	note D_2
	audio_wait_1
	note A#1
	audio_wait_1
	note G_1
	audio_wait_1
	note C_1
	audio_wait_1
	note D#0
	audio_wait_1
	note 34
	audio_wait_1
	note 26
	audio_wait_1
	note 20
	audio_wait_1
	note 12
	audio_wait_1
	note 8
	audio_wait_1
	note 2
	audio_wait_1
	note 0
	audio_end

Sfx_0cd:
	db 3, 0
	dw Sfx_0cd_Ch1
	dw Sfx_0cd_Ch2
	dw Sfx_0cd_Ch3

Sfx_0ce_Ch1:
	semitone_offset 241
	tempo 74
	wave WAVE_63
	volume 120
	note NOTE_DURATION_2, F_1, 31
	audio_wait_2
	note F#1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_2
	audio_wait_2
	note C_3
	audio_wait_2
	note G#2
	audio_wait_2
	note C#3
	audio_wait_2
	note F#2
	audio_wait_2
	note B_2
	audio_wait_2
	note G_2
	audio_wait_2
	note C_3
	audio_wait_2
	note F_2
	audio_wait_2
	note A#2
	audio_wait_2
	note F#2
	audio_wait_2
	note B_2
	audio_wait_2
	note E_2
	audio_wait_2
	note A_2
	audio_wait_2
	note F_2
	audio_wait_2
	note A#2
	audio_wait_2
	note D#2
	audio_wait_2
	note G#2
	audio_wait_2
	note E_2
	audio_wait_2
	note A_2
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	audio_end

Sfx_0ce_Ch2:
	semitone_offset 241
	tempo 74
	wave WAVE_0A
	volume 113
	audio_wait_6
	note NOTE_DURATION_2, F_1, 29
	audio_wait_2
	note F#1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_2
	audio_wait_2
	note C_3
	audio_wait_2
	note G#2
	audio_wait_2
	note C#3
	audio_wait_2
	note F#2
	audio_wait_2
	note B_2
	audio_wait_2
	note G_2
	audio_wait_2
	note C_3
	audio_wait_2
	note F_2
	audio_wait_2
	note A#2
	audio_wait_2
	note F#2
	audio_wait_2
	note B_2
	audio_wait_2
	note E_2
	audio_wait_2
	note A_2
	audio_wait_2
	note F_2
	audio_wait_2
	note A#2
	audio_wait_2
	note D#2
	audio_wait_2
	note G#2
	audio_wait_2
	note E_2
	audio_wait_2
	note A_2
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	audio_end

Sfx_0ce:
	db 2, 0
	dw Sfx_0ce_Ch1
	dw Sfx_0ce_Ch2

Sfx_0cf_Ch1:
	semitone_offset 250
	tempo 74
	wave WAVE_63
	vibrato_amplitude 50
	volume 120
	note NOTE_DURATION_2, C_2, 31
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note D_1
	audio_wait_2
	note D#1
	audio_wait_2
	note D_1
	audio_wait_2
	note C#1
	audio_wait_2
	note D_1
	audio_wait_2
	note C#1
	audio_wait_2
	note C_1
	audio_wait_2
	note C#1
	audio_wait_2
	note C_1
	audio_wait_2
	note B_0
	audio_wait_2
	audio_end

Sfx_0cf_Ch2:
	semitone_offset 0
	wave WAVE_0A
	vibrato_amplitude 50
	volume 120
	note NOTE_DURATION_2, C_2, 31
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note B_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note A#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note A_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note G#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note G_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note F#1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note F_1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note E_1
	audio_wait_2
	note D#1
	audio_wait_2
	note D_1
	audio_wait_2
	note D#1
	audio_wait_2
	note D_1
	audio_wait_2
	note C#1
	audio_wait_2
	note D_1
	audio_wait_2
	note C#1
	audio_wait_2
	note C_1
	audio_wait_2
	note C#1
	audio_wait_2
	note C_1
	audio_wait_2
	note B_0
	audio_wait_2
	audio_end

Sfx_0cf:
	db 2, 0
	dw Sfx_0cf_Ch1
	dw Sfx_0cf_Ch2

Sfx_0d0_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 113
	note NOTE_DURATION_1, E_2, 29
	audio_wait_1
	note E_2, 25
	audio_wait_1
	note E_2, 23
	audio_wait_1
	note D_2, 29
	audio_wait_1
	note D_2, 25
	audio_wait_1
	note D_2, 23
	audio_wait_1
	note C_2, 29
	audio_wait_1
	note C_2, 25
	audio_wait_1
	note C_2, 23
	audio_wait_1
	note B_1, 29
	audio_wait_1
	note B_1, 25
	audio_wait_1
	note B_1, 23
	audio_wait_1
	note A_1, 29
	audio_wait_1
	note A_1, 24
	audio_wait_1
	note A_1, 23
	audio_wait_1
	note G_1, 29
	audio_wait_1
	note G_1, 25
	audio_wait_1
	note G_1, 23
	audio_wait_1
	note F_1, 29
	audio_wait_1
	note F_1, 25
	audio_wait_1
	note F_1, 23
	audio_wait_1
	note E_1, 29
	audio_wait_1
	note E_1, 25
	audio_wait_1
	note E_1, 23
	audio_wait_1
	note D_1, 29
	audio_wait_1
	note D_1, 25
	audio_wait_1
	note D_1, 23
	audio_wait_1
	note C_1, 29
	audio_wait_1
	note C_1, 25
	audio_wait_1
	note C_1, 23
	audio_wait_1
	note D_1, 29
	audio_wait_1
	note D_1, 25
	audio_wait_1
	note D_1, 23
	audio_wait_1
	note E_1, 29
	audio_wait_1
	note E_1, 25
	audio_wait_1
	note E_1, 23
	audio_wait_1
	note F_1, 29
	audio_wait_1
	note F_1, 25
	audio_wait_1
	note F_1, 23
	audio_wait_1
	note G_1, 29
	audio_wait_1
	note G_1, 25
	audio_wait_1
	note G_1, 23
	audio_wait_1
	note A_1, 29
	audio_wait_1
	note A_1, 25
	audio_wait_1
	note A_1, 23
	audio_wait_1
	note B_1, 29
	audio_wait_1
	note B_1, 25
	audio_wait_1
	note B_1, 23
	audio_wait_1
	note C_2, 29
	audio_wait_1
	note C_2, 25
	audio_wait_1
	note C_2, 23
	audio_wait_1
	note D_2, 29
	audio_wait_1
	note D_2, 25
	audio_wait_1
	note D_2, 23
	audio_wait_1
	note E_2, 29
	audio_wait_1
	note E_2, 25
	audio_wait_1
	note E_2, 23
	audio_wait_1
	audio_end

Sfx_0d0:
	db 1, 0
	dw Sfx_0d0_Ch1

Sfx_0d1_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	vibrato_amplitude 0
	volume 94
	pitch_offset -50
	note NOTE_DURATION_13, C_1, 29
	audio_wait_2
	pitch_offset -88
	audio_wait_2
	note 0
	audio_wait_7
	note A#0
	audio_wait_2
	note C#6
	audio_wait_2
	note G_7
	audio_wait_22
	note E_2
	audio_end

Sfx_0d1_Ch2:
	semitone_offset 244
	wave WAVE_6A
	vibrato_amplitude 0
	volume 94
	note NOTE_DURATION_1, G_3, 29
	audio_wait_1
	note F#3
	audio_wait_1
	note F_3
	audio_wait_1
	note E_3
	audio_wait_1
	note D#3
	audio_wait_1
	note D_3
	audio_wait_1
	note C#3
	audio_wait_1
	note C_3
	audio_wait_1
	note B_2
	audio_wait_1
	note A#2
	audio_wait_1
	note A_2
	audio_wait_1
	note G#2
	audio_wait_1
	note G_2
	audio_wait_1
	note NOTE_DURATION_1, F#2, 7
	audio_wait_1
	note F_2
	audio_wait_1
	note E_2
	audio_wait_1
	note D#2, 5
	audio_wait_1
	note D_2
	audio_wait_1
	note C#2, 3
	audio_wait_1
	note C_2
	audio_wait_1
	note B_1, 1
	audio_wait_1
	note A#1
	audio_wait_1
	note A_1
	audio_wait_1
	note G#1, 0
	audio_wait_1
	note G_1
	audio_wait_1
	audio_end

Sfx_0d1:
	db 2, 0
	dw Sfx_0d1_Ch1
	dw Sfx_0d1_Ch2

Sfx_PipeExit_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_35
	volume 120
	note NOTE_DURATION_8, C_3, 24
	audio_wait_8
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_8
	audio_wait_8
	audio_end

Sfx_PipeExit:
	db 1, 0
	dw Sfx_PipeExit_Ch1

Sfx_0e2_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3C
	volume 75
	note NOTE_DURATION_8, E_2, 19
	audio_wait_8
	audio_end

Sfx_0e2:
	db 1, 0
	dw Sfx_0e2_Ch1

Sfx_Selection_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	note NOTE_DURATION_2, D_4, 19
	audio_wait_3
	note C#4
	audio_wait_3
	note A_3
	audio_wait_3
	note D_4
	audio_wait_3
	note F#4
	audio_wait_3
	note A_4
	audio_wait_3
	note D_5
	audio_wait_3
	note D_5, 9
	audio_wait_3
	audio_end

Sfx_Selection:
	db 1, 0
	dw Sfx_Selection_Ch1

Sfx_0e4_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_63
	volume 120
	note NOTE_DURATION_1, E_4, 31
	audio_wait_6
	note NOTE_DURATION_1, C_4, 31
	audio_wait_6
	note NOTE_DURATION_1, E_4, 31
	audio_wait_6
	note G_4
	audio_wait_2
	audio_end

Sfx_0e4:
	db 1, 0
	dw Sfx_0e4_Ch1

Sfx_0e5_Ch1:
	semitone_offset 2
	tempo 74
	wave WAVE_0D
	vibrato_speed 127
	vibrato_delay 0
	vibrato_amplitude 50
	vibrato_disabled FALSE
	volume 120
	note NOTE_DURATION_5, F_1, 31
	audio_wait_12
	note NOTE_DURATION_24
	audio_wait_24
	audio_end

Sfx_0e5_Ch2:
	semitone_offset 2
	wave WAVE_5D
	vibrato_speed 127
	vibrato_delay 0
	vibrato_amplitude 50
	vibrato_disabled FALSE
	volume 120
	note NOTE_DURATION_5, D#1, 31
	audio_wait_12
	note NOTE_DURATION_24
	audio_wait_24
	audio_end

Sfx_0e5:
	db 2, 0
	dw Sfx_0e5_Ch1
	dw Sfx_0e5_Ch2

Sfx_0e6_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_1B
	vibrato_amplitude 0
	volume 75
	note NOTE_DURATION_5, C_4, 17
	audio_wait_3
	note C#4
	audio_wait_6
	note D_4
	audio_wait_3
	note D#4
	audio_wait_6
	note E_4
	audio_wait_3
	note F_4
	audio_wait_6
	note F#4
	audio_wait_6
	note G_4
	audio_wait_5
	audio_end

Sfx_0e6:
	db 1, 0
	dw Sfx_0e6_Ch1

Sfx_0e7_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	note NOTE_DURATION_2, D_4, 19
	audio_wait_3
	note A_3
	audio_wait_3
	note F#3
	audio_wait_3
	note D_3
	audio_wait_3
	note A_2
	audio_wait_3
	note C#3
	audio_wait_3
	note D_3
	audio_wait_3
	note D_3, 9
	audio_wait_3
	audio_end

Sfx_0e7:
	db 1, 0
	dw Sfx_0e7_Ch1

Sfx_0e8_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3C
	volume 120
	note NOTE_DURATION_14, A_3, 25
	audio_wait_14
	wave WAVE_10
	pitch_offset 8
	note NOTE_DURATION_10, G#0, 31
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 12
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 7
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_42
	note E_2
	pitch_offset 4
	note NOTE_DURATION_28, C_1, 31
	audio_wait_4
	pitch_offset 6
	audio_wait_1
	note C_3
	audio_wait_1
	note F#3
	audio_wait_1
	note C#4
	audio_wait_1
	note D#5
	audio_wait_1
	note A#5
	audio_wait_1
	note D_6
	audio_wait_1
	note A_6
	audio_wait_1
	note B_6
	audio_wait_2
	note F_7
	audio_wait_1
	note F#7
	audio_wait_2
	note F_7
	audio_wait_1
	note D#7
	audio_wait_1
	note B_6
	audio_wait_1
	note D#5
	audio_wait_1
	note C_4
	audio_wait_1
	note A#2
	audio_wait_10
	note E_2
	audio_end

Sfx_0e8:
	db 1, 0
	dw Sfx_0e8_Ch1

Sfx_0e9_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	pitch_offset_mult 20
	pitch_offset 2
	note NOTE_DURATION_18, F_1, 19
	audio_wait_5
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_2
	note B_3
	audio_wait_1
	note D_4
	audio_wait_1
	note A#4
	audio_wait_1
	note F#5
	audio_wait_1
	note A_5
	audio_wait_1
	note C#6
	audio_wait_1
	note G_6
	audio_wait_1
	note D_7
	audio_wait_1
	note F#7
	audio_wait_1
	audio_end

Sfx_0e9:
	db 1, 0
	dw Sfx_0e9_Ch1

Sfx_0ea_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	pitch_offset_mult 20
	pitch_offset -2
	note NOTE_DURATION_18, C_3, 19
	audio_wait_5
	pitch_offset -4
	audio_wait_1
	note B_1
	audio_wait_1
	note F#1
	audio_wait_2
	note A_0
	audio_wait_1
	note F#0
	audio_wait_1
	note 34
	audio_wait_1
	note 26
	audio_wait_1
	note 23
	audio_wait_1
	note 19
	audio_wait_1
	note 13
	audio_wait_1
	note 6
	audio_wait_1
	note 2
	audio_wait_1
	audio_end

Sfx_0ea:
	db 1, 0
	dw Sfx_0ea_Ch1

Sfx_0eb_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_11
	vibrato_amplitude 0
	volume 85
	note NOTE_DURATION_3, C_4, 19
	audio_wait_4
	note C#4
	audio_wait_4
	note D_4
	audio_wait_4
	note D#4
	audio_wait_4
	note E_4
	audio_wait_4
	note F_4
	audio_wait_4
	note F#4
	audio_wait_4
	note G_4
	audio_wait_4
	note G#4
	audio_wait_4
	note A_4
	audio_wait_4
	note A#4
	audio_wait_4
	note A_4
	audio_wait_4
	note C_5
	audio_wait_4
	audio_end

Sfx_0eb_Ch2:
	semitone_offset 0
	wave WAVE_52
	volume 56
	vibrato_amplitude 0
	audio_wait_6
	note NOTE_DURATION_3, C_4, 14
	audio_wait_4
	note C#4
	audio_wait_4
	note D_4
	audio_wait_4
	note D#4
	audio_wait_4
	note E_4
	audio_wait_4
	note F_4
	audio_wait_4
	note F#4
	audio_wait_4
	note G_4
	audio_wait_4
	note G#4
	audio_wait_4
	note A_4
	audio_wait_4
	note A#4
	audio_wait_4
	note A_4
	audio_wait_4
	note C_5
	audio_wait_4
	audio_end

Sfx_0eb:
	db 2, 0
	dw Sfx_0eb_Ch1
	dw Sfx_0eb_Ch2

Sfx_0ec_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_25
	volume 113
	note NOTE_DURATION_2, E_5, 29
	audio_wait_2
	note C_5
	audio_wait_2
	audio_end

Sfx_0ec:
	db 1, 0
	dw Sfx_0ec_Ch1

Sfx_0ed_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_69
	volume 66
	note NOTE_DURATION_1, D_2, 13
	audio_wait_2
	note G_3, 18
	audio_wait_2
	note D_3, 31
	audio_wait_2
	note D_2, 13
	audio_wait_2
	note G_3, 18
	audio_wait_2
	note D_3, 31
	audio_wait_2
	note D_2, 13
	audio_wait_2
	note G_3, 18
	audio_wait_2
	note D_3, 31
	audio_wait_2
	note D_2, 13
	audio_wait_2
	note G_3, 18
	audio_wait_2
	note D_3, 31
	audio_wait_2
	audio_end

Sfx_0ed:
	db 1, 0
	dw Sfx_0ed_Ch1

Sfx_0ee_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_8, G_4, 17
	audio_wait_8
	note E_4
	audio_wait_8
	note G_4, 9
	audio_wait_8
	note C_5
	audio_wait_8
	note G_4, 22
	audio_wait_8
	note E_4, 24
	audio_wait_8
	note G_4, 19
	audio_wait_8
	note C_5, 12
	audio_wait_8
	note G_4, 9
	audio_wait_8
	note E_4
	audio_wait_8
	note G_4, 17
	audio_wait_8
	note C_5
	audio_wait_8
	note G_4, 22
	audio_wait_8
	note E_4, 24
	audio_wait_8
	note G_4, 19
	audio_wait_8
	note C_5, 12
	audio_wait_8
	note G_4, 22
	audio_wait_8
	note E_4, 24
	audio_wait_8
	note G_4, 19
	audio_wait_8
	note C_5, 12
	audio_wait_8
	note G_4, 22
	audio_wait_8
	note E_4, 24
	audio_wait_8
	note G_4, 19
	audio_wait_8
	note C_5, 12
	audio_wait_8
	audio_end

Sfx_0ee:
	db 1, 0
	dw Sfx_0ee_Ch1

Sfx_0ef_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	vibrato_amplitude 0
	volume 120
	note NOTE_DURATION_1, G_3, 31
	audio_wait_4
	note NOTE_DURATION_1, G_3, 29
	audio_wait_4
	note NOTE_DURATION_1, G_3, 24
	audio_wait_4
	note NOTE_DURATION_1, G_3, 19
	audio_wait_4
	note NOTE_DURATION_1, G_3, 14
	audio_wait_4
	audio_end

Sfx_0ef:
	db 1, 0
	dw Sfx_0ef_Ch1

Sfx_0f0_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	vibrato_amplitude 0
	pitch_offset 4
	note NOTE_DURATION_28, C_1, 31
	audio_wait_4
	pitch_offset 6
	audio_wait_1
	note C_3
	audio_wait_1
	note F#3
	audio_wait_1
	note C#4
	audio_wait_1
	note D#5
	audio_wait_1
	note A#5
	audio_wait_1
	note D_6
	audio_wait_1
	note A_6
	audio_wait_1
	note B_6
	audio_wait_2
	note F_7
	audio_wait_1
	note F#7
	audio_wait_2
	note F_7
	audio_wait_1
	note D#7
	audio_wait_1
	note B_6
	audio_wait_1
	note D#5
	audio_wait_1
	note C_4
	audio_wait_1
	note A#2
	audio_wait_10
	note E_2
	audio_end

Sfx_0f0:
	db 1, 0
	dw Sfx_0f0_Ch1

Sfx_0f1_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_1, C_2, 24
	audio_wait_3
	note D_3
	audio_wait_3
	note A#3
	audio_wait_3
	audio_end

Sfx_0f1:
	db 1, 0
	dw Sfx_0f1_Ch1

Sfx_0f2_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_1, F#3, 24
	audio_wait_6
	note B_4
	audio_wait_14
	audio_end

Sfx_0f2:
	db 1, 0
	dw Sfx_0f2_Ch1

Sfx_0f3_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	vibrato_amplitude 30
	volume 94
	note NOTE_DURATION_14, C_3, 17
	audio_wait_14
	audio_end

Sfx_0f3:
	db 1, 0
	dw Sfx_0f3_Ch1

Sfx_0f4_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 113
	note NOTE_DURATION_4, G#0, 19
	audio_wait_5
	note NOTE_DURATION_4, A#0, 22
	audio_wait_5
	note NOTE_DURATION_4, C_1, 24
	audio_wait_5
	note NOTE_DURATION_4, C#1, 27
	audio_wait_5
	note NOTE_DURATION_4, D#1, 31
	audio_wait_5
	audio_end

Sfx_0f4:
	db 1, 0
	dw Sfx_0f4_Ch1

Sfx_Snore_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 61
	note NOTE_DURATION_14, G_1, 16
	audio_wait_14
	wave WAVE_65
	note NOTE_DURATION_14, G_1, 19
	audio_wait_14
	note NOTE_DURATION_15, G_1, 23
	audio_wait_15
	note NOTE_DURATION_15, F_1, 19
	audio_wait_15
	note NOTE_DURATION_13, F_1, 16
	audio_wait_13
	note NOTE_DURATION_9, F_1, 14
	audio_wait_9
	wave WAVE_66
	note NOTE_DURATION_9, F_1, 12
	audio_wait_9
	audio_end

Sfx_Snore:
	db 1, 0
	dw Sfx_Snore_Ch1

Sfx_Plane1_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	note NOTE_DURATION_2, D_1, 31
	audio_wait_3
	note E_1
	audio_wait_3
	note D_1
	audio_wait_3
	note E_1
	audio_wait_3
	audio_end

Sfx_Plane1:
	db 1, 0
	dw Sfx_Plane1_Ch1

Sfx_Plane2_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 105
	note NOTE_DURATION_2, D_1, 27
	audio_wait_3
	note E_1
	audio_wait_3
	note D_1
	audio_wait_3
	note E_1
	audio_wait_3
	audio_end

Sfx_Plane2:
	db 1, 0
	dw Sfx_Plane2_Ch1

Sfx_Plane3_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_2, D_1, 24
	audio_wait_3
	note E_1
	audio_wait_3
	note D_1
	audio_wait_3
	note E_1
	audio_wait_3
	audio_end

Sfx_Plane3:
	db 1, 0
	dw Sfx_Plane3_Ch1

Sfx_PlaneExplosion_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_4, G_1, 24
	audio_wait_4
	note A_1
	audio_wait_4
	note B_1
	audio_wait_4
	note C_2
	audio_wait_4
	note NOTE_DURATION_7, A_1, 19
	audio_wait_8
	note NOTE_DURATION_5, A_1, 12
	audio_wait_6
	note NOTE_DURATION_5, A_1, 7
	audio_wait_6
	audio_end

Sfx_PlaneExplosion:
	db 1, 0
	dw Sfx_PlaneExplosion_Ch1

Sfx_0fa_Ch1:
	semitone_offset 0
	tempo 45
	wave WAVE_4B
	volume 66
	audio_wait_12
	note NOTE_DURATION_1, C_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, G_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, B_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, E_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, A_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, G_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	audio_end

Sfx_0fa_Ch2:
	semitone_offset 0
	wave WAVE_55
	volume 113
	note NOTE_DURATION_1, C_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, G_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, B_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, E_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, A_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, G_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	audio_end

Sfx_0fa_Ch3:
	semitone_offset 0
	wave WAVE_60
	volume 113
	note NOTE_DURATION_1, C_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, G_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, B_2, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, E_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, A_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, G_3, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	audio_end

Sfx_0fa:
	db 3, 0
	dw Sfx_0fa_Ch1
	dw Sfx_0fa_Ch2
	dw Sfx_0fa_Ch3

Sfx_101_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 94
	note NOTE_DURATION_1, G_3, 29
	audio_wait_1
	note F#3
	audio_wait_1
	note F_3
	audio_wait_1
	note E_3
	audio_wait_1
	note D#3
	audio_wait_1
	note D_3
	audio_wait_1
	note C#3
	audio_wait_1
	note C_3
	audio_wait_1
	note B_2
	audio_wait_1
	note A#2
	audio_wait_1
	note A_2
	audio_wait_1
	note G#2
	audio_wait_1
	note G_2
	audio_wait_1
	note NOTE_DURATION_1, F#2, 7
	audio_wait_1
	note F_2
	audio_wait_1
	note E_2
	audio_wait_1
	note D#2, 5
	audio_wait_1
	note D_2
	audio_wait_1
	note C#2, 3
	audio_wait_1
	note C_2
	audio_wait_1
	note B_1, 1
	audio_wait_1
	note A#1
	audio_wait_1
	note A_1
	audio_wait_1
	note G#1, 0
	audio_wait_1
	note G_1
	audio_wait_1
	audio_end

Sfx_101:
	db 1, 0
	dw Sfx_101_Ch1

Sfx_102_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 85
	pitch_offset_mult 14
	pitch_offset 0
	note NOTE_DURATION_7, C_1, 27
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_7, C_1, 19
	audio_wait_1
	pitch_offset 4
	audio_wait_1
	note A_2
	audio_wait_1
	note D_3
	audio_wait_1
	note E_5
	audio_wait_1
	note C_7
	audio_wait_1
	note G_7
	audio_wait_1
	audio_end

Sfx_102:
	db 1, 0
	dw Sfx_102_Ch1

Sfx_103_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 75
	pitch_offset 0
	note NOTE_DURATION_2, C_3, 19
	audio_wait_4
	note C#3
	audio_wait_4
	note D_3
	audio_wait_2
	audio_end

Sfx_103:
	db 1, 0
	dw Sfx_103_Ch1

Sfx_104_Ch1:
	semitone_offset 0
	wave WAVE_4A
	volume 94
	note NOTE_DURATION_1, C#5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, D_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C#5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, D_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C#5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, D_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C#5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, D_5, 24
	audio_wait_1
	note 12
	audio_wait_2
	note NOTE_DURATION_1, C#5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, D_5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, C#5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, D_5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, C#5, 17
	audio_wait_1
	note 7
	audio_wait_2
	note NOTE_DURATION_1, D_5, 17
	audio_wait_1
	note 7
	audio_wait_2
	audio_end

Sfx_104:
	db 1, 0
	dw Sfx_104_Ch1

Sfx_105_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	pitch_offset 8
	note NOTE_DURATION_10, F#0, 31
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 12
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2, NOTE_DURATION_10, 7
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	note G#2
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	note D#0
	audio_wait_1
	note 27
	audio_wait_1
	note 22
	audio_wait_1
	note 21
	audio_wait_1
	note 20
	audio_wait_1
	note E_2
	audio_end

Sfx_105_Ch2:
	semitone_offset 0
	wave WAVE_65
	vibrato_amplitude 46
	volume 75
	pitch_offset 0
	note NOTE_DURATION_12, D_2, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 43
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 39
	pitch_offset -8
	audio_wait_1
	vibrato_amplitude 32
	pitch_offset -40
	audio_wait_1
	note D#0
	audio_wait_1
	vibrato_amplitude 24
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 11
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 7
	pitch_offset -86
	audio_wait_1
	vibrato_amplitude 6
	pitch_offset -88
	audio_wait_1
	note 19
	audio_wait_1
	vibrato_amplitude 4
	audio_wait_1
	note 7
	pitch_offset 0
	note NOTE_DURATION_12, 19
	audio_wait_1
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 21
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 33
	pitch_offset -8
	audio_wait_1
	vibrato_amplitude 41
	pitch_offset -40
	audio_wait_1
	vibrato_amplitude 49
	pitch_offset -50
	audio_wait_1
	vibrato_amplitude 51
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 54
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 53
	pitch_offset -86
	audio_wait_1
	note 20
	audio_wait_1
	vibrato_amplitude 43
	pitch_offset -90
	audio_wait_1
	vibrato_amplitude 37
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_12, 12
	audio_wait_1
	vibrato_amplitude 25
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 22
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	note G#0
	audio_wait_1
	vibrato_amplitude 26
	pitch_offset -50
	audio_wait_1
	vibrato_amplitude 34
	pitch_offset -74
	audio_wait_1
	vibrato_amplitude 46
	pitch_offset -84
	audio_wait_1
	note 21
	audio_wait_1
	vibrato_amplitude 77
	pitch_offset -88
	audio_wait_1
	vibrato_amplitude 81
	pitch_offset -90
	audio_wait_2
	note E_2, NOTE_DURATION_12, 7
	audio_wait_1
	vibrato_amplitude 77
	pitch_offset 8
	audio_wait_1
	vibrato_amplitude 68
	pitch_offset 8
	audio_wait_1
	note C_2
	audio_wait_1
	vibrato_amplitude 55
	pitch_offset -40
	audio_wait_1
	vibrato_amplitude 28
	pitch_offset -50
	audio_wait_1
	note 27
	audio_wait_1
	vibrato_amplitude 18
	pitch_offset -84
	audio_wait_1
	vibrato_amplitude 12
	pitch_offset -86
	audio_wait_1
	note 20
	audio_wait_1
	vibrato_amplitude 15
	pitch_offset -90
	audio_wait_2
	audio_end

Sfx_105:
	db 2, 0
	dw Sfx_105_Ch1
	dw Sfx_105_Ch2

Sfx_106_Ch1:
	semitone_offset 0
	tempo 74
	volume 120
	wave WAVE_0B
	note NOTE_DURATION_2, A#4, 31
	audio_wait_2
	note NOTE_DURATION_16, A#5
	audio_wait_16
	audio_end

Sfx_106:
	db 1, 0
	dw Sfx_106_Ch1

Sfx_107_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_2, C_4, 17
	audio_wait_2
	note NOTE_DURATION_2, D_4, 17
	audio_wait_2
	note NOTE_DURATION_2, E_4, 17
	audio_wait_2
	audio_end

Sfx_107:
	db 1, 0
	dw Sfx_107_Ch1

Sfx_108_Ch1:
	semitone_offset 0
	wave WAVE_65
	volume 113
	audio_wait_36
	note NOTE_DURATION_4, E_1, 31
	audio_wait_4
	note NOTE_DURATION_4, F_1, 24
	audio_wait_4
	note NOTE_DURATION_4, E_1, 31
	audio_wait_4
	note NOTE_DURATION_4, F_1, 24
	audio_wait_4
	note NOTE_DURATION_4, E_1, 31
	audio_wait_4
	note NOTE_DURATION_4, F_1, 24
	audio_wait_4
	note NOTE_DURATION_4, E_1, 31
	audio_wait_66
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	note NOTE_DURATION_4, F_1, 31
	audio_wait_4
	note NOTE_DURATION_4, E_1, 24
	audio_wait_4
	audio_end

Sfx_108:
	db 1, 0
	dw Sfx_108_Ch1

Sfx_109_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 56
	note NOTE_DURATION_1, C_5, 14
	audio_wait_3
	note G_4
	audio_wait_3
	audio_end

Sfx_109_Ch2:
	semitone_offset 0
	wave WAVE_1A
	volume 56
	note NOTE_DURATION_1, F#4, 14
	audio_wait_3
	note C#4
	audio_wait_3
	audio_end

Sfx_109:
	db 2, 0
	dw Sfx_109_Ch1
	dw Sfx_109_Ch2

Sfx_10a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 47
	pitch_offset_mult 7
	note NOTE_DURATION_28, C_2, 12
	audio_wait_4
	pitch_offset 6
	audio_wait_1
	note B_2
	audio_wait_1
	note B_3
	audio_wait_1
	note D_5
	audio_wait_1
	note A#5
	audio_wait_1
	note E_7
	audio_wait_1
	note G_7
	audio_wait_18
	audio_end

Sfx_10a:
	db 1, 0
	dw Sfx_10a_Ch1

Sfx_10b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_38
	volume 75
	note NOTE_DURATION_80, C_1, 19
	audio_wait_80
	audio_end

Sfx_10b:
	db 1, 0
	dw Sfx_10b_Ch1

Sfx_10c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 120
	note NOTE_DURATION_3, G_1, 19
	audio_wait_3
	note G#1, 21
	audio_wait_3
	note A_1, 23
	audio_wait_3
	note NOTE_DURATION_2, A#1, 19
	audio_wait_3
	note NOTE_DURATION_4, B_1, 20
	audio_wait_3
	note NOTE_DURATION_5, C_2, 22
	audio_wait_3
	note NOTE_DURATION_2, C#2, 21
	audio_wait_3
	note NOTE_DURATION_4, D_2, 24
	audio_wait_3
	note NOTE_DURATION_2, D#2
	audio_wait_3
	note NOTE_DURATION_4, E_2
	audio_wait_3
	note NOTE_DURATION_2, F_2, 22
	audio_wait_3
	note F#2, 20
	audio_wait_3
	note G_2, 22
	audio_wait_3
	note G#2
	audio_wait_3
	note NOTE_DURATION_3, A_2
	audio_wait_3
	note NOTE_DURATION_2, A#2, 21
	audio_wait_3
	note NOTE_DURATION_4, B_2, 20
	audio_wait_3
	note NOTE_DURATION_2, C_3, 22
	audio_wait_3
	note C#3, 21
	audio_wait_3
	note NOTE_DURATION_3, D_3, 22
	audio_wait_3
	note NOTE_DURATION_2, D#3, 23
	audio_wait_3
	note NOTE_DURATION_5, E_3, 25
	audio_wait_3
	note NOTE_DURATION_2, F_3, 23
	audio_wait_3
	note NOTE_DURATION_5, F#3, 24
	audio_wait_3
	note G_3
	audio_wait_5
	audio_end

Sfx_10c:
	db 1, 0
	dw Sfx_10c_Ch1

Sfx_10d_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_45
	volume 120
	note NOTE_DURATION_6, F#3, 31
	audio_wait_6
	note NOTE_DURATION_2, F#3, 9
	audio_wait_2
	note NOTE_DURATION_2, F#3, 12
	audio_wait_2
	note NOTE_DURATION_2, F#3, 4
	audio_wait_2
	audio_end

Sfx_10d:
	db 1, 0
	dw Sfx_10d_Ch1

Sfx_10e_Ch1:
	semitone_offset 244
	tempo 74
	wave WAVE_4B
	vibrato_amplitude 0
	volume 85
	pitch_offset 0
	note NOTE_DURATION_3, G_2, 15
	audio_wait_3
	note C#3
	audio_wait_3
	note F_4
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note D#4
	audio_wait_3
	note G_3
	audio_wait_3
	note G_2
	audio_wait_3
	note C#3
	audio_wait_3
	note F_4
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note D#4
	audio_wait_3
	note G_3
	audio_wait_3
	note G_2
	audio_wait_3
	note C#3
	audio_wait_3
	note F_4
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note D#4
	audio_wait_3
	note G_3
	audio_wait_3
	audio_end

Sfx_10e_Ch2:
	semitone_offset 244
	wave WAVE_1A
	volume 66
	vibrato_amplitude 0
	pitch_offset 0
	audio_wait_9
	note NOTE_DURATION_3, G_2, 15
	audio_wait_3
	note C#3
	audio_wait_3
	note F_4
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note D#4
	audio_wait_3
	note G_3
	audio_wait_3
	note G_2
	audio_wait_3
	note C#3
	audio_wait_3
	note F_4
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note D#4
	audio_wait_3
	note G_3
	audio_wait_3
	note G_2
	audio_wait_3
	note C#3
	audio_wait_3
	note F_4
	audio_wait_3
	note D_3
	audio_wait_3
	note F#3
	audio_wait_3
	note D#4
	audio_wait_3
	note G_3
	audio_wait_3
	audio_end

Sfx_10e:
	db 2, 0
	dw Sfx_10e_Ch1
	dw Sfx_10e_Ch2

Sfx_10f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 94
	pitch_offset 0
	note NOTE_DURATION_3, G_1, 31
	audio_wait_3
	note NOTE_DURATION_7, F#1, 24
	audio_wait_7
	audio_end

Sfx_10f:
	db 1, 0
	dw Sfx_10f_Ch1

Sfx_110_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 94
	pitch_offset 0
	note NOTE_DURATION_3, G_1, 31
	audio_wait_3
	note NOTE_DURATION_7, F#1, 24
	audio_wait_7
	audio_end

Sfx_110_Ch2:
	semitone_offset 0
	wave WAVE_10
	vibrato_amplitude 0
	volume 94
	pitch_offset 0
	note NOTE_DURATION_1, C_2, 24
	audio_wait_2
	note D_2
	audio_wait_2
	note E_2
	audio_wait_2
	note F_2
	audio_wait_2
	note G_2
	audio_wait_2
	audio_end

Sfx_110:
	db 2, 0
	dw Sfx_110_Ch1
	dw Sfx_110_Ch2

Sfx_111_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	vibrato_amplitude 0
	note NOTE_DURATION_7, C_2, 28
	audio_wait_6
	note NOTE_DURATION_4, D_2
	audio_wait_4
	audio_end

Sfx_111:
	db 1, 0
	dw Sfx_111_Ch1

Sfx_112_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_11
	vibrato_amplitude 0
	volume 85
	pitch_offset 0
	note NOTE_DURATION_4, C_2, 19
	audio_wait_3
	note F_2
	audio_wait_3
	note NOTE_DURATION_4, C#2, 24
	audio_wait_3
	note F#2
	audio_wait_3
	note NOTE_DURATION_4, D_2, 27
	audio_wait_3
	note G_2
	audio_wait_3
	note NOTE_DURATION_4, D#2, 29
	audio_wait_2
	note G#2
	audio_wait_4
	note NOTE_DURATION_4, E_2, 31
	audio_wait_3
	note A_2
	audio_wait_3
	note F_2
	audio_wait_3
	note A#2
	audio_wait_4
	audio_end

Sfx_112_Ch2:
	semitone_offset 0
	wave WAVE_1B
	volume 66
	vibrato_amplitude 0
	pitch_offset 0
	audio_wait_3
	note NOTE_DURATION_4, C_2, 17
	audio_wait_3
	note F_2
	audio_wait_3
	note NOTE_DURATION_4, C#2, 22
	audio_wait_3
	note F#2
	audio_wait_3
	note NOTE_DURATION_4, D_2, 24
	audio_wait_3
	note G_2
	audio_wait_3
	note NOTE_DURATION_4, D#2, 27
	audio_wait_2
	note G#2
	audio_wait_4
	note NOTE_DURATION_4, E_2, 29
	audio_wait_3
	note A_2
	audio_wait_3
	note F_2
	audio_wait_3
	note A#2
	audio_wait_4
	audio_end

Sfx_112_Ch3:
	semitone_offset 0
	wave WAVE_60
	volume 94
	vibrato_amplitude 0
	pitch_offset 0
	audio_wait_6
	note NOTE_DURATION_4, C_2, 17
	audio_wait_3
	note F_2
	audio_wait_3
	note NOTE_DURATION_4, C#2, 22
	audio_wait_3
	note F#2
	audio_wait_3
	note NOTE_DURATION_4, D_2, 24
	audio_wait_3
	note G_2
	audio_wait_3
	note NOTE_DURATION_4, D#2, 27
	audio_wait_2
	note G#2
	audio_wait_4
	note NOTE_DURATION_4, E_2, 29
	audio_wait_3
	note A_2
	audio_wait_3
	note F_2
	audio_wait_3
	note A#2
	audio_wait_4
	audio_end

Sfx_112:
	db 3, 0
	dw Sfx_112_Ch1
	dw Sfx_112_Ch2
	dw Sfx_112_Ch3

Sfx_113_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 113
	note NOTE_DURATION_2, D_3, 21
	audio_wait_3
	note G_3
	audio_wait_3
	note C_4
	audio_wait_3
	note D_3, 9
	audio_wait_3
	note G_3
	audio_wait_3
	note C_4
	audio_wait_3
	note D_3, 2
	audio_wait_3
	note G_3
	audio_wait_3
	note C_4
	audio_wait_3
	audio_end

Sfx_113:
	db 1, 0
	dw Sfx_113_Ch1

Sfx_114_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 85
	vibrato_amplitude 0
	note NOTE_DURATION_7, C_2, 24
	audio_wait_6
	note NOTE_DURATION_4, D_2
	audio_wait_4
	audio_end

Sfx_114:
	db 1, 0
	dw Sfx_114_Ch1

Sfx_115_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 66
	vibrato_amplitude 0
	note NOTE_DURATION_7, C_2, 17
	audio_wait_6
	note NOTE_DURATION_4, D_2
	audio_wait_4
	audio_end

Sfx_115:
	db 1, 0
	dw Sfx_115_Ch1

Sfx_116_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 47
	vibrato_amplitude 0
	note NOTE_DURATION_7, C_2, 12
	audio_wait_6
	note NOTE_DURATION_4, D_2
	audio_wait_4
	audio_end

Sfx_116:
	db 1, 0
	dw Sfx_116_Ch1

Sfx_117_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	volume 113
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 20
	vibrato_disabled FALSE
	note NOTE_DURATION_48, C_3, 29
	audio_wait_72
	note D#3
	audio_wait_24
	audio_wait_48
	note E_3
	audio_wait_48
	audio_wait_24
	note_sustain
	note D#3
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_0
	audio_end

Sfx_117_Ch2:
	semitone_offset 1
	wave WAVE_14
	volume 85
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 20
	vibrato_disabled FALSE
	audio_wait_8
	note NOTE_DURATION_48, C_3, 22
	audio_wait_72
	note D#3
	audio_wait_24
	audio_wait_48
	note E_3
	audio_wait_48
	audio_wait_24
	note_sustain
	note D#3
	audio_wait_72
	audio_wait_72
	note NOTE_DURATION_0
	audio_end

Sfx_117:
	db 2, 0
	dw Sfx_117_Ch1
	dw Sfx_117_Ch2

Sfx_118_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_46
	volume 85
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 20
	vibrato_disabled FALSE
	note NOTE_DURATION_8, C_3, 22
	audio_wait_8
	note D#3
	audio_wait_8
	note E_3
	audio_wait_8
	note NOTE_DURATION_72, D#3
	audio_wait_72
	audio_end

Sfx_118_Ch2:
	semitone_offset 1
	wave WAVE_14
	volume 56
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 20
	vibrato_disabled FALSE
	audio_wait_18
	note NOTE_DURATION_8, C_3, 14
	audio_wait_8
	note D#3
	audio_wait_8
	note E_3
	audio_wait_8
	note NOTE_DURATION_72, D#3
	audio_wait_72
	audio_end

Sfx_118:
	db 2, 0
	dw Sfx_118_Ch1
	dw Sfx_118_Ch2

Sfx_119_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	pitch_offset 0
	pitch_offset_mult 10
	note NOTE_DURATION_24, E_4, 21
	audio_wait_7
	pitch_offset -2
	audio_wait_8
	note D_2
	audio_wait_9
	note NOTE_DURATION_24, E_4, 14
	pitch_offset -6
	audio_wait_10
	note C_2
	audio_wait_8
	note B_1
	audio_wait_2
	note A#1
	audio_wait_3
	note A_1
	audio_wait_1
	note NOTE_DURATION_30, E_4, 9
	pitch_offset -16
	audio_wait_11
	note G_1
	audio_wait_7
	note F#1
	audio_wait_6
	note F_1
	audio_wait_6
	note NOTE_DURATION_18, E_4, 7
	pitch_offset -24
	audio_wait_8
	note D#1
	audio_wait_3
	note D_1
	audio_wait_4
	note C#1
	audio_wait_3
	note NOTE_DURATION_11, E_4, 4
	pitch_offset -32
	audio_wait_4
	note B_0
	audio_wait_7
	audio_end

Sfx_119:
	db 1, 0
	dw Sfx_119_Ch1

Sfx_11a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 113
	note NOTE_DURATION_7, G#0, 19
	audio_wait_8
	note NOTE_DURATION_7, A#0, 22
	audio_wait_8
	note NOTE_DURATION_7, C_1, 24
	audio_wait_8
	note NOTE_DURATION_7, C#1, 27
	audio_wait_8
	note NOTE_DURATION_7, D#1, 31
	audio_wait_8
	audio_end

Sfx_11a:
	db 1, 0
	dw Sfx_11a_Ch1

Sfx_11b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 75
	note NOTE_DURATION_3, G_1, 19
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note G_1
	audio_wait_3
	note A_1
	audio_wait_3
	note B_1
	audio_wait_3
	audio_end

Sfx_11b_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 113
	audio_wait_44
	note NOTE_DURATION_7, G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	note G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	note G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	note G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	note G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	note G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	note G#0, 19
	audio_wait_44
	audio_end

Sfx_11b:
	db 2, 0
	dw Sfx_11b_Ch1
	dw Sfx_11b_Ch2

Sfx_11c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	vibrato_amplitude 0
	volume 120
	note NOTE_DURATION_1, F_3, 17
	audio_wait_10
	note F#3
	audio_wait_6
	note G_3
	audio_wait_6
	note G#3
	audio_wait_3
	note A_3
	audio_wait_3
	note A#3
	audio_wait_3
	note B_3
	audio_wait_3
	note C_4
	audio_wait_3
	note C#4
	audio_wait_3
	note D_4
	audio_wait_3
	note D#4
	audio_wait_3
	note E_4
	audio_wait_3
	note F_4
	audio_wait_3
	note F#4
	audio_wait_3
	note G_4
	audio_wait_3
	note G#4
	audio_wait_3
	note A_4
	audio_wait_3
	note A#4
	audio_wait_3
	note B_4
	audio_wait_3
	note C_5
	audio_wait_2
	audio_end

Sfx_11c:
	db 1, 0
	dw Sfx_11c_Ch1

Sfx_11d_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 94
	note NOTE_DURATION_3, G_1, 17
	audio_wait_3
	note G#1
	audio_wait_3
	note A_1
	audio_wait_3
	note A#1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note C#2
	audio_wait_3
	note C_2
	audio_wait_3
	note B_1
	audio_wait_3
	note A#1
	audio_wait_3
	note A_1
	audio_wait_3
	note G#1
	audio_wait_3
	note G_1
	audio_wait_3
	note F#1
	audio_wait_3
	note F_1
	audio_wait_3
	note E_1
	audio_wait_3
	note D#1
	audio_wait_3
	note D_1
	audio_wait_3
	note C#1
	audio_wait_3
	note C_1
	audio_wait_3
	note B_0
	audio_wait_3
	note A#0
	audio_wait_3
	note G_1
	audio_wait_3
	note G#1
	audio_wait_3
	note A_1
	audio_wait_3
	note A#1
	audio_wait_3
	note B_1
	audio_wait_3
	note C_2
	audio_wait_3
	note C#2
	audio_wait_3
	note C_2
	audio_wait_3
	note B_1
	audio_wait_3
	note A#1
	audio_wait_3
	note A_1
	audio_wait_3
	note G#1
	audio_wait_3
	note G_1
	audio_wait_3
	note F#1
	audio_wait_3
	note F_1
	audio_wait_3
	note E_1
	audio_wait_3
	note D#1
	audio_wait_3
	note D_1
	audio_wait_3
	note C#1
	audio_wait_3
	note C_1
	audio_wait_3
	note B_0
	audio_wait_3
	note A#0
	audio_wait_3
	audio_end

Sfx_11d:
	db 1, 0
	dw Sfx_11d_Ch1

Sfx_11e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_19
	volume 75
	note NOTE_DURATION_36, C#5, 19
	audio_wait_48
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_24, D_5
	audio_wait_24
	note NOTE_DURATION_72, E_5
	audio_wait_72
	note NOTE_DURATION_24, B_4
	audio_wait_24
	note NOTE_DURATION_72, C#5
	audio_wait_72
	audio_end

Sfx_11e_Ch2:
	semitone_offset 0
	wave WAVE_0F
	volume 75
	note NOTE_DURATION_60, A_4, 19
	audio_wait_72
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_24, G#4
	audio_wait_24
	note F#4
	audio_wait_24
	note NOTE_DURATION_48, G#4
	audio_wait_48
	note NOTE_DURATION_72, A_4
	audio_wait_72
	audio_end

Sfx_11e:
	db 2, 0
	dw Sfx_11e_Ch1
	dw Sfx_11e_Ch2

Sfx_11f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_19
	volume 75
	note NOTE_DURATION_48, F#4, 19
	audio_wait_48
	note NOTE_DURATION_24, G#4
	audio_wait_24
	note A_4
	audio_wait_24
	note NOTE_DURATION_48, E_4
	audio_wait_48
	note NOTE_DURATION_24, G#4
	audio_wait_24
	note A_4
	audio_wait_24
	note NOTE_DURATION_72, B_4
	audio_wait_72
	audio_end

Sfx_11f_Ch2:
	semitone_offset 0
	wave WAVE_0F
	volume 75
	note NOTE_DURATION_48, D_4, 19
	audio_wait_48
	note NOTE_DURATION_24, E_4
	audio_wait_24
	note F#4
	audio_wait_24
	note NOTE_DURATION_48, C#4
	audio_wait_48
	note NOTE_DURATION_24, E_4
	audio_wait_24
	note F#4
	audio_wait_24
	note NOTE_DURATION_72, G#4
	audio_wait_72
	audio_end

Sfx_11f:
	db 2, 0
	dw Sfx_11f_Ch1
	dw Sfx_11f_Ch2

Sfx_120_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_19
	volume 75
	note NOTE_DURATION_48, A_4, 19
	audio_wait_48
	note NOTE_DURATION_24, C#5
	audio_wait_24
	note A_5
	audio_wait_24
	note NOTE_DURATION_72, G#5
	audio_wait_72
	note NOTE_DURATION_24, E_5
	audio_wait_24
	note NOTE_DURATION_72, A_5
	audio_wait_72
	audio_end

Sfx_120_Ch2:
	semitone_offset 0
	wave WAVE_0F
	volume 75
	note NOTE_DURATION_48, F#4, 19
	audio_wait_48
	note NOTE_DURATION_24, A_4
	audio_wait_24
	note C#5
	audio_wait_24
	note NOTE_DURATION_72, B_4
	audio_wait_72
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_72, C#5
	audio_wait_72
	audio_end

Sfx_120:
	db 2, 0
	dw Sfx_120_Ch1
	dw Sfx_120_Ch2

Sfx_121_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_19
	volume 75
	note NOTE_DURATION_24, F#5, 19
	audio_wait_24
	note D_5
	audio_wait_24
	note A_4
	audio_wait_24
	note F#4
	audio_wait_24
	note NOTE_DURATION_48
	audio_wait_48
	note NOTE_DURATION_48, G#4
	audio_wait_48
	note NOTE_DURATION_72, A_4
	audio_wait_72
	audio_end

Sfx_121_Ch2:
	semitone_offset 0
	wave WAVE_0F
	volume 75
	note NOTE_DURATION_24, D_5, 19
	audio_wait_24
	note A_4
	audio_wait_24
	note F#4
	audio_wait_24
	note D_4
	audio_wait_24
	note NOTE_DURATION_48, B_3
	audio_wait_48
	note NOTE_DURATION_24, E_4
	audio_wait_24
	note D_4
	audio_wait_24
	note NOTE_DURATION_72, C#4
	audio_wait_72
	audio_end

Sfx_121:
	db 2, 0
	dw Sfx_121_Ch1
	dw Sfx_121_Ch2

Sfx_122_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0F
	volume 75
	note NOTE_DURATION_24, A_3, 19
	audio_wait_24
	note C#4
	audio_wait_24
	note E_4
	audio_wait_24
	note A_4
	audio_wait_24
	note NOTE_DURATION_24, G#3
	audio_wait_24
	note B_3
	audio_wait_24
	note E_4
	audio_wait_24
	note G#4
	audio_wait_24
	note NOTE_DURATION_72, A_4
	audio_wait_72
	audio_end

Sfx_122:
	db 1, 0
	dw Sfx_122_Ch1

Sfx_123_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_39
	volume 94
	vibrato_amplitude 0
	pitch_offset 0
	note NOTE_DURATION_48, G_1, 31
	audio_wait_48
	wave WAVE_6A
	note NOTE_DURATION_5, E_1, 31
	audio_wait_6
	note NOTE_DURATION_6, C_2, 24
	audio_wait_6
	note NOTE_DURATION_4, 14
	audio_wait_4
	note NOTE_DURATION_2, 9
	audio_wait_2
	note 4
	audio_wait_2
	note 2
	audio_wait_2
	audio_end

Sfx_123:
	db 1, 0
	dw Sfx_123_Ch1

Sfx_124_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6B
	volume 120
	note NOTE_DURATION_7, A_1, 31
	audio_wait_8
	note NOTE_DURATION_5, G_1, 27
	audio_wait_6
	note NOTE_DURATION_5, F_1, 24
	audio_wait_6
	note NOTE_DURATION_5, E_1, 19
	audio_wait_6
	note NOTE_DURATION_5, D_1, 17
	audio_wait_6
	note NOTE_DURATION_5, D_1, 9
	audio_wait_6
	note NOTE_DURATION_5, D_1, 7
	audio_wait_6
	note NOTE_DURATION_5, D_1, 7
	audio_wait_6
	note NOTE_DURATION_5, D_1, 7
	audio_wait_6
	audio_end

Sfx_124:
	db 1, 0
	dw Sfx_124_Ch1

Sfx_125_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 94
	note NOTE_DURATION_14, F_1, 24
	audio_wait_14
	audio_end

Sfx_125:
	db 1, 0
	dw Sfx_125_Ch1

Sfx_126_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 75
	note NOTE_DURATION_14, F_1, 19
	audio_wait_14
	audio_end

Sfx_126:
	db 1, 0
	dw Sfx_126_Ch1

Sfx_127_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_1A
	vibrato_amplitude 50
	vibrato_speed 50
	volume 56
	note NOTE_DURATION_72, F_3, 14
	audio_wait_72
	note F#3, 9
	audio_wait_72
	note G_3, 4
	audio_wait_72
	note G#3, 2
	audio_wait_72
	audio_end

Sfx_127_Ch2:
	semitone_offset 0
	wave WAVE_60
	vibrato_amplitude 50
	vibrato_speed 50
	volume 75
	note NOTE_DURATION_72, C#3, 19
	audio_wait_72
	note D_3
	audio_wait_72
	note D#3, 14
	audio_wait_72
	note E_3
	audio_wait_72
	audio_end

Sfx_127:
	db 2, 0
	dw Sfx_127_Ch1
	dw Sfx_127_Ch2

Sfx_128_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 0
	volume 94
	note NOTE_DURATION_4, E_2, 24
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 19
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 14
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 9
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	note E_2, 4
	audio_wait_5
	note A_2
	audio_wait_5
	note D_3
	audio_wait_5
	note G_3
	audio_wait_5
	note D#3
	audio_wait_5
	note B_3
	audio_wait_5
	audio_end

Sfx_128:
	db 1, 0
	dw Sfx_128_Ch1

Sfx_129_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_7, A_1, 19
	audio_wait_8
	note NOTE_DURATION_5, A_1, 12
	audio_wait_6
	note NOTE_DURATION_5, A_1, 7
	audio_wait_6
	audio_end

Sfx_129:
	db 1, 0
	dw Sfx_129_Ch1

Sfx_12a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_1, D_2, 29
	audio_wait_4
	note A_1
	audio_wait_14
	note NOTE_DURATION_1, D_2, 17
	audio_wait_4
	note A_1
	audio_wait_14
	audio_end

Sfx_12a:
	db 1, 0
	dw Sfx_12a_Ch1

Sfx_12b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_60
	volume 94
	note NOTE_DURATION_3, C_4, 24
	audio_wait_4
	audio_end

Sfx_12b:
	db 1, 0
	dw Sfx_12b_Ch1

Sfx_12c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_1, C_3, 31
	audio_wait_3
	note G_3
	audio_wait_3
	audio_end

Sfx_12c_Ch2:
	semitone_offset 0
	wave WAVE_1A
	volume 120
	note NOTE_DURATION_1, F#2, 31
	audio_wait_3
	note C#3
	audio_wait_3
	audio_end

Sfx_12c:
	db 2, 0
	dw Sfx_12c_Ch1
	dw Sfx_12c_Ch2

Sfx_12d_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 66
	note NOTE_DURATION_8, C_3, 17
	audio_wait_10
	note G_2
	audio_wait_10
	note C_3
	audio_wait_10
	note G_2
	audio_wait_10
	note C_3
	audio_wait_10
	note G_2
	audio_wait_10
	note C_3
	audio_wait_10
	audio_end

Sfx_12d:
	db 1, 2
	dw Sfx_12d_Ch1

Sfx_12e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 113
	audio_wait_96
	audio_wait_96
	audio_wait_30
	note NOTE_DURATION_7, G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	note G#0, 19
	audio_wait_8
	note A#0, 22
	audio_wait_8
	note C_1, 24
	audio_wait_8
	note C#1, 27
	audio_wait_8
	note D#1, 31
	audio_wait_8
	audio_end

Sfx_12e_Ch2:
	semitone_offset 0
	wave WAVE_1A
	vibrato_amplitude 50
	vibrato_speed 50
	volume 75
	note NOTE_DURATION_60, F_3, 19
	audio_wait_60
	note NOTE_DURATION_40, F#3
	audio_wait_40
	note G_3, 14
	audio_wait_40
	note G#3, 9
	audio_wait_40
	note NOTE_DURATION_20, A_3
	audio_wait_20
	note NOTE_DURATION_96, A#3
	audio_wait_96
	audio_end

Sfx_12e_Ch3:
	semitone_offset 0
	wave WAVE_60
	vibrato_amplitude 50
	vibrato_speed 50
	volume 94
	note NOTE_DURATION_60, C#3, 24
	audio_wait_60
	note NOTE_DURATION_40, D_3
	audio_wait_40
	note D#3, 19
	audio_wait_40
	note E_3
	audio_wait_40
	note NOTE_DURATION_20, F_3
	audio_wait_20
	note NOTE_DURATION_96, F#3, 14
	audio_wait_96
	audio_end

Sfx_12e_Ch4:
	semitone_offset 0
	wave WAVE_6A
	vibrato_amplitude 30
	volume 94
	audio_wait_96
	note NOTE_DURATION_96, C_3, 17
	audio_wait_96
	note NOTE_DURATION_30, C#3
	audio_wait_30
	audio_end

Sfx_12e:
	db 4, 0
	dw Sfx_12e_Ch1
	dw Sfx_12e_Ch2
	dw Sfx_12e_Ch3
	dw Sfx_12e_Ch4

Sfx_12f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 85
	audio_wait_10
	note NOTE_DURATION_2, G_3, 22
	audio_wait_3
	note NOTE_DURATION_2, G_3, 12
	audio_wait_3
	note NOTE_DURATION_2, G_3, 22
	audio_wait_3
	note NOTE_DURATION_2, G_3, 12
	audio_wait_3
	audio_end

Sfx_12f:
	db 1, 2
	dw Sfx_12f_Ch1

Sfx_130_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 56
	note NOTE_DURATION_1, D_3, 9
	audio_wait_1
	note NOTE_DURATION_1, D_3, 14
	audio_wait_5
	audio_end

Sfx_130:
	db 1, 0
	dw Sfx_130_Ch1

Sfx_131_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_4, E_1, 31
	audio_wait_4
	note NOTE_DURATION_4, F_1, 24
	audio_wait_4
	audio_end

Sfx_131:
	db 1, 0
	dw Sfx_131_Ch1

Sfx_132_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	volume 120
	note NOTE_DURATION_1, G#2, 31
	audio_wait_3
	note E_0
	audio_wait_3
	note A#5
	audio_wait_10
	audio_end

Sfx_132:
	db 1, 0
	dw Sfx_132_Ch1

Sfx_133_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_64
	volume 120
	note NOTE_DURATION_1, B_4, 31
	audio_wait_6
	note F#3
	audio_wait_6
	audio_end

Sfx_133:
	db 1, 0
	dw Sfx_133_Ch1

Sfx_134_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_39
	volume 75
	note NOTE_DURATION_80, D_2, 19
	audio_wait_80
	audio_end

Sfx_134:
	db 1, 0
	dw Sfx_134_Ch1

Sfx_135_Ch1:
	semitone_offset 250
	tempo 74
	wave WAVE_6D
	volume 75
	note NOTE_DURATION_3, B_2, 19
	audio_wait_3
	note A#2
	audio_wait_3
	note A_2
	audio_wait_3
	note B_2
	audio_wait_3
	note A#2
	audio_wait_3
	note A_2
	audio_wait_3
	note B_2
	audio_wait_3
	note A#2
	audio_wait_3
	note A_2
	audio_wait_3
	audio_end

Sfx_135:
	db 1, 0
	dw Sfx_135_Ch1

Sfx_136_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_1A
	volume 94
	note NOTE_DURATION_1, C_2, 24
	audio_wait_3
	note D_3
	audio_wait_3
	note A#3
	audio_wait_3
	audio_end

Sfx_136:
	db 1, 0
	dw Sfx_136_Ch1

Sfx_137_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_1, D_2, 24
	audio_wait_4
	note A_1
	audio_wait_4
	audio_end

Sfx_137:
	db 1, 0
	dw Sfx_137_Ch1

Sfx_138_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_1, F_2, 24
	audio_wait_5
	note C_2
	audio_wait_10
	note NOTE_DURATION_1, F_2, 14
	audio_wait_5
	note C_2
	audio_wait_10
	audio_end

Sfx_138:
	db 1, 0
	dw Sfx_138_Ch1
