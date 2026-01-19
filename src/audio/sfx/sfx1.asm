Sfx_Jump_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_32
	volume 120
	note NOTE_DURATION_12, E_0, 31
	audio_wait 12
	audio_end

Sfx_Jump:
	db 1, 0
	dw Sfx_Jump_Ch1

Sfx_GroundShake_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 46
	volume 120
	pitch_offset 0
	note NOTE_DURATION_12, C_2, 31
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 43
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 39
	pitch_offset -8
	audio_wait 1
	vibrato_amplitude 32
	pitch_offset -40
	audio_wait 1
	note D#0
	audio_wait 1
	vibrato_amplitude 24
	pitch_offset -74
	audio_wait 1
	vibrato_amplitude 11
	pitch_offset -84
	audio_wait 1
	vibrato_amplitude 7
	pitch_offset -86
	audio_wait 1
	vibrato_amplitude 6
	pitch_offset -88
	audio_wait 1
	note 19
	audio_wait 1
	vibrato_amplitude 4
	audio_wait 1
	note 7
	pitch_offset 0
	note NOTE_DURATION_12, 19
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 21
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 33
	pitch_offset -8
	audio_wait 1
	vibrato_amplitude 41
	pitch_offset -40
	audio_wait 1
	vibrato_amplitude 49
	pitch_offset -50
	audio_wait 1
	vibrato_amplitude 51
	pitch_offset -74
	audio_wait 1
	vibrato_amplitude 54
	pitch_offset -84
	audio_wait 1
	vibrato_amplitude 53
	pitch_offset -86
	audio_wait 1
	note 20
	audio_wait 1
	vibrato_amplitude 43
	pitch_offset -90
	audio_wait 1
	vibrato_amplitude 37
	audio_wait 1
	pitch_offset 0
	note NOTE_DURATION_12, 12
	audio_wait 1
	vibrato_amplitude 25
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 22
	pitch_offset 8
	audio_wait 1
	note C_2
	audio_wait 1
	note G#0
	audio_wait 1
	vibrato_amplitude 26
	pitch_offset -50
	audio_wait 1
	vibrato_amplitude 34
	pitch_offset -74
	audio_wait 1
	vibrato_amplitude 46
	pitch_offset -84
	audio_wait 1
	note 21
	audio_wait 1
	vibrato_amplitude 77
	pitch_offset -88
	audio_wait 1
	vibrato_amplitude 81
	pitch_offset -90
	audio_wait 2
	note E_2, NOTE_DURATION_12, 7
	audio_wait 1
	vibrato_amplitude 77
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 68
	pitch_offset 8
	audio_wait 1
	note C_2
	audio_wait 1
	vibrato_amplitude 55
	pitch_offset -40
	audio_wait 1
	vibrato_amplitude 28
	pitch_offset -50
	audio_wait 1
	note 27
	audio_wait 1
	vibrato_amplitude 18
	pitch_offset -84
	audio_wait 1
	vibrato_amplitude 12
	pitch_offset -86
	audio_wait 1
	note 20
	audio_wait 1
	vibrato_amplitude 15
	pitch_offset -90
	audio_wait 2
	audio_end

Sfx_GroundShake:
	db 1, 0
	dw Sfx_GroundShake_Ch1

Sfx_Bump_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 120
	note NOTE_DURATION_8, G_0, 31
	audio_wait 8
	audio_end

Sfx_Bump:
	db 1, 0
	dw Sfx_Bump_Ch1

Sfx_Walk_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_1, D_2, 24
	audio_wait 4
	note A_1
	audio_wait 14
	note NOTE_DURATION_1, D_2, 14
	audio_wait 4
	note A_1
	audio_wait 14
	audio_end

Sfx_Walk:
	db 1, 0
	dw Sfx_Walk_Ch1

Sfx_BlockBreak_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_1, C_1, 31
	audio_wait 2
	note G_1
	audio_wait 2
	note C_2
	audio_wait 2
	note G_2
	audio_wait 3
	note D_2
	audio_wait 3
	note A_1
	audio_wait 3
	note D_1
	audio_wait 2
	volume 66
	note NOTE_DURATION_1, G_2, 17
	audio_wait 3
	note D_2
	audio_wait 3
	note A_1
	audio_wait 3
	note D_1
	audio_wait 1
	audio_end

Sfx_BlockBreak:
	db 1, 0
	dw Sfx_BlockBreak_Ch1

Sfx_006_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_2, B_0, 31
	audio_wait 3
	note F#1
	audio_wait 3
	note B_1
	audio_wait 3
	note F#2
	audio_wait 4
	note C#2
	audio_wait 4
	note G#1
	audio_wait 4
	note C#1
	audio_wait 3
	volume 66
	note NOTE_DURATION_2, F#2, 14
	audio_wait 4
	note C#2
	audio_wait 4
	note G#1
	audio_wait 4
	note C#1
	audio_wait 2
	note F#2, 7
	audio_wait 4
	note C#2
	audio_wait 4
	note G#1
	audio_wait 4
	note C#1
	audio_wait 2
	note F#2, 2
	audio_wait 4
	note C#2
	audio_wait 4
	note G#1
	audio_wait 4
	note C#1
	audio_wait 2
	audio_end

Sfx_006:
	db 1, 0
	dw Sfx_006_Ch1

Sfx_Attack_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_69
	volume 66
	note NOTE_DURATION_1, D_2, 13
	audio_wait 2
	note G_3, 18
	audio_wait 2
	note D_3, 31
	audio_wait 2
	audio_end

Sfx_Attack:
	db 1, 0
	dw Sfx_Attack_Ch1

Sfx_AttackPoweredUp_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_35
	volume 120
	note NOTE_DURATION_6, C_3, 24
	audio_wait 6
	audio_end

Sfx_AttackPoweredUp_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_69
	volume 85
	note NOTE_DURATION_1, D_2, 13
	audio_wait 2
	note G_3, 18
	audio_wait 2
	note D_3, 31
	audio_wait 2
	audio_end

Sfx_AttackPoweredUp:
	db 2, 0
	dw Sfx_AttackPoweredUp_Ch1
	dw Sfx_AttackPoweredUp_Ch2

Sfx_RegularCoin_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_2, C#4, 27
	audio_wait 2
	note G_4, 19
	audio_wait 2
	note C#5, 27
	audio_wait 2
	note C#4, 19
	audio_wait 2
	note G_5
	audio_wait 2
	note NOTE_DURATION_2, G_4, 14
	audio_wait 2
	note G_5
	audio_wait 2
	note NOTE_DURATION_2, C#5, 19
	audio_wait 2
	note G_5, 14
	audio_wait 2
	note NOTE_DURATION_2
	audio_wait 2
	audio_end

Sfx_RegularCoin:
	db 1, 0
	dw Sfx_RegularCoin_Ch1

Sfx_Roll_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_32
	volume 120
	note NOTE_DURATION_1, C_1, 22
	audio_wait 2
	note D_1, 22
	audio_wait 2
	note E_1, 22
	audio_wait 2
	note F#1, 31
	audio_wait 2
	note F#1, 22
	audio_wait 2
	note F#1, 17
	audio_wait 2
	audio_end

Sfx_Roll:
	db 1, 0
	dw Sfx_Roll_Ch1

Sfx_ZipLineSlide_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_12, D_2, 20
	audio_wait 12
	audio_end

Sfx_ZipLineSlide:
	db 1, 2
	dw Sfx_ZipLineSlide_Ch1

	dw $7a4a ; useless

Sfx_Slide_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_41
	volume 120
	note NOTE_DURATION_24, G_1, 31
	audio_wait 24
	audio_end

Sfx_Slide:
	db 1, 0
	dw Sfx_Slide_Ch1

Sfx_Splash_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 75
	pitch_offset -50
	note NOTE_DURATION_13, C#3, 19
	audio_wait 2
	pitch_offset -88
	audio_wait 2
	note 0
	audio_wait 7
	note A#0
	audio_wait 2
	note C#6
	audio_wait 2
	note G_7
	audio_wait 22
	note E_2
	audio_end

Sfx_Splash_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 66
	note NOTE_DURATION_5, D_3, 31
	audio_wait 5
	wave WAVE_65
	note NOTE_DURATION_5, D_3, 24
	audio_wait 5
	note 22
	audio_wait 5
	note 17
	audio_wait 5
	note 12
	audio_wait 5
	note 7
	audio_wait 5
	note 4
	audio_wait 5
	note 2
	audio_wait 5
	audio_end

Sfx_Splash:
	db 2, 0
	dw Sfx_Splash_Ch1
	dw Sfx_Splash_Ch2

Sfx_00e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 94
	pitch_offset -50
	note NOTE_DURATION_13, C#2, 24
	audio_wait 2
	pitch_offset -88
	audio_wait 2
	note 0
	audio_wait 7
	note A#0
	audio_wait 2
	note C#6
	audio_wait 2
	note G_7
	audio_wait 22
	note E_2
	audio_end

Sfx_00e:
	db 1, 0
	dw Sfx_00e_Ch1

Sfx_00f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_32
	volume 66
	note NOTE_DURATION_4, B_1, 24
	audio_wait 5
	note NOTE_DURATION_4
	audio_wait 5
	note NOTE_DURATION_4, C_2
	audio_wait 5
	audio_end

Sfx_00f:
	db 1, 0
	dw Sfx_00f_Ch1

Sfx_Land_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_1, D_2, 31
	audio_wait 3
	note 14
	audio_wait 3
	note 14
	audio_wait 3
	audio_end

Sfx_Land:
	db 1, 0
	dw Sfx_Land_Ch1

Sfx_011_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_1, B_4, 24
	audio_wait 6
	note F#3
	audio_wait 14
	audio_end

Sfx_011:
	db 1, 0
	dw Sfx_011_Ch1

Sfx_Recovery_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 113
	note NOTE_DURATION_2, C_2, 21
	audio_wait 3
	note F#2
	audio_wait 3
	note G_2
	audio_wait 3
	note D_3
	audio_wait 3
	note C_3
	audio_wait 3
	note F#3
	audio_wait 3
	note G_3
	audio_wait 3
	note D_4
	audio_wait 3
	note C_4
	audio_wait 3
	note G_4
	audio_wait 3
	note NOTE_DURATION_2, G_3, 9
	audio_wait 3
	note G_4
	audio_wait 3
	note C_4
	audio_wait 3
	note G_4
	audio_wait 3
	note NOTE_DURATION_2, G_3, 2
	audio_wait 3
	note G_4
	audio_wait 2
	audio_end

Sfx_Recovery:
	db 1, 0
	dw Sfx_Recovery_Ch1

Sfx_Sting_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_63
	vibrato_amplitude 100
	volume 108
	pitch_offset 0
	note NOTE_DURATION_24, C_2, 27
	audio_wait 3
	pitch_offset 4
	audio_wait 1
	note F#2
	audio_wait 2
	note C_2
	audio_wait 1
	note G#1
	audio_wait 1
	note G#0
	audio_wait 1
	note D_0
	audio_wait 1
	note 34
	audio_wait 1
	note 31
	audio_wait 1
	note 30
	audio_wait 2
	note 31
	audio_wait 1
	note 34
	audio_wait 1
	note F_0
	audio_wait 1
	note A_0
	audio_wait 1
	note C#1
	audio_wait 1
	note E_1
	audio_wait 1
	note G_1
	audio_wait 1
	note G#1
	audio_wait 3
	audio_end

Sfx_Sting:
	db 1, 0
	dw Sfx_Sting_Ch1

Sfx_014_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_2, C#2, 26
	audio_wait 6
	note B_2
	audio_wait 2
	audio_end

Sfx_014:
	db 1, 0
	dw Sfx_014_Ch1

Sfx_Grab_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 120
	note NOTE_DURATION_7, C_1, 26
	audio_wait 7
	audio_end

Sfx_Grab:
	db 1, 0
	dw Sfx_Grab_Ch1

Sfx_016_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_7, C_4, 27
	audio_wait 7
	audio_end

Sfx_016:
	db 1, 0
	dw Sfx_016_Ch1

Sfx_017_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_45
	volume 120
	note NOTE_DURATION_6, G_3, 31
	audio_wait 6
	note NOTE_DURATION_2, G_3, 9
	audio_wait 2
	audio_end

Sfx_017_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	note NOTE_DURATION_3, F#3, 31
	audio_wait 3
	note NOTE_DURATION_3, F#3, 12
	audio_wait 3
	note NOTE_DURATION_2, A#3, 4
	audio_wait 2
	audio_end

Sfx_017:
	db 2, 0
	dw Sfx_017_Ch1
	dw Sfx_017_Ch2

Sfx_018_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 113
	note NOTE_DURATION_1, C_1, 25
	audio_wait 1
	note D_1, 23
	audio_wait 2
	note E_1, 24
	audio_wait 1
	note F_1, 25
	audio_wait 2
	note G_1, 24
	audio_wait 1
	note A_1, 23
	audio_wait 2
	note B_1, 24
	audio_wait 1
	note C_2, 25
	audio_wait 2
	note D_2
	audio_wait 1
	note NOTE_DURATION_1, E_2, 23
	audio_wait 2
	audio_end

Sfx_018:
	db 1, 0
	dw Sfx_018_Ch1

Sfx_019_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_37
	volume 75
	note NOTE_DURATION_18, A_2, 19
	audio_wait 18
	audio_end

Sfx_019:
	db 1, 0
	dw Sfx_019_Ch1

Sfx_01a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 94
	note NOTE_DURATION_2, C_3, 24
	audio_wait 6
	note B_3
	audio_wait 6
	audio_end

Sfx_01a:
	db 1, 0
	dw Sfx_01a_Ch1

Sfx_01b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_63
	vibrato_amplitude 100
	volume 103
	pitch_offset 0
	note NOTE_DURATION_20, C_2, 24
	audio_wait 3
	pitch_offset 4
	audio_wait 1
	note F#2
	audio_wait 2
	note C_2
	audio_wait 1
	note G#1
	audio_wait 1
	note G#0
	audio_wait 1
	note D_0
	audio_wait 1
	note 34
	audio_wait 1
	note 31
	audio_wait 1
	note 30
	audio_wait 2
	note 31
	audio_wait 1
	note 34
	audio_wait 1
	note F_0
	audio_wait 1
	note A_0
	audio_wait 1
	note C#1
	audio_wait 1
	note E_1
	audio_wait 1
	audio_end

Sfx_01b_Ch2:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 100
	volume 103
	pitch_offset 0
	note NOTE_DURATION_20, C_2, 24
	audio_wait 3
	pitch_offset 4
	audio_wait 1
	note F#2
	audio_wait 2
	note C_2
	audio_wait 1
	note G#1
	audio_wait 1
	note G#0
	audio_wait 1
	note D_0
	audio_wait 1
	note 34
	audio_wait 1
	note 31
	audio_wait 1
	note 30
	audio_wait 2
	note 31
	audio_wait 1
	note 34
	audio_wait 1
	note F_0
	audio_wait 1
	note A_0
	audio_wait 1
	note C#1
	audio_wait 1
	note E_1
	audio_wait 1
	audio_end

Sfx_01b:
	db 2, 0
	dw Sfx_01b_Ch1
	dw Sfx_01b_Ch2

Sfx_FlatWalk_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	pitch_offset 0
	note NOTE_DURATION_5, A_4, 13
	audio_wait 2
	pitch_offset -2
	audio_wait 2
	note C_1
	audio_wait 1
	pitch_offset 0
	note NOTE_DURATION_5, B_4, 13
	audio_wait 2
	pitch_offset -2
	audio_wait 2
	note C_1
	audio_wait 1
	audio_end

Sfx_FlatWalk:
	db 1, 0
	dw Sfx_FlatWalk_Ch1

Sfx_01d_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_44
	volume 75
	note NOTE_DURATION_10, B_2, 19
	audio_wait 20
	audio_end

Sfx_01d:
	db 1, 0
	dw Sfx_01d_Ch1

Sfx_01e_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 113
	note NOTE_DURATION_14, F_1, 31
	audio_wait 14
	audio_end

Sfx_01e:
	db 1, 0
	dw Sfx_01e_Ch1

Sfx_01f_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F_1, 31
	audio_wait 8
	note NOTE_DURATION_8, F_1, 24
	audio_wait 8
	audio_end

Sfx_01f:
	db 1, 0
	dw Sfx_01f_Ch1

Sfx_020_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 94
	note NOTE_DURATION_1, G#2, 24
	audio_wait 4
	note NOTE_DURATION_1, G#2, 19
	audio_wait 4
	note NOTE_DURATION_1, G#2, 14
	audio_wait 4
	note NOTE_DURATION_1, G#2, 9
	audio_wait 4
	note NOTE_DURATION_1, G#2, 4
	audio_wait 4
	audio_end

Sfx_020:
	db 1, 0
	dw Sfx_020_Ch1

Sfx_HangGrab_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	note NOTE_DURATION_2, F#3, 29
	audio_wait 3
	note NOTE_DURATION_2, G_3, 29
	audio_wait 3
	note NOTE_DURATION_1, A#3, 9
	audio_wait 2
	audio_end

Sfx_HangGrab:
	db 1, 0
	dw Sfx_HangGrab_Ch1

Sfx_022_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_3D
	volume 94
	audio_wait 56
	note NOTE_DURATION_15, C_3, 17
	audio_wait 15
	audio_end

Sfx_022:
	db 1, 0
	dw Sfx_022_Ch1

Sfx_023_Ch1:
	volume 75
	semitone_offset 0
	tempo 74
	wave WAVE_10
	pitch_offset 6
	note NOTE_DURATION_15, C_3, 19
	audio_wait 8
	pitch_offset 12
	audio_wait 1
	note D#3
	audio_wait 1
	note E_4
	audio_wait 1
	note B_4
	audio_wait 1
	note F_5
	audio_wait 2
	note A#6
	audio_wait 1
	note NOTE_DURATION_15, C_3, 7
	audio_wait 8
	pitch_offset 12
	audio_wait 1
	note D#3
	audio_wait 1
	note E_4
	audio_wait 1
	note B_4
	audio_wait 1
	note F_5
	audio_wait 2
	note A#6
	audio_wait 1
	audio_end

Sfx_023:
	db 1, 0
	dw Sfx_023_Ch1

Sfx_024_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	pitch_offset 8
	note NOTE_DURATION_10, G#0, 31
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	note G#2
	audio_wait 1
	note C_2
	audio_wait 1
	note G#0
	audio_wait 1
	note D#0
	audio_wait 1
	note 27
	audio_wait 1
	note 22
	audio_wait 1
	note 21
	audio_wait 1
	note 20
	audio_wait 1
	note E_2, NOTE_DURATION_10, 19
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	note G#2
	audio_wait 1
	note C_2
	audio_wait 1
	note G#0
	audio_wait 1
	note D#0
	audio_wait 1
	note 27
	audio_wait 1
	note 22
	audio_wait 1
	note 21
	audio_wait 1
	note 20
	audio_wait 1
	note E_2, NOTE_DURATION_10, 12
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	note G#2
	audio_wait 1
	note C_2
	audio_wait 1
	note G#0
	audio_wait 1
	note D#0
	audio_wait 1
	note 27
	audio_wait 1
	note 22
	audio_wait 1
	note 21
	audio_wait 1
	note 20
	audio_wait 1
	note E_2, NOTE_DURATION_10, 7
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	note G#2
	audio_wait 1
	note C_2
	audio_wait 1
	note G#0
	audio_wait 1
	note D#0
	audio_wait 1
	note 27
	audio_wait 1
	note 22
	audio_wait 1
	note 21
	audio_wait 1
	note 20
	audio_wait 1
	note E_2
	audio_end

Sfx_024:
	db 1, 0
	dw Sfx_024_Ch1

Sfx_025_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0D
	volume 75
	note NOTE_DURATION_1, C_5, 19
	audio_wait 2
	note E_5
	audio_wait 2
	note C#5
	audio_wait 6
	wave WAVE_37
	volume 103
	note NOTE_DURATION_42, C_1, 24
	audio_wait 42
	note E_2
	audio_end

Sfx_025:
	db 1, 0
	dw Sfx_025_Ch1

Sfx_PuffRaise_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 85
	pitch_offset_mult 8
	pitch_offset 0
	note NOTE_DURATION_9, C_3, 22
	audio_wait 3
	pitch_offset 2
	audio_wait 3
	note C_5
	audio_wait 2
	note C#7
	audio_wait 2
	note G_7
	audio_wait 6
	note E_2, NOTE_DURATION_9, 11
	audio_wait 3
	pitch_offset 2
	audio_wait 3
	note C_5
	audio_wait 2
	note C#7
	audio_wait 2
	note G_7
	audio_wait 6
	audio_end

Sfx_PuffRaise:
	db 1, 0
	dw Sfx_PuffRaise_Ch1

Sfx_027_Ch1:
	semitone_offset 0
	tempo 74
	volume 94
	wave WAVE_65
	note NOTE_DURATION_5, D_4, 29
	audio_wait 5
	wave WAVE_68
	note NOTE_DURATION_5, D_4, 29
	audio_wait 5
	wave WAVE_65
	note NOTE_DURATION_16, D_4, 29
	audio_wait 16
	note NOTE_DURATION_5, D_4, 27
	audio_wait 5
	note 24
	audio_wait 5
	note 23
	audio_wait 5
	note 21
	audio_wait 5
	note 17
	audio_wait 5
	wave WAVE_66
	note NOTE_DURATION_5, D_4, 17
	audio_wait 5
	audio_end

Sfx_027:
	db 1, 0
	dw Sfx_027_Ch1

Sfx_028_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	note NOTE_DURATION_1, C_5, 17
	audio_wait 10
	note B_4
	audio_wait 6
	note A#4
	audio_wait 6
	note A_4
	audio_wait 3
	note G#4
	audio_wait 3
	note G_4
	audio_wait 3
	note F#4
	audio_wait 3
	note F_4
	audio_wait 3
	audio_end

Sfx_028:
	db 1, 0
	dw Sfx_028_Ch1

Sfx_ZombieWalk_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 47
	note NOTE_DURATION_8, D_2, 14
	audio_wait 8
	wave WAVE_65
	note NOTE_DURATION_8, D_2, 17
	audio_wait 8
	note NOTE_DURATION_20, D_2, 19
	audio_wait 20
	audio_end

Sfx_ZombieWalk:
	db 1, 0
	dw Sfx_ZombieWalk_Ch1

Sfx_02a_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_1, C#2, 29
	audio_wait 1
	note 9
	audio_wait 1
	note 4
	audio_wait 1
	note C#3, 24
	audio_wait 1
	note 9
	audio_wait 1
	note 2
	audio_wait 1
	note F#3, 19
	audio_wait 1
	note 9
	audio_wait 1
	note 2
	audio_wait 1
	note G#2, 14
	audio_wait 1
	note 9
	audio_wait 1
	note 2
	audio_wait 1
	note C#3, 12
	audio_wait 1
	note 7
	audio_wait 1
	note 2
	audio_wait 1
	audio_end

Sfx_02a:
	db 1, 0
	dw Sfx_02a_Ch1

Sfx_02b_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 46
	volume 120
	pitch_offset 0
	note NOTE_DURATION_12, C_1, 24
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 43
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 39
	pitch_offset -8
	audio_wait 1
	vibrato_amplitude 32
	pitch_offset -40
	audio_wait 1
	note D#0
	audio_wait 1
	vibrato_amplitude 24
	pitch_offset -74
	audio_wait 1
	vibrato_amplitude 11
	pitch_offset -84
	audio_wait 1
	vibrato_amplitude 7
	pitch_offset -86
	audio_wait 1
	vibrato_amplitude 6
	pitch_offset -88
	audio_wait 1
	note 19
	audio_wait 1
	vibrato_amplitude 4
	audio_wait 1
	note 7
	pitch_offset 0
	note NOTE_DURATION_12, 19
	audio_wait 1
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 21
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 33
	pitch_offset -8
	audio_wait 1
	vibrato_amplitude 41
	pitch_offset -40
	audio_wait 1
	vibrato_amplitude 49
	pitch_offset -50
	audio_wait 1
	vibrato_amplitude 51
	pitch_offset -74
	audio_wait 1
	vibrato_amplitude 54
	pitch_offset -84
	audio_wait 1
	vibrato_amplitude 53
	pitch_offset -86
	audio_wait 1
	note 20
	audio_wait 1
	vibrato_amplitude 43
	pitch_offset -90
	audio_wait 1
	vibrato_amplitude 37
	audio_wait 1
	pitch_offset 0
	note NOTE_DURATION_12, 12
	audio_wait 1
	vibrato_amplitude 25
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 22
	pitch_offset 8
	audio_wait 1
	note C_2
	audio_wait 1
	note G#0
	audio_wait 1
	vibrato_amplitude 26
	pitch_offset -50
	audio_wait 1
	vibrato_amplitude 34
	pitch_offset -74
	audio_wait 1
	vibrato_amplitude 46
	pitch_offset -84
	audio_wait 1
	note 21
	audio_wait 1
	vibrato_amplitude 77
	pitch_offset -88
	audio_wait 1
	vibrato_amplitude 81
	pitch_offset -90
	audio_wait 2
	note E_2, NOTE_DURATION_12, 7
	audio_wait 1
	vibrato_amplitude 77
	pitch_offset 8
	audio_wait 1
	vibrato_amplitude 68
	pitch_offset 8
	audio_wait 1
	note C_2
	audio_wait 1
	vibrato_amplitude 55
	pitch_offset -40
	audio_wait 1
	vibrato_amplitude 28
	pitch_offset -50
	audio_wait 1
	note 27
	audio_wait 1
	vibrato_amplitude 18
	pitch_offset -84
	audio_wait 1
	vibrato_amplitude 12
	pitch_offset -86
	audio_wait 1
	note 20
	audio_wait 1
	vibrato_amplitude 15
	pitch_offset -90
	audio_wait 2
	vibrato_amplitude 37
	audio_wait 1
	note E_1
	audio_wait 1
	note G_2
	audio_wait 1
	note C#3
	audio_wait 1
	note D#3
	audio_wait 1
	note C#3
	audio_wait 1
	note G#2
	audio_wait 1
	note C#2
	audio_wait 1
	note F_1
	audio_wait 1
	note G#0
	audio_wait 1
	note C#0
	audio_wait 1
	note 32
	audio_wait 1
	note 31
	audio_wait 3
	note 34
	audio_wait 1
	note A#0
	audio_wait 1
	note C_2
	audio_wait 1
	note D#3
	audio_wait 1
	note B_3
	audio_wait 1
	note E_4
	audio_wait 1
	note F#4
	audio_wait 2
	note F_4
	audio_wait 1
	note B_3
	audio_wait 1
	note E_3
	audio_wait 1
	note G#2
	audio_wait 1
	note C#2
	audio_wait 2
	note F_1
	audio_wait 1
	note B_0
	audio_wait 1
	note F#0
	audio_wait 1
	note D_0
	audio_wait 1
	note C_0
	audio_wait 1
	note 33
	audio_wait 1
	note 32
	audio_wait 1
	note 31
	audio_end

Sfx_02b:
	db 1, 0
	dw Sfx_02b_Ch1

Sfx_02c_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_42
	volume 120
	note NOTE_DURATION_7, C_1, 26
	audio_wait 7
	audio_end

Sfx_02c:
	db 1, 0
	dw Sfx_02c_Ch1

Sfx_FullyChargedThrow_Ch1:
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 75
	note NOTE_DURATION_6, C_1, 19
	audio_wait 6
	note C#1
	audio_wait 6
	note F_1
	audio_wait 6
	note F#1
	audio_wait 6
	note C_2
	audio_wait 6
	audio_end

Sfx_FullyChargedThrow:
	db 1, 0
	dw Sfx_FullyChargedThrow_Ch1
