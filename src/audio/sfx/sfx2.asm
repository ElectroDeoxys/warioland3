Sfx_02e_Ch1: ; 3c000 (0f:4000)
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
; 0x3c015

Sfx_02e: ; 3c015 (0f:4015)
	db 1, 0
	dw Sfx_02e_Ch1
; 0x3c019

Sfx_02f_Ch1: ; 3c019 (0f:4019)
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
; 0x3c02a

Sfx_02f: ; 3c02a (0f:402a)
	db 1, 0
	dw Sfx_02f_Ch1
; 0x3c02e

Sfx_Pipe_Ch1: ; 3c02e (0f:402e)
	semitone_offset 0
	tempo 74
	wave WAVE_35
	volume 120
	note NOTE_DURATION_8, C_4, 24
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_16
	audio_end
; 0x3c03d

Sfx_Pipe: ; 3c03d (0f:403d)
	db 1, 0
	dw Sfx_Pipe_Ch1
; 0x3c041

Sfx_MusicalCoin_Ch1: ; 3c041 (0f:4041)
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
; 0x3c079

Sfx_MusicalCoin_Ch2: ; 3c079 (0f:4079)
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
; 0x3c0ae

Sfx_MusicalCoin: ; 3c0ae (0f:40ae)
	db 2, 0
	dw Sfx_MusicalCoin_Ch1
	dw Sfx_MusicalCoin_Ch2
; 0x3c0b4

Sfx_Key_Ch1: ; 3c0b4 (0f:40b4)
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
; 0x3c0ff

Sfx_Key_Ch2: ; 3c0ff (0f:40ff)
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
; 0x3c14f

Sfx_Key: ; 3c14f (0f:414f)
	db 2, 0
	dw Sfx_Key_Ch1
	dw Sfx_Key_Ch2
; 0x3c155

Sfx_GroundPound_Ch1: ; 3c155 (0f:4155)
	semitone_offset 0
	tempo 74
	wave WAVE_6E
	volume 120
	note NOTE_DURATION_10, C_1, 31
	audio_wait_12
	note NOTE_DURATION_10, C_1, 31
	audio_wait_12
	audio_end
; 0x3c166

Sfx_GroundPound: ; 3c166 (0f:4166)
	db 1, 0
	dw Sfx_GroundPound_Ch1
; 0x3c16a

Sfx_034_Ch1: ; 3c16a (0f:416a)
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
; 0x3c187

Sfx_034_Ch2: ; 3c187 (0f:4187)
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
; 0x3c1ac

Sfx_034: ; 3c1ac (0f:41ac)
	db 2, 0
	dw Sfx_034_Ch1
	dw Sfx_034_Ch2
; 0x3c1b2

Sfx_035_Ch1: ; 3c1b2 (0f:41b2)
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
; 0x3c1c8

Sfx_035: ; 3c1c8 (0f:41c8)
	db 1, 0
	dw Sfx_035_Ch1
; 0x3c1cc

Sfx_Sleep_Ch1: ; 3c1cc (0f:41cc)
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
; 0x3c1ea

Sfx_Sleep: ; 3c1ea (0f:41ea)
	db 1, 0
	dw Sfx_Sleep_Ch1
; 0x3c1ee

Sfx_WaterSurface_Ch1: ; 3c1ee (0f:41ee)
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
; 0x3c206

Sfx_WaterSurface: ; 3c206 (0f:4206)
	db 1, 0
	dw Sfx_WaterSurface_Ch1
; 0x3c20a

Sfx_Climb_Ch1: ; 3c20a (0f:420a)
	semitone_offset 0
	tempo 74
	wave WAVE_6C
	volume 56
	note NOTE_DURATION_16, F_1, 19
	audio_wait_16
	note NOTE_DURATION_16
	audio_wait_16
	audio_end
; 0x3c219

Sfx_Climb_Ch2: ; 3c219 (0f:4219)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 113
	note NOTE_DURATION_3, F_0, 24
	audio_wait_16
	note NOTE_DURATION_3
	audio_wait_16
	audio_end
; 0x3c228

Sfx_Climb: ; 3c228 (0f:4228)
	db 2, 0
	dw Sfx_Climb_Ch1
	dw Sfx_Climb_Ch2
; 0x3c22e

Sfx_039_Ch1: ; 3c22e (0f:422e)
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
; 0x3c253

Sfx_039: ; 3c253 (0f:4253)
	db 1, 0
	dw Sfx_039_Ch1
; 0x3c257

Sfx_03a_Ch1: ; 3c257 (0f:4257)
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
; 0x3c296

Sfx_03a: ; 3c296 (0f:4296)
	db 1, 0
	dw Sfx_03a_Ch1
; 0x3c29a

Sfx_FatWalk_Ch1: ; 3c29a (0f:429a)
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
; 0x3c2ad

Sfx_FatWalk: ; 3c2ad (0f:42ad)
	db 1, 0
	dw Sfx_FatWalk_Ch1
; 0x3c2b1

Sfx_03c_Ch1: ; 3c2b1 (0f:42b1)
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
; 0x3c2d4

Sfx_03c: ; 3c2d4 (0f:42d4)
	db 1, 0
	dw Sfx_03c_Ch1
; 0x3c2d8

Sfx_03d_Ch1: ; 3c2d8 (0f:42d8)
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
; 0x3c329

Sfx_03d: ; 3c329 (0f:4329)
	db 1, 0
	dw Sfx_03d_Ch1
; 0x3c32d

Sfx_03e_Ch1: ; 3c32d (0f:432d)
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
; 0x3c374

Sfx_03e: ; 3c374 (0f:4374)
	db 1, 0
	dw Sfx_03e_Ch1
; 0x3c378

Sfx_03f_Ch1: ; 3c378 (0f:4378)
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
; 0x3c3ab

Sfx_03f_Ch2: ; 3c3ab (0f:43ab)
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
; 0x3c3dc

Sfx_03f: ; 3c3dc (0f:43dc)
	db 2, 0
	dw Sfx_03f_Ch1
	dw Sfx_03f_Ch2
; 0x3c3e2

Sfx_040_Ch1: ; 3c3e2 (0f:43e2)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	vibrato_amplitude 30
	volume 94
	note NOTE_DURATION_16, C_3, 17
	audio_wait_16
	audio_end
; 0x3c3f1

Sfx_040: ; 3c3f1 (0f:43f1)
	db 1, 0
	dw Sfx_040_Ch1
; 0x3c3f5

Sfx_041_Ch1: ; 3c3f5 (0f:43f5)
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
; 0x3c418

Sfx_041: ; 3c418 (0f:4418)
	db 1, 0
	dw Sfx_041_Ch1
; 0x3c41c

Sfx_042_Ch1: ; 3c41c (0f:441c)
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
; 0x3c452

Sfx_042: ; 3c452 (0f:4452)
	db 1, 0
	dw Sfx_042_Ch1
; 0x3c456

Sfx_043_Ch1: ; 3c456 (0f:4456)
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
; 0x3c4a9

Sfx_043: ; 3c4a9 (0f:44a9)
	db 1, 0
	dw Sfx_043_Ch1
; 0x3c4ad

Sfx_044_Ch1: ; 3c4ad (0f:44ad)
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
; 0x3c520

Sfx_044: ; 3c520 (0f:4520)
	db 1, 0
	dw Sfx_044_Ch1
; 0x3c524

Sfx_045_Ch1: ; 3c524 (0f:4524)
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
; 0x3c557

Sfx_045_Ch2: ; 3c557 (0f:4557)
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
; 0x3c588

Sfx_045_Ch3: ; 3c588 (0f:4588)
	semitone_offset 0
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F#1, 31
	audio_wait_10
	note NOTE_DURATION_8, F#1, 4
	audio_wait_10
	audio_end
; 0x3c597

Sfx_045: ; 3c597 (0f:4597)
	db 3, 0
	dw Sfx_045_Ch1
	dw Sfx_045_Ch2
	dw Sfx_045_Ch3
; 0x3c59f

Sfx_046_Ch1: ; 3c59f (0f:459f)
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
; 0x3c5d4

Sfx_046_Ch2: ; 3c5d4 (0f:45d4)
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
; 0x3c607

Sfx_046_Ch3: ; 3c607 (0f:4607)
	semitone_offset 0
	wave WAVE_65
	volume 120
	audio_wait_32
	note NOTE_DURATION_8, G#1, 31
	audio_wait_10
	note NOTE_DURATION_8, G#1, 9
	audio_wait_10
	audio_end
; 0x3c617

Sfx_046: ; 3c617 (0f:4617)
	db 3, 0
	dw Sfx_046_Ch1
	dw Sfx_046_Ch2
	dw Sfx_046_Ch3
; 0x3c61f

Sfx_047_Ch1: ; 3c61f (0f:461f)
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
; 0x3c683

Sfx_047: ; 3c683 (0f:4683)
	db 1, 0
	dw Sfx_047_Ch1
; 0x3c687

Sfx_048_Ch1: ; 3c687 (0f:4687)
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
; 0x3c6ef

Sfx_048_Ch2: ; 3c6ef (0f:46ef)
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
; 0x3c718

Sfx_048: ; 3c718 (0f:4718)
	db 2, 0
	dw Sfx_048_Ch1
	dw Sfx_048_Ch2
; 0x3c71e

Sfx_049_Ch1: ; 3c71e (0f:471e)
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_2, D#3, 31
	audio_wait_6
	note C_4
	audio_wait_2
	audio_end
; 0x3c72d

Sfx_049: ; 3c72d (0f:472d)
	db 1, 0
	dw Sfx_049_Ch1
; 0x3c731

Sfx_CrouchWalk_Ch1: ; 3c731 (0f:4731)
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
; 0x3c741

Sfx_CrouchWalk: ; 3c741 (0f:4741)
	db 1, 0
	dw Sfx_CrouchWalk_Ch1
; 0x3c745

Sfx_ColourCoin_Ch1: ; 3c745 (0f:4745)
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
; 0x3c77c

Sfx_ColourCoin: ; 3c77c (0f:477c)
	db 1, 0
	dw Sfx_ColourCoin_Ch1
; 0x3c780

Sfx_04c_Ch1: ; 3c780 (0f:4780)
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
; 0x3c7b6

Sfx_04c_Ch2: ; 3c7b6 (0f:47b6)
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
; 0x3c7eb

Sfx_04c: ; 3c7eb (0f:47eb)
	db 2, 0
	dw Sfx_04c_Ch1
	dw Sfx_04c_Ch2
; 0x3c7f1

Sfx_061_Ch1: ; 3c7f1 (0f:47f1)
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
; 0x3c80f

Sfx_061: ; 3c80f (0f:480f)
	db 1, 0
	dw Sfx_061_Ch1
; 0x3c813

Sfx_062_Ch1: ; 3c813 (0f:4813)
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
; 0x3c82a

Sfx_062: ; 3c82a (0f:482a)
	db 1, 0
	dw Sfx_062_Ch1
; 0x3c82e

Sfx_063_Ch1: ; 3c82e (0f:482e)
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
; 0x3c84c

Sfx_063: ; 3c84c (0f:484c)
	db 1, 0
	dw Sfx_063_Ch1
; 0x3c850

Sfx_064_Ch1: ; 3c850 (0f:4850)
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
; 0x3c8a1

Sfx_064: ; 3c8a1 (0f:48a1)
	db 1, 0
	dw Sfx_064_Ch1
; 0x3c8a5

Sfx_065_Ch1: ; 3c8a5 (0f:48a5)
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
; 0x3c8b7

Sfx_065: ; 3c8b7 (0f:48b7)
	db 1, 0
	dw Sfx_065_Ch1
; 0x3c8bb

Sfx_066_Ch1: ; 3c8bb (0f:48bb)
	semitone_offset 0
	tempo 74
	wave WAVE_40
	volume 94
	note NOTE_DURATION_1, F_1, 27
	audio_wait_8
	note NOTE_DURATION_1, F_1, 12
	audio_wait_8
	audio_end
; 0x3c8cc

Sfx_066: ; 3c8cc (0f:48cc)
	db 1, 0
	dw Sfx_066_Ch1
; 0x3c8d0

Sfx_067_Ch1: ; 3c8d0 (0f:48d0)
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
; 0x3c8eb

Sfx_067: ; 3c8eb (0f:48eb)
	db 1, 0
	dw Sfx_067_Ch1
; 0x3c8ef

Sfx_068_Ch1: ; 3c8ef (0f:48ef)
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
; 0x3c906

Sfx_068: ; 3c906 (0f:4906)
	db 1, 0
	dw Sfx_068_Ch1
; 0x3c90a

Sfx_069_Ch1: ; 3c90a (0f:490a)
	semitone_offset 0
	tempo 74
	wave WAVE_3E
	volume 85
	pitch_offset -74
	note NOTE_DURATION_16, C_1, 22
	audio_wait_16
	audio_end
; 0x3c919

Sfx_069: ; 3c919 (0f:4919)
	db 1, 0
	dw Sfx_069_Ch1
; 0x3c91d

Sfx_06a_Ch1: ; 3c91d (0f:491d)
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
; 0x3c93b

Sfx_06a: ; 3c93b (0f:493b)
	db 1, 0
	dw Sfx_06a_Ch1
; 0x3c93f

Sfx_06b_Ch1: ; 3c93f (0f:493f)
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
; 0x3c952

Sfx_06b: ; 3c952 (0f:4952)
	db 1, 0
	dw Sfx_06b_Ch1
; 0x3c956

Sfx_06c_Ch1: ; 3c956 (0f:4956)
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
; 0x3c9c0

Sfx_06c: ; 3c9c0 (0f:49c0)
	db 1, 0
	dw Sfx_06c_Ch1
; 0x3c9c4

Sfx_06d_Ch1: ; 3c9c4 (0f:49c4)
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
; 0x3c9d5

Sfx_06d: ; 3c9d5 (0f:49d5)
	db 1, 0
	dw Sfx_06d_Ch1
; 0x3c9d9

Sfx_06e_Ch1: ; 3c9d9 (0f:49d9)
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
; 0x3c9f3

Sfx_06e: ; 3c9f3 (0f:49f3)
	db 1, 0
	dw Sfx_06e_Ch1
; 0x3c9f7

Sfx_06f_Ch1: ; 3c9f7 (0f:49f7)
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
; 0x3ca12

Sfx_06f: ; 3ca12 (0f:4a12)
	db 1, 0
	dw Sfx_06f_Ch1
; 0x3ca16

Sfx_070_Ch1: ; 3ca16 (0f:4a16)
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
; 0x3ca2d

Sfx_070: ; 3ca2d (0f:4a2d)
	db 1, 0
	dw Sfx_070_Ch1
; 0x3ca31

Sfx_071_Ch1: ; 3ca31 (0f:4a31)
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
; 0x3ca46

Sfx_071: ; 3ca46 (0f:4a46)
	db 1, 2
	dw Sfx_071_Ch1
; 0x3ca4a

Sfx_072_Ch1: ; 3ca4a (0f:4a4a)
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
; 0x3ca7d

Sfx_072: ; 3ca7d (0f:4a7d)
	db 1, 0
	dw Sfx_072_Ch1
; 0x3ca81

Sfx_073_Ch1: ; 3ca81 (0f:4a81)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F#1, 31
	audio_wait_10
	note NOTE_DURATION_8, F#1, 4
	audio_wait_10
	audio_end
; 0x3ca92

Sfx_073: ; 3ca92 (0f:4a92)
	db 1, 0
	dw Sfx_073_Ch1
; 0x3ca96

Sfx_074_Ch1: ; 3ca96 (0f:4a96)
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
; 0x3cad0

Sfx_074: ; 3cad0 (0f:4ad0)
	db 1, 0
	dw Sfx_074_Ch1
; 0x3cad4

Sfx_075_Ch1: ; 3cad4 (0f:4ad4)
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
; 0x3caf1

Sfx_075: ; 3caf1 (0f:4af1)
	db 1, 0
	dw Sfx_075_Ch1
; 0x3caf5

Sfx_076_Ch1: ; 3caf5 (0f:4af5)
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
; 0x3cb0a

Sfx_076: ; 3cb0a (0f:4b0a)
	db 1, 0
	dw Sfx_076_Ch1
; 0x3cb0e

Sfx_077_Ch1: ; 3cb0e (0f:4b0e)
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
; 0x3cb30

Sfx_077: ; 3cb30 (0f:4b30)
	db 1, 0
	dw Sfx_077_Ch1
; 0x3cb34

Sfx_078_Ch1: ; 3cb34 (0f:4b34)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_6, F#1, 31
	audio_wait_6
	note NOTE_DURATION_2, 18
	audio_wait_2
	audio_end
; 0x3cb44

Sfx_078: ; 3cb44 (0f:4b44)
	db 1, 0
	dw Sfx_078_Ch1
; 0x3cb48

Sfx_079_Ch1: ; 3cb48 (0f:4b48)
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
; 0x3cb7a

Sfx_079: ; 3cb7a (0f:4b7a)
	db 1, 0
	dw Sfx_079_Ch1
; 0x3cb7e

Sfx_07a_Ch1: ; 3cb7e (0f:4b7e)
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
; 0x3cb97

Sfx_07a: ; 3cb97 (0f:4b97)
	db 1, 0
	dw Sfx_07a_Ch1
; 0x3cb9b

Sfx_07b_Ch1: ; 3cb9b (0f:4b9b)
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
; 0x3cbae

Sfx_07b: ; 3cbae (0f:4bae)
	db 1, 0
	dw Sfx_07b_Ch1
; 0x3cbb2

Sfx_07c_Ch1: ; 3cbb2 (0f:4bb2)
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
; 0x3cc1c

Sfx_07c_Ch2: ; 3cc1c (0f:4c1c)
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
; 0x3cc84

Sfx_07c: ; 3cc84 (0f:4c84)
	db 2, 0
	dw Sfx_07c_Ch1
	dw Sfx_07c_Ch2
; 0x3cc8a

Sfx_07d_Ch1: ; 3cc8a (0f:4c8a)
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
; 0x3cc9d

Sfx_07d: ; 3cc9d (0f:4c9d)
	db 1, 0
	dw Sfx_07d_Ch1
; 0x3cca1

Sfx_07e_Ch1: ; 3cca1 (0f:4ca1)
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 120
	note NOTE_DURATION_4, A_0, 31
	audio_wait_8
	note NOTE_DURATION_4, A_0, 14
	audio_wait_8
	audio_end
; 0x3ccb2

Sfx_07e: ; 3ccb2 (0f:4cb2)
	db 1, 0
	dw Sfx_07e_Ch1
; 0x3ccb6

Sfx_07f_Ch1: ; 3ccb6 (0f:4cb6)
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
; 0x3cce7

Sfx_07f: ; 3cce7 (0f:4ce7)
	db 1, 0
	dw Sfx_07f_Ch1
; 0x3cceb

Sfx_080_Ch1: ; 3cceb (0f:4ceb)
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
; 0x3cd08

Sfx_080: ; 3cd08 (0f:4d08)
	db 1, 0
	dw Sfx_080_Ch1
; 0x3cd0c

Sfx_081_Ch1: ; 3cd0c (0f:4d0c)
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
; 0x3cd77

Sfx_081: ; 3cd77 (0f:4d77)
	db 1, 0
	dw Sfx_081_Ch1
; 0x3cd7b

Sfx_082_Ch1: ; 3cd7b (0f:4d7b)
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
; 0x3cdc8

Sfx_082_Ch2: ; 3cdc8 (0f:4dc8)
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
; 0x3ce0a

Sfx_082: ; 3ce0a (0f:4e0a)
	db 2, 0
	dw Sfx_082_Ch1
	dw Sfx_082_Ch2
; 0x3ce10

Sfx_083_Ch1: ; 3ce10 (0f:4e10)
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
; 0x3ce3b

Sfx_083_Ch2: ; 3ce3b (0f:4e3b)
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
; 0x3ce5a

Sfx_083: ; 3ce5a (0f:4e5a)
	db 2, 0
	dw Sfx_083_Ch1
	dw Sfx_083_Ch2
; 0x3ce60

Sfx_084_Ch1: ; 3ce60 (0f:4e60)
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
; 0x3ce7b

Sfx_084: ; 3ce7b (0f:4e7b)
	db 1, 0
	dw Sfx_084_Ch1
; 0x3ce7f

Sfx_085_Ch1: ; 3ce7f (0f:4e7f)
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
; 0x3ce90

Sfx_085: ; 3ce90 (0f:4e90)
	db 1, 0
	dw Sfx_085_Ch1
; 0x3ce94

Sfx_086_Ch1: ; 3ce94 (0f:4e94)
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
; 0x3cead

Sfx_086: ; 3cead (0f:4ead)
	db 1, 0
	dw Sfx_086_Ch1
; 0x3ceb1

Sfx_087_Ch1: ; 3ceb1 (0f:4eb1)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 75
	note NOTE_DURATION_2, F_3, 22
	audio_wait_3
	note NOTE_DURATION_2, E_3, 20
	audio_wait_3
	audio_end
; 0x3cec2

Sfx_087: ; 3cec2 (0f:4ec2)
	db 1, 0
	dw Sfx_087_Ch1
; 0x3cec6

Sfx_088_Ch1: ; 3cec6 (0f:4ec6)
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
; 0x3ceff

Sfx_088_Ch2: ; 3ceff (0f:4eff)
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
; 0x3cf36

Sfx_088: ; 3cf36 (0f:4f36)
	db 2, 0
	dw Sfx_088_Ch1
	dw Sfx_088_Ch2
; 0x3cf3c

Sfx_089_Ch1: ; 3cf3c (0f:4f3c)
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
; 0x3cf57

Sfx_089: ; 3cf57 (0f:4f57)
	db 1, 0
	dw Sfx_089_Ch1
; 0x3cf5b

Sfx_08a_Ch1: ; 3cf5b (0f:4f5b)
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
; 0x3cf98

Sfx_08a_Ch2: ; 3cf98 (0f:4f98)
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
; 0x3cfd5

Sfx_08a: ; 3cfd5 (0f:4fd5)
	db 2, 0
	dw Sfx_08a_Ch1
	dw Sfx_08a_Ch2
; 0x3cfdb

Sfx_08b_Ch1: ; 3cfdb (0f:4fdb)
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
; 0x3d000

Sfx_08b: ; 3d000 (0f:5000)
	db 1, 0
	dw Sfx_08b_Ch1
; 0x3d004

Sfx_08c_Ch1: ; 3d004 (0f:5004)
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
; 0x3d02d

Sfx_08c: ; 3d02d (0f:502d)
	db 1, 0
	dw Sfx_08c_Ch1
; 0x3d031

Sfx_08d_Ch1: ; 3d031 (0f:5031)
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
; 0x3d08c

Sfx_08d: ; 3d08c (0f:508c)
	db 1, 0
	dw Sfx_08d_Ch1
; 0x3d090

Sfx_08e_Ch1: ; 3d090 (0f:5090)
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
; 0x3d0f9

Sfx_08e: ; 3d0f9 (0f:50f9)
	db 1, 0
	dw Sfx_08e_Ch1
; 0x3d0fd

Sfx_08f_Ch1: ; 3d0fd (0f:50fd)
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
; 0x3d11e

Sfx_08f: ; 3d11e (0f:511e)
	db 1, 0
	dw Sfx_08f_Ch1
; 0x3d122

Sfx_0a1_Ch1: ; 3d122 (0f:5122)
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
; 0x3d163

Sfx_0a1: ; 3d163 (0f:5163)
	db 1, 0
	dw Sfx_0a1_Ch1
; 0x3d167

Sfx_0a2_Ch1: ; 3d167 (0f:5167)
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
; 0x3d18e

Sfx_0a2_Ch2: ; 3d18e (0f:518e)
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
; 0x3d1b3

Sfx_0a2: ; 3d1b3 (0f:51b3)
	db 2, 0
	dw Sfx_0a2_Ch1
	dw Sfx_0a2_Ch2
; 0x3d1b9

Sfx_0a3_Ch1: ; 3d1b9 (0f:51b9)
	semitone_offset 0
	tempo 74
	wave WAVE_3A
	volume 75
	note NOTE_DURATION_20, C_4, 19
	audio_wait_20
	audio_end
; 0x3d1c6

Sfx_0a3: ; 3d1c6 (0f:51c6)
	db 1, 0
	dw Sfx_0a3_Ch1
; 0x3d1ca

Sfx_0a4_Ch1: ; 3d1ca (0f:51ca)
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
; 0x3d1f5

Sfx_0a4: ; 3d1f5 (0f:51f5)
	db 1, 0
	dw Sfx_0a4_Ch1
; 0x3d1f9

Sfx_0a5_Ch1: ; 3d1f9 (0f:51f9)
	semitone_offset 0
	tempo 74
	wave WAVE_42
	volume 120
	note NOTE_DURATION_7, B_0, 31
	audio_wait_7
	audio_end
; 0x3d206

Sfx_0a5: ; 3d206 (0f:5206)
	db 1, 0
	dw Sfx_0a5_Ch1
; 0x3d20a

Sfx_0a6_Ch1: ; 3d20a (0f:520a)
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
; 0x3d24b

Sfx_0a6: ; 3d24b (0f:524b)
	db 1, 0
	dw Sfx_0a6_Ch1
; 0x3d24f

Sfx_0a7_Ch1: ; 3d24f (0f:524f)
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
; 0x3d2a8

Sfx_0a7: ; 3d2a8 (0f:52a8)
	db 1, 0
	dw Sfx_0a7_Ch1
; 0x3d2ac

Sfx_0a8_Ch1: ; 3d2ac (0f:52ac)
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
; 0x3d2e7

Sfx_0a8_Ch2: ; 3d2e7 (0f:52e7)
	semitone_offset 0
	wave WAVE_3A
	volume 120
	note NOTE_DURATION_96, G_1, 31
	audio_wait_96
	audio_end
; 0x3d2f2

Sfx_0a8: ; 3d2f2 (0f:52f2)
	db 2, 0
	dw Sfx_0a8_Ch1
	dw Sfx_0a8_Ch2
; 0x3d2f8

Sfx_0a9_Ch1: ; 3d2f8 (0f:52f8)
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
; 0x3d355

Sfx_0a9: ; 3d355 (0f:5355)
	db 1, 0
	dw Sfx_0a9_Ch1
; 0x3d359

Sfx_0aa_Ch1: ; 3d359 (0f:5359)
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
; 0x3d372

Sfx_0aa_Ch2: ; 3d372 (0f:5372)
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
; 0x3d385

Sfx_0aa: ; 3d385 (0f:5385)
	db 2, 0
	dw Sfx_0aa_Ch1
	dw Sfx_0aa_Ch2
; 0x3d38b

Sfx_0ab_Ch1: ; 3d38b (0f:538b)
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
; 0x3d3a9

Sfx_0ab: ; 3d3a9 (0f:53a9)
	db 1, 0
	dw Sfx_0ab_Ch1
; 0x3d3ad

Sfx_0ac_Ch1: ; 3d3ad (0f:53ad)
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
; 0x3d4ba

Sfx_0ac: ; 3d4ba (0f:54ba)
	db 1, 0
	dw Sfx_0ac_Ch1
; 0x3d4be

Sfx_0ad_Ch1: ; 3d4be (0f:54be)
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
; 0x3d4d0

Sfx_0ad: ; 3d4d0 (0f:54d0)
	db 1, 0
	dw Sfx_0ad_Ch1
; 0x3d4d4

Sfx_0ae_Ch1: ; 3d4d4 (0f:54d4)
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
; 0x3d4e7

Sfx_0ae: ; 3d4e7 (0f:54e7)
	db 1, 0
	dw Sfx_0ae_Ch1
; 0x3d4eb

Sfx_0af_Ch1: ; 3d4eb (0f:54eb)
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
; 0x3d4fe

Sfx_0af: ; 3d4fe (0f:54fe)
	db 1, 0
	dw Sfx_0af_Ch1
; 0x3d502

Sfx_0b0_Ch1: ; 3d502 (0f:5502)
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
; 0x3d536

Sfx_0b0_Ch2: ; 3d536 (0f:5536)
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
; 0x3d643

Sfx_0b0: ; 3d643 (0f:5643)
	db 2, 0
	dw Sfx_0b0_Ch1
	dw Sfx_0b0_Ch2
; 0x3d649

Sfx_0b1_Ch1: ; 3d649 (0f:5649)
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
; 0x3d684

Sfx_0b1: ; 3d684 (0f:5684)
	db 1, 0
	dw Sfx_0b1_Ch1
; 0x3d688

Sfx_0b2_Ch1: ; 3d688 (0f:5688)
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
; 0x3d6cf

Sfx_0b2_Ch2: ; 3d6cf (0f:56cf)
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
; 0x3d726

Sfx_0b2: ; 3d726 (0f:5726)
	db 2, 0
	dw Sfx_0b2_Ch1
	dw Sfx_0b2_Ch2
; 0x3d72c

Sfx_0b3_Ch1: ; 3d72c (0f:572c)
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
; 0x3d75b

Sfx_0b3: ; 3d75b (0f:575b)
	db 1, 0
	dw Sfx_0b3_Ch1
; 0x3d75f

Sfx_0b4_Ch1: ; 3d75f (0f:575f)
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
; 0x3d830

Sfx_0b4: ; 3d830 (0f:5830)
	db 1, 0
	dw Sfx_0b4_Ch1
; 0x3d834

Sfx_0b5_Ch1: ; 3d834 (0f:5834)
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
; 0x3d851

Sfx_0b5_Ch2: ; 3d851 (0f:5851)
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
; 0x3d86d

Sfx_0b5: ; 3d86d (0f:586d)
	db 2, 0
	dw Sfx_0b5_Ch1
	dw Sfx_0b5_Ch2
; 0x3d873

Sfx_0b6_Ch1: ; 3d873 (0f:5873)
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
; 0x3d890

Sfx_0b6_Ch2: ; 3d890 (0f:5890)
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
; 0x3d8ac

Sfx_0b6: ; 3d8ac (0f:58ac)
	db 2, 0
	dw Sfx_0b6_Ch1
	dw Sfx_0b6_Ch2
; 0x3d8b2

Sfx_0b7_Ch1: ; 3d8b2 (0f:58b2)
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
; 0x3d8cf

Sfx_0b7_Ch2: ; 3d8cf (0f:58cf)
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
; 0x3d8eb

Sfx_0b7: ; 3d8eb (0f:58eb)
	db 2, 0
	dw Sfx_0b7_Ch1
	dw Sfx_0b7_Ch2
; 0x3d8f1

Sfx_0b8_Ch1: ; 3d8f1 (0f:58f1)
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
; 0x3d90e

Sfx_0b8_Ch2: ; 3d90e (0f:590e)
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
; 0x3d92a

Sfx_0b8: ; 3d92a (0f:592a)
	db 2, 0
	dw Sfx_0b8_Ch1
	dw Sfx_0b8_Ch2
; 0x3d930

Sfx_0b9_Ch1: ; 3d930 (0f:5930)
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
; 0x3d94b

Sfx_0b9: ; 3d94b (0f:594b)
	db 1, 0
	dw Sfx_0b9_Ch1
; 0x3d94f

Sfx_0ba_Ch1: ; 3d94f (0f:594f)
	semitone_offset 0
	tempo 74
	wave WAVE_3C
	volume 120
	note NOTE_DURATION_12, E_3, 24
	audio_wait_12
	audio_end
; 0x3d95c

Sfx_0ba_Ch2: ; 3d95c (0f:595c)
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
; 0x3d96d

Sfx_0ba: ; 3d96d (0f:596d)
	db 2, 0
	dw Sfx_0ba_Ch1
	dw Sfx_0ba_Ch2
; 0x3d973

Sfx_0bb_Ch1: ; 3d973 (0f:5973)
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
; 0x3d994

Sfx_0bb_Ch2: ; 3d994 (0f:5994)
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
; 0x3d9b3

Sfx_0bb: ; 3d9b3 (0f:59b3)
	db 2, 0
	dw Sfx_0bb_Ch1
	dw Sfx_0bb_Ch2
; 0x3d9b9

Sfx_0bc_Ch1: ; 3d9b9 (0f:59b9)
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
; 0x3d9ef

Sfx_0bc: ; 3d9ef (0f:59ef)
	db 1, 0
	dw Sfx_0bc_Ch1
; 0x3d9f3

Sfx_0bd_Ch1: ; 3d9f3 (0f:59f3)
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
; 0x3da97

Sfx_0bd: ; 3da97 (0f:5a97)
	db 1, 0
	dw Sfx_0bd_Ch1
; 0x3da9b

Sfx_0be_Ch1: ; 3da9b (0f:5a9b)
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
; 0x3daca

Sfx_0be: ; 3daca (0f:5aca)
	db 1, 0
	dw Sfx_0be_Ch1
; 0x3dace

Sfx_0bf_Ch1: ; 3dace (0f:5ace)
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
; 0x3db17

Sfx_0bf: ; 3db17 (0f:5b17)
	db 1, 0
	dw Sfx_0bf_Ch1
; 0x3db1b

Sfx_0c0_Ch1: ; 3db1b (0f:5b1b)
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
; 0x3db76

Sfx_0c0: ; 3db76 (0f:5b76)
	db 1, 0
	dw Sfx_0c0_Ch1
; 0x3db7a

Sfx_0c1_Ch1: ; 3db7a (0f:5b7a)
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
; 0x3db8b

Sfx_0c1_Ch2: ; 3db8b (0f:5b8b)
	semitone_offset 0
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F_1, 24
	audio_wait_8
	audio_end
; 0x3db96

Sfx_0c1: ; 3db96 (0f:5b96)
	db 2, 0
	dw Sfx_0c1_Ch1
	dw Sfx_0c1_Ch2
; 0x3db9c

Sfx_0c2_Ch1: ; 3db9c (0f:5b9c)
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
; 0x3dbe8

Sfx_0c2: ; 3dbe8 (0f:5be8)
	db 1, 0
	dw Sfx_0c2_Ch1
; 0x3dbec

Sfx_0c3_Ch1: ; 3dbec (0f:5bec)
	semitone_offset 0
	tempo 74
	wave WAVE_44
	volume 75
	note NOTE_DURATION_10, F_2, 19
	audio_wait_20
	audio_end
; 0x3dbf9

Sfx_0c3: ; 3dbf9 (0f:5bf9)
	db 1, 0
	dw Sfx_0c3_Ch1
; 0x3dbfd

Sfx_0c4_Ch1: ; 3dbfd (0f:5bfd)
	semitone_offset 0
	tempo 74
	wave WAVE_3D
	volume 94
	note NOTE_DURATION_10, C_3, 17
	audio_wait_10
	audio_end
; 0x3dc0a

Sfx_0c4: ; 3dc0a (0f:5c0a)
	db 1, 0
	dw Sfx_0c4_Ch1
; 0x3dc0e

Sfx_0c5_Ch1: ; 3dc0e (0f:5c0e)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_1, B_5, 24
	audio_wait_6
	note F#4
	audio_wait_14
	audio_end
; 0x3dc1d

Sfx_0c5: ; 3dc1d (0f:5c1d)
	db 1, 0
	dw Sfx_0c5_Ch1
; 0x3dc21

Sfx_0c6_Ch1: ; 3dc21 (0f:5c21)
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
; 0x3dc34

Sfx_0c6: ; 3dc34 (0f:5c34)
	db 1, 0
	dw Sfx_0c6_Ch1
; 0x3dc38

Sfx_0c7_Ch1: ; 3dc38 (0f:5c38)
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
; 0x3dc7d

Sfx_0c7_Ch2: ; 3dc7d (0f:5c7d)
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
; 0x3dcbc

Sfx_0c7: ; 3dcbc (0f:5cbc)
	db 2, 0
	dw Sfx_0c7_Ch1
	dw Sfx_0c7_Ch2
; 0x3dcc2

Sfx_0c8_Ch1: ; 3dcc2 (0f:5cc2)
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
; 0x3ddd1

Sfx_0c8: ; 3ddd1 (0f:5dd1)
	db 1, 0
	dw Sfx_0c8_Ch1
; 0x3ddd5

Sfx_0c9_Ch1: ; 3ddd5 (0f:5dd5)
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_2, A_1, 31
	audio_wait_6
	note G#2
	audio_wait_2
	audio_end
; 0x3dde4

Sfx_0c9: ; 3dde4 (0f:5de4)
	db 1, 0
	dw Sfx_0c9_Ch1
; 0x3dde8

Sfx_0ca_Ch1: ; 3dde8 (0f:5de8)
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
; 0x3de16

Sfx_0ca_Ch2: ; 3de16 (0f:5e16)
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
; 0x3de42

Sfx_0ca: ; 3de42 (0f:5e42)
	db 2, 0
	dw Sfx_0ca_Ch1
	dw Sfx_0ca_Ch2
; 0x3de48

Sfx_0cb_Ch1: ; 3de48 (0f:5e48)
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
; 0x3de7c

Sfx_0cb: ; 3de7c (0f:5e7c)
	db 1, 0
	dw Sfx_0cb_Ch1
; 0x3de80

Sfx_0cc_Ch1: ; 3de80 (0f:5e80)
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
; 0x3df66

Sfx_0cc_Ch2: ; 3df66 (0f:5f66)
	semitone_offset 4
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 80
	volume 113
	pitch_offset 0
	audio_wait_6
	audio_call Sfx_0cc_Ch1.sub1
	audio_end
; 0x3df77

Sfx_0cc: ; 3df77 (0f:5f77)
	db 2, 0
	dw Sfx_0cc_Ch1
	dw Sfx_0cc_Ch2
; 0x3df7d

Sfx_0cd_Ch1: ; 3df7d (0f:5f7d)
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
; 0x3dfba

Sfx_0cd_Ch2: ; 3dfba (0f:5fba)
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
; 0x3dff6

Sfx_0cd_Ch3: ; 3dff6 (0f:5ff6)
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
; 0x3e032

Sfx_0cd: ; 3e032 (0f:6032)
	db 3, 0
	dw Sfx_0cd_Ch1
	dw Sfx_0cd_Ch2
	dw Sfx_0cd_Ch3
; 0x3e03a

Sfx_0ce_Ch1: ; 3e03a (0f:603a)
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
; 0x3e07d

Sfx_0ce_Ch2: ; 3e07d (0f:607d)
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
; 0x3e0c1

Sfx_0ce: ; 3e0c1 (0f:60c1)
	db 2, 0
	dw Sfx_0ce_Ch1
	dw Sfx_0ce_Ch2
; 0x3e0c7

Sfx_0cf_Ch1: ; 3e0c7 (0f:60c7)
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
; 0x3e124

Sfx_0cf_Ch2: ; 3e124 (0f:6124)
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
; 0x3e17f

Sfx_0cf: ; 3e17f (0f:617f)
	db 2, 0
	dw Sfx_0cf_Ch1
	dw Sfx_0cf_Ch2
; 0x3e185

Sfx_0d0_Ch1: ; 3e185 (0f:6185)
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
; 0x3e23a

Sfx_0d0: ; 3e23a (0f:623a)
	db 1, 0
	dw Sfx_0d0_Ch1
; 0x3e23e

Sfx_0d1_Ch1: ; 3e23e (0f:623e)
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
; 0x3e25b

Sfx_0d1_Ch2: ; 3e25b (0f:625b)
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
; 0x3e29e

Sfx_0d1: ; 3e29e (0f:629e)
	db 2, 0
	dw Sfx_0d1_Ch1
	dw Sfx_0d1_Ch2
; 0x3e2a4

Sfx_0e1_Ch1: ; 3e2a4 (0f:62a4)
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
; 0x3e2b7

Sfx_0e1: ; 3e2b7 (0f:62b7)
	db 1, 0
	dw Sfx_0e1_Ch1
; 0x3e2bb

Sfx_0e2_Ch1: ; 3e2bb (0f:62bb)
	semitone_offset 0
	tempo 74
	wave WAVE_3C
	volume 75
	note NOTE_DURATION_8, E_2, 19
	audio_wait_8
	audio_end
; 0x3e2c8

Sfx_0e2: ; 3e2c8 (0f:62c8)
	db 1, 0
	dw Sfx_0e2_Ch1
; 0x3e2cc

Sfx_Selection_Ch1: ; 3e2cc (0f:62cc)
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
; 0x3e2e8

Sfx_Selection: ; 3e2e8 (0f:62e8)
	db 1, 0
	dw Sfx_Selection_Ch1
; 0x3e2ec

Sfx_0e4_Ch1: ; 3e2ec (0f:62ec)
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
; 0x3e303

Sfx_0e4: ; 3e303 (0f:6303)
	db 1, 0
	dw Sfx_0e4_Ch1
; 0x3e307

Sfx_0e5_Ch1: ; 3e307 (0f:6307)
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
; 0x3e31e

Sfx_0e5_Ch2: ; 3e31e (0f:631e)
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
; 0x3e333

Sfx_0e5: ; 3e333 (0f:6333)
	db 2, 0
	dw Sfx_0e5_Ch1
	dw Sfx_0e5_Ch2
; 0x3e339

Sfx_0e6_Ch1: ; 3e339 (0f:6339)
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
; 0x3e356

Sfx_0e6: ; 3e356 (0f:6356)
	db 1, 0
	dw Sfx_0e6_Ch1
; 0x3e35a

Sfx_0e7_Ch1: ; 3e35a (0f:635a)
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
; 0x3e376

Sfx_0e7: ; 3e376 (0f:6376)
	db 1, 0
	dw Sfx_0e7_Ch1
; 0x3e37a

Sfx_0e8_Ch1: ; 3e37a (0f:637a)
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
; 0x3e412

Sfx_0e8: ; 3e412 (0f:6412)
	db 1, 0
	dw Sfx_0e8_Ch1
; 0x3e416

Sfx_0e9_Ch1: ; 3e416 (0f:6416)
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
; 0x3e440

Sfx_0e9: ; 3e440 (0f:6440)
	db 1, 0
	dw Sfx_0e9_Ch1
; 0x3e444

Sfx_0ea_Ch1: ; 3e444 (0f:6444)
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
; 0x3e46e

Sfx_0ea: ; 3e46e (0f:646e)
	db 1, 0
	dw Sfx_0ea_Ch1
; 0x3e472

Sfx_0eb_Ch1: ; 3e472 (0f:6472)
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
; 0x3e499

Sfx_0eb_Ch2: ; 3e499 (0f:6499)
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
; 0x3e4bf

Sfx_0eb: ; 3e4bf (0f:64bf)
	db 2, 0
	dw Sfx_0eb_Ch1
	dw Sfx_0eb_Ch2
; 0x3e4c5

Sfx_0ec_Ch1: ; 3e4c5 (0f:64c5)
	semitone_offset 0
	tempo 74
	wave WAVE_25
	volume 113
	note NOTE_DURATION_2, E_5, 29
	audio_wait_2
	note C_5
	audio_wait_2
	audio_end
; 0x3e4d4

Sfx_0ec: ; 3e4d4 (0f:64d4)
	db 1, 0
	dw Sfx_0ec_Ch1
; 0x3e4d8

Sfx_0ed_Ch1: ; 3e4d8 (0f:64d8)
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
; 0x3e506

Sfx_0ed: ; 3e506 (0f:6506)
	db 1, 0
	dw Sfx_0ed_Ch1
; 0x3e50a

Sfx_0ee_Ch1: ; 3e50a (0f:650a)
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
; 0x3e558

Sfx_0ee: ; 3e558 (0f:6558)
	db 1, 0
	dw Sfx_0ee_Ch1
; 0x3e55c

Sfx_0ef_Ch1: ; 3e55c (0f:655c)
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
; 0x3e57b

Sfx_0ef: ; 3e57b (0f:657b)
	db 1, 0
	dw Sfx_0ef_Ch1
; 0x3e57f

Sfx_0f0_Ch1: ; 3e57f (0f:657f)
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
; 0x3e5b4

Sfx_0f0: ; 3e5b4 (0f:65b4)
	db 1, 0
	dw Sfx_0f0_Ch1
; 0x3e5b8

Sfx_0f1_Ch1: ; 3e5b8 (0f:65b8)
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
; 0x3e5c9

Sfx_0f1: ; 3e5c9 (0f:65c9)
	db 1, 0
	dw Sfx_0f1_Ch1
; 0x3e5cd

Sfx_0f2_Ch1: ; 3e5cd (0f:65cd)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_1, F#3, 24
	audio_wait_6
	note B_4
	audio_wait_14
	audio_end
; 0x3e5dc

Sfx_0f2: ; 3e5dc (0f:65dc)
	db 1, 0
	dw Sfx_0f2_Ch1
; 0x3e5e0

Sfx_0f3_Ch1: ; 3e5e0 (0f:65e0)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	vibrato_amplitude 30
	volume 94
	note NOTE_DURATION_14, C_3, 17
	audio_wait_14
	audio_end
; 0x3e5ef

Sfx_0f3: ; 3e5ef (0f:65ef)
	db 1, 0
	dw Sfx_0f3_Ch1
; 0x3e5f3

Sfx_0f4_Ch1: ; 3e5f3 (0f:65f3)
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
; 0x3e610

Sfx_0f4: ; 3e610 (0f:6610)
	db 1, 0
	dw Sfx_0f4_Ch1
; 0x3e614

Sfx_0f5_Ch1: ; 3e614 (0f:6614)
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
; 0x3e63d

Sfx_0f5: ; 3e63d (0f:663d)
	db 1, 0
	dw Sfx_0f5_Ch1
; 0x3e641

Sfx_Plane1_Ch1: ; 3e641 (0f:6641)
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
; 0x3e654

Sfx_Plane1: ; 3e654 (0f:6654)
	db 1, 0
	dw Sfx_Plane1_Ch1
; 0x3e658

Sfx_Plane2_Ch1: ; 3e658 (0f:6658)
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
; 0x3e66b

Sfx_Plane2: ; 3e66b (0f:666b)
	db 1, 0
	dw Sfx_Plane2_Ch1
; 0x3e66f

Sfx_Plane3_Ch1: ; 3e66f (0f:666f)
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
; 0x3e682

Sfx_Plane3: ; 3e682 (0f:6682)
	db 1, 0
	dw Sfx_Plane3_Ch1
; 0x3e686

Sfx_PlaneExplosion_Ch1: ; 3e686 (0f:6686)
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
; 0x3e6a5

Sfx_PlaneExplosion: ; 3e6a5 (0f:66a5)
	db 1, 0
	dw Sfx_PlaneExplosion_Ch1
; 0x3e6a9

Sfx_0fa_Ch1: ; 3e6a9 (0f:66a9)
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
; 0x3e6dd

Sfx_0fa_Ch2: ; 3e6dd (0f:66dd)
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
; 0x3e70e

Sfx_0fa_Ch3: ; 3e70e (0f:670e)
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
; 0x3e73f

Sfx_0fa: ; 3e73f (0f:673f)
	db 3, 0
	dw Sfx_0fa_Ch1
	dw Sfx_0fa_Ch2
	dw Sfx_0fa_Ch3
; 0x3e747

Sfx_101_Ch1: ; 3e747 (0f:6747)
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
; 0x3e78c

Sfx_101: ; 3e78c (0f:678c)
	db 1, 0
	dw Sfx_101_Ch1
; 0x3e790

Sfx_102_Ch1: ; 3e790 (0f:6790)
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
; 0x3e7c1

Sfx_102: ; 3e7c1 (0f:67c1)
	db 1, 0
	dw Sfx_102_Ch1
; 0x3e7c5

Sfx_103_Ch1: ; 3e7c5 (0f:67c5)
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
; 0x3e7da

Sfx_103: ; 3e7da (0f:67da)
	db 1, 0
	dw Sfx_103_Ch1
; 0x3e7de

Sfx_104_Ch1: ; 3e7de (0f:67de)
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
; 0x3e839

Sfx_104: ; 3e839 (0f:6839)
	db 1, 0
	dw Sfx_104_Ch1
; 0x3e83d

Sfx_105_Ch1: ; 3e83d (0f:683d)
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
; 0x3e8a5

Sfx_105_Ch2: ; 3e8a5 (0f:68a5)
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
; 0x3e972

Sfx_105: ; 3e972 (0f:6972)
	db 2, 0
	dw Sfx_105_Ch1
	dw Sfx_105_Ch2
; 0x3e978

Sfx_106_Ch1: ; 3e978 (0f:6978)
	semitone_offset 0
	tempo 74
	volume 120
	wave WAVE_0B
	note NOTE_DURATION_2, A#4, 31
	audio_wait_2
	note NOTE_DURATION_16, A#5
	audio_wait_16
	audio_end
; 0x3e988

Sfx_106: ; 3e988 (0f:6988)
	db 1, 0
	dw Sfx_106_Ch1
; 0x3e98c

Sfx_107_Ch1: ; 3e98c (0f:698c)
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
; 0x3e9a1

Sfx_107: ; 3e9a1 (0f:69a1)
	db 1, 0
	dw Sfx_107_Ch1
; 0x3e9a5

Sfx_108_Ch1: ; 3e9a5 (0f:69a5)
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
; 0x3ea09

Sfx_108: ; 3ea09 (0f:6a09)
	db 1, 0
	dw Sfx_108_Ch1
; 0x3ea0d

Sfx_109_Ch1: ; 3ea0d (0f:6a0d)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 56
	note NOTE_DURATION_1, C_5, 14
	audio_wait_3
	note G_4
	audio_wait_3
	audio_end
; 0x3ea1c

Sfx_109_Ch2: ; 3ea1c (0f:6a1c)
	semitone_offset 0
	wave WAVE_1A
	volume 56
	note NOTE_DURATION_1, F#4, 14
	audio_wait_3
	note C#4
	audio_wait_3
	audio_end
; 0x3ea29

Sfx_109: ; 3ea29 (0f:6a29)
	db 2, 0
	dw Sfx_109_Ch1
	dw Sfx_109_Ch2
; 0x3ea2f

Sfx_10a_Ch1: ; 3ea2f (0f:6a2f)
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
; 0x3ea4d

Sfx_10a: ; 3ea4d (0f:6a4d)
	db 1, 0
	dw Sfx_10a_Ch1
; 0x3ea51

Sfx_10b_Ch1: ; 3ea51 (0f:6a51)
	semitone_offset 0
	tempo 74
	wave WAVE_38
	volume 75
	note NOTE_DURATION_80, C_1, 19
	audio_wait_80
	audio_end
; 0x3ea5e

Sfx_10b: ; 3ea5e (0f:6a5e)
	db 1, 0
	dw Sfx_10b_Ch1
; 0x3ea62

Sfx_10c_Ch1: ; 3ea62 (0f:6a62)
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
; 0x3eac5

Sfx_10c: ; 3eac5 (0f:6ac5)
	db 1, 0
	dw Sfx_10c_Ch1
; 0x3eac9

Sfx_10d_Ch1: ; 3eac9 (0f:6ac9)
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
; 0x3eae2

Sfx_10d: ; 3eae2 (0f:6ae2)
	db 1, 0
	dw Sfx_10d_Ch1
; 0x3eae6

Sfx_10e_Ch1: ; 3eae6 (0f:6ae6)
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
; 0x3eb1f

Sfx_10e_Ch2: ; 3eb1f (0f:6b1f)
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
; 0x3eb57

Sfx_10e: ; 3eb57 (0f:6b57)
	db 2, 0
	dw Sfx_10e_Ch1
	dw Sfx_10e_Ch2
; 0x3eb5d

Sfx_10f_Ch1: ; 3eb5d (0f:6b5d)
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
; 0x3eb72

Sfx_10f: ; 3eb72 (0f:6b72)
	db 1, 0
	dw Sfx_10f_Ch1
; 0x3eb76

Sfx_110_Ch1: ; 3eb76 (0f:6b76)
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
; 0x3eb8b

Sfx_110_Ch2: ; 3eb8b (0f:6b8b)
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
; 0x3eba2

Sfx_110: ; 3eba2 (0f:6ba2)
	db 2, 0
	dw Sfx_110_Ch1
	dw Sfx_110_Ch2
; 0x3eba8

Sfx_111_Ch1: ; 3eba8 (0f:6ba8)
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
; 0x3ebba

Sfx_111: ; 3ebba (0f:6bba)
	db 1, 0
	dw Sfx_111_Ch1
; 0x3ebbe

Sfx_112_Ch1: ; 3ebbe (0f:6bbe)
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
; 0x3ebed

Sfx_112_Ch2: ; 3ebed (0f:6bed)
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
; 0x3ec1b

Sfx_112_Ch3: ; 3ec1b (0f:6c1b)
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
; 0x3ec49

Sfx_112: ; 3ec49 (0f:6c49)
	db 3, 0
	dw Sfx_112_Ch1
	dw Sfx_112_Ch2
	dw Sfx_112_Ch3
; 0x3ec51

Sfx_113_Ch1: ; 3ec51 (0f:6c51)
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
; 0x3ec70

Sfx_113: ; 3ec70 (0f:6c70)
	db 1, 0
	dw Sfx_113_Ch1
; 0x3ec74

Sfx_114_Ch1: ; 3ec74 (0f:6c74)
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
; 0x3ec86

Sfx_114: ; 3ec86 (0f:6c86)
	db 1, 0
	dw Sfx_114_Ch1
; 0x3ec8a

Sfx_115_Ch1: ; 3ec8a (0f:6c8a)
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
; 0x3ec9c

Sfx_115: ; 3ec9c (0f:6c9c)
	db 1, 0
	dw Sfx_115_Ch1
; 0x3eca0

Sfx_116_Ch1: ; 3eca0 (0f:6ca0)
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
; 0x3ecb2

Sfx_116: ; 3ecb2 (0f:6cb2)
	db 1, 0
	dw Sfx_116_Ch1
; 0x3ecb6

Sfx_117_Ch1: ; 3ecb6 (0f:6cb6)
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
; 0x3ecd6

Sfx_117_Ch2: ; 3ecd6 (0f:6cd6)
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
; 0x3ecf5

Sfx_117: ; 3ecf5 (0f:6cf5)
	db 2, 0
	dw Sfx_117_Ch1
	dw Sfx_117_Ch2
; 0x3ecfb

Sfx_118_Ch1: ; 3ecfb (0f:6cfb)
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
; 0x3ed17

Sfx_118_Ch2: ; 3ed17 (0f:6d17)
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
; 0x3ed32

Sfx_118: ; 3ed32 (0f:6d32)
	db 2, 0
	dw Sfx_118_Ch1
	dw Sfx_118_Ch2
; 0x3ed38

Sfx_119_Ch1: ; 3ed38 (0f:6d38)
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
; 0x3ed7c

Sfx_119: ; 3ed7c (0f:6d7c)
	db 1, 0
	dw Sfx_119_Ch1
; 0x3ed80

Sfx_11a_Ch1: ; 3ed80 (0f:6d80)
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
; 0x3ed9d

Sfx_11a: ; 3ed9d (0f:6d9d)
	db 1, 0
	dw Sfx_11a_Ch1
; 0x3eda1

Sfx_11b_Ch1: ; 3eda1 (0f:6da1)
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
; 0x3ee8a

Sfx_11b_Ch2: ; 3ee8a (0f:6e8a)
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
; 0x3eef2

Sfx_11b: ; 3eef2 (0f:6ef2)
	db 2, 0
	dw Sfx_11b_Ch1
	dw Sfx_11b_Ch2
; 0x3eef8

Sfx_11c_Ch1: ; 3eef8 (0f:6ef8)
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
; 0x3ef2d

Sfx_11c: ; 3ef2d (0f:6f2d)
	db 1, 0
	dw Sfx_11c_Ch1
; 0x3ef31

Sfx_11d_Ch1: ; 3ef31 (0f:6f31)
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
; 0x3ef94

Sfx_11d: ; 3ef94 (0f:6f94)
	db 1, 0
	dw Sfx_11d_Ch1
; 0x3ef98

Sfx_11e_Ch1: ; 3ef98 (0f:6f98)
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
; 0x3efb3

Sfx_11e_Ch2: ; 3efb3 (0f:6fb3)
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
; 0x3efcb

Sfx_11e: ; 3efcb (0f:6fcb)
	db 2, 0
	dw Sfx_11e_Ch1
	dw Sfx_11e_Ch2
; 0x3efd1

Sfx_11f_Ch1: ; 3efd1 (0f:6fd1)
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
; 0x3efee

Sfx_11f_Ch2: ; 3efee (0f:6fee)
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
; 0x3f009

Sfx_11f: ; 3f009 (0f:7009)
	db 2, 0
	dw Sfx_11f_Ch1
	dw Sfx_11f_Ch2
; 0x3f00f

Sfx_120_Ch1: ; 3f00f (0f:700f)
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
; 0x3f02a

Sfx_120_Ch2: ; 3f02a (0f:702a)
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
; 0x3f042

Sfx_120: ; 3f042 (0f:7042)
	db 2, 0
	dw Sfx_120_Ch1
	dw Sfx_120_Ch2
; 0x3f048

Sfx_121_Ch1: ; 3f048 (0f:7048)
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
; 0x3f063

Sfx_121_Ch2: ; 3f063 (0f:7063)
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
; 0x3f07f

Sfx_121: ; 3f07f (0f:707f)
	db 2, 0
	dw Sfx_121_Ch1
	dw Sfx_121_Ch2
; 0x3f085

Sfx_122_Ch1: ; 3f085 (0f:7085)
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
; 0x3f0a4

Sfx_122: ; 3f0a4 (0f:70a4)
	db 1, 0
	dw Sfx_122_Ch1
; 0x3f0a8

Sfx_123_Ch1: ; 3f0a8 (0f:70a8)
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
; 0x3f0cd

Sfx_123: ; 3f0cd (0f:70cd)
	db 1, 0
	dw Sfx_123_Ch1
; 0x3f0d1

Sfx_124_Ch1: ; 3f0d1 (0f:70d1)
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
; 0x3f0fe

Sfx_124: ; 3f0fe (0f:70fe)
	db 1, 0
	dw Sfx_124_Ch1
; 0x3f102

Sfx_125_Ch1: ; 3f102 (0f:7102)
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 94
	note NOTE_DURATION_14, F_1, 24
	audio_wait_14
	audio_end
; 0x3f10f

Sfx_125: ; 3f10f (0f:710f)
	db 1, 0
	dw Sfx_125_Ch1
; 0x3f113

Sfx_126_Ch1: ; 3f113 (0f:7113)
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 75
	note NOTE_DURATION_14, F_1, 19
	audio_wait_14
	audio_end
; 0x3f120

Sfx_126: ; 3f120 (0f:7120)
	db 1, 0
	dw Sfx_126_Ch1
; 0x3f124

Sfx_127_Ch1: ; 3f124 (0f:7124)
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
; 0x3f13e

Sfx_127_Ch2: ; 3f13e (0f:713e)
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
; 0x3f154

Sfx_127: ; 3f154 (0f:7154)
	db 2, 0
	dw Sfx_127_Ch1
	dw Sfx_127_Ch2
; 0x3f15a

Sfx_128_Ch1: ; 3f15a (0f:715a)
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
; 0x3f1a7

Sfx_128: ; 3f1a7 (0f:71a7)
	db 1, 0
	dw Sfx_128_Ch1
; 0x3f1ab

Sfx_129_Ch1: ; 3f1ab (0f:71ab)
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
; 0x3f1c0

Sfx_129: ; 3f1c0 (0f:71c0)
	db 1, 0
	dw Sfx_129_Ch1
; 0x3f1c4

Sfx_12a_Ch1: ; 3f1c4 (0f:71c4)
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
; 0x3f1d9

Sfx_12a: ; 3f1d9 (0f:71d9)
	db 1, 0
	dw Sfx_12a_Ch1
; 0x3f1dd

Sfx_12b_Ch1: ; 3f1dd (0f:71dd)
	semitone_offset 0
	tempo 74
	wave WAVE_60
	volume 94
	note NOTE_DURATION_3, C_4, 24
	audio_wait_4
	audio_end
; 0x3f1ea

Sfx_12b: ; 3f1ea (0f:71ea)
	db 1, 0
	dw Sfx_12b_Ch1
; 0x3f1ee

Sfx_12c_Ch1: ; 3f1ee (0f:71ee)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_1, C_3, 31
	audio_wait_3
	note G_3
	audio_wait_3
	audio_end
; 0x3f1fd

Sfx_12c_Ch2: ; 3f1fd (0f:71fd)
	semitone_offset 0
	wave WAVE_1A
	volume 120
	note NOTE_DURATION_1, F#2, 31
	audio_wait_3
	note C#3
	audio_wait_3
	audio_end
; 0x3f20a

Sfx_12c: ; 3f20a (0f:720a)
	db 2, 0
	dw Sfx_12c_Ch1
	dw Sfx_12c_Ch2
; 0x3f210

Sfx_12d_Ch1: ; 3f210 (0f:7210)
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
; 0x3f229

Sfx_12d: ; 3f229 (0f:7229)
	db 1, 2
	dw Sfx_12d_Ch1
; 0x3f22d

Sfx_12e_Ch1: ; 3f22d (0f:722d)
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
; 0x3f258

Sfx_12e_Ch2: ; 3f258 (0f:7258)
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
; 0x3f276

Sfx_12e_Ch3: ; 3f276 (0f:7276)
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
; 0x3f294

Sfx_12e_Ch4: ; 3f294 (0f:7294)
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
; 0x3f2a5

Sfx_12e: ; 3f2a5 (0f:72a5)
	db 4, 0
	dw Sfx_12e_Ch1
	dw Sfx_12e_Ch2
	dw Sfx_12e_Ch3
	dw Sfx_12e_Ch4
; 0x3f2af

Sfx_12f_Ch1: ; 3f2af (0f:72af)
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
; 0x3f2c9

Sfx_12f: ; 3f2c9 (0f:72c9)
	db 1, 2
	dw Sfx_12f_Ch1
; 0x3f2cd

Sfx_130_Ch1: ; 3f2cd (0f:72cd)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 56
	note NOTE_DURATION_1, D_3, 9
	audio_wait_1
	note NOTE_DURATION_1, D_3, 14
	audio_wait_5
	audio_end
; 0x3f2de

Sfx_130: ; 3f2de (0f:72de)
	db 1, 0
	dw Sfx_130_Ch1
; 0x3f2e2

Sfx_131_Ch1: ; 3f2e2 (0f:72e2)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_4, E_1, 31
	audio_wait_4
	note NOTE_DURATION_4, F_1, 24
	audio_wait_4
	audio_end
; 0x3f2f3

Sfx_131: ; 3f2f3 (0f:72f3)
	db 1, 0
	dw Sfx_131_Ch1
; 0x3f2f7

Sfx_132_Ch1: ; 3f2f7 (0f:72f7)
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
; 0x3f308

Sfx_132: ; 3f308 (0f:7308)
	db 1, 0
	dw Sfx_132_Ch1
; 0x3f30c

Sfx_133_Ch1: ; 3f30c (0f:730c)
	semitone_offset 0
	tempo 74
	wave WAVE_64
	volume 120
	note NOTE_DURATION_1, B_4, 31
	audio_wait_6
	note F#3
	audio_wait_6
	audio_end
; 0x3f31b

Sfx_133: ; 3f31b (0f:731b)
	db 1, 0
	dw Sfx_133_Ch1
; 0x3f31f

Sfx_134_Ch1: ; 3f31f (0f:731f)
	semitone_offset 0
	tempo 74
	wave WAVE_39
	volume 75
	note NOTE_DURATION_80, D_2, 19
	audio_wait_80
	audio_end
; 0x3f32c

Sfx_134: ; 3f32c (0f:732c)
	db 1, 0
	dw Sfx_134_Ch1
; 0x3f330

Sfx_135_Ch1: ; 3f330 (0f:7330)
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
; 0x3f34d

Sfx_135: ; 3f34d (0f:734d)
	db 1, 0
	dw Sfx_135_Ch1
; 0x3f351

Sfx_136_Ch1: ; 3f351 (0f:7351)
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
; 0x3f362

Sfx_136: ; 3f362 (0f:7362)
	db 1, 0
	dw Sfx_136_Ch1
; 0x3f366

Sfx_137_Ch1: ; 3f366 (0f:7366)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_1, D_2, 24
	audio_wait_4
	note A_1
	audio_wait_4
	audio_end
; 0x3f375

Sfx_137: ; 3f375 (0f:7375)
	db 1, 0
	dw Sfx_137_Ch1
; 0x3f379

Sfx_138_Ch1: ; 3f379 (0f:7379)
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
; 0x3f38e

Sfx_138: ; 3f38e (0f:738e)
	db 1, 0
	dw Sfx_138_Ch1
; 0x3f392
