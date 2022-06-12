Sfx_Jump_Ch1: ; 3b84e (0e:784e)
	semitone_offset 0
	tempo 74
	wave WAVE_32
	volume 120
	note NOTE_DURATION_12, E_0, 31
	audio_wait_12
	audio_end
; 0x3b85b

Sfx_Jump: ; 3b85b (0e:785b)
	db 1, 0
	dw Sfx_Jump_Ch1
; 0x3b85f

Sfx_GroundShake_Ch1: ; 3b85f (0e:785f)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 46
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
	audio_end
; 0x3b92e

Sfx_GroundShake: ; 3b92e (0e:792e)
	db 1, 0
	dw Sfx_GroundShake_Ch1
; 0x3b932

Sfx_Bump_Ch1: ; 3b932 (0e:7932)
	semitone_offset 0
	tempo 74
	wave WAVE_33
	volume 120
	note NOTE_DURATION_8, G_0, 31
	audio_wait_8
	audio_end
; 0x3b93f

Sfx_Bump: ; 3b93f (0e:793f)
	db 1, 0
	dw Sfx_Bump_Ch1
; 0x3b943

Sfx_Walk_Ch1: ; 3b943 (0e:7943)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_1, D_2, 24
	audio_wait_4
	note A_1
	audio_wait_14
	note NOTE_DURATION_1, D_2, 14
	audio_wait_4
	note A_1
	audio_wait_14
	audio_end
; 0x3b958

Sfx_Walk: ; 3b958 (0e:7958)
	db 1, 0
	dw Sfx_Walk_Ch1
; 0x3b95c

Sfx_BlockBreak_Ch1: ; 3b95c (0e:795c)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_1, C_1, 31
	audio_wait_2
	note G_1
	audio_wait_2
	note C_2
	audio_wait_2
	note G_2
	audio_wait_3
	note D_2
	audio_wait_3
	note A_1
	audio_wait_3
	note D_1
	audio_wait_2
	volume 66
	note NOTE_DURATION_1, G_2, 17
	audio_wait_3
	note D_2
	audio_wait_3
	note A_1
	audio_wait_3
	note D_1
	audio_wait_1
	audio_end
; 0x3b981

Sfx_BlockBreak: ; 3b981 (0e:7981)
	db 1, 0
	dw Sfx_BlockBreak_Ch1
; 0x3b985

Sfx_006_Ch1: ; 3b985 (0e:7985)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_2, B_0, 31
	audio_wait_3
	note F#1
	audio_wait_3
	note B_1
	audio_wait_3
	note F#2
	audio_wait_4
	note C#2
	audio_wait_4
	note G#1
	audio_wait_4
	note C#1
	audio_wait_3
	volume 66
	note NOTE_DURATION_2, F#2, 14
	audio_wait_4
	note C#2
	audio_wait_4
	note G#1
	audio_wait_4
	note C#1
	audio_wait_2
	note F#2, 7
	audio_wait_4
	note C#2
	audio_wait_4
	note G#1
	audio_wait_4
	note C#1
	audio_wait_2
	note F#2, 2
	audio_wait_4
	note C#2
	audio_wait_4
	note G#1
	audio_wait_4
	note C#1
	audio_wait_2
	audio_end
; 0x3b9bc

Sfx_006: ; 3b9bc (0e:79bc)
	db 1, 0
	dw Sfx_006_Ch1
; 0x3b9c0

Sfx_Attack_Ch1: ; 3b9c0 (0e:79c0)
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
	audio_end
; 0x3b9d3

Sfx_Attack: ; 3b9d3 (0e:79d3)
	db 1, 0
	dw Sfx_Attack_Ch1
; 0x3b9d7

Sfx_AttackPoweredUp_Ch1: ; 3b9d7 (0e:79d7)
	semitone_offset 0
	tempo 74
	wave WAVE_35
	volume 120
	note NOTE_DURATION_6, C_3, 24
	audio_wait_6
	audio_end
; 0x3b9e4

Sfx_AttackPoweredUp_Ch2: ; 3b9e4 (0e:79e4)
	semitone_offset 0
	tempo 74
	wave WAVE_69
	volume 85
	note NOTE_DURATION_1, D_2, 13
	audio_wait_2
	note G_3, 18
	audio_wait_2
	note D_3, 31
	audio_wait_2
	audio_end
; 0x3b9f7

Sfx_AttackPoweredUp: ; 3b9f7 (0e:79f7)
	db 2, 0
	dw Sfx_AttackPoweredUp_Ch1
	dw Sfx_AttackPoweredUp_Ch2
; 0x3b9fd

Sfx_RegularCoin_Ch1: ; 3b9fd (0e:79fd)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
	note NOTE_DURATION_2, C#4, 27
	audio_wait_2
	note G_4, 19
	audio_wait_2
	note C#5, 27
	audio_wait_2
	note C#4, 19
	audio_wait_2
	note G_5
	audio_wait_2
	note NOTE_DURATION_2, G_4, 14
	audio_wait_2
	note G_5
	audio_wait_2
	note NOTE_DURATION_2, C#5, 19
	audio_wait_2
	note G_5, 14
	audio_wait_2
	note NOTE_DURATION_2
	audio_wait_2
	audio_end
; 0x3ba24

Sfx_RegularCoin: ; 3ba24 (0e:7a24)
	db 1, 0
	dw Sfx_RegularCoin_Ch1
; 0x3ba28

Sfx_Roll_Ch1: ; 3ba28 (0e:7a28)
	semitone_offset 0
	tempo 74
	wave WAVE_32
	volume 120
	note NOTE_DURATION_1, C_1, 22
	audio_wait_2
	note D_1, 22
	audio_wait_2
	note E_1, 22
	audio_wait_2
	note F#1, 31
	audio_wait_2
	note F#1, 22
	audio_wait_2
	note F#1, 17
	audio_wait_2
	audio_end
; 0x3ba44

Sfx_Roll: ; 3ba44 (0e:7a44)
	db 1, 0
	dw Sfx_Roll_Ch1
; 0x3ba48

Sfx_ZipLineSlide_Ch1: ; 3ba48 (0e:7a48)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 94
	note NOTE_DURATION_12, D_2, 20
	audio_wait_12
	audio_end
; 0x3ba55

Sfx_ZipLineSlide: ; 3ba55 (0e:7a55)
	db 1, 2
	dw Sfx_ZipLineSlide_Ch1
; 0x3ba59

	dw $7a4a ; useless

Sfx_Slide_Ch1: ; 3ba5b (0e:7a5b)
	semitone_offset 0
	tempo 74
	wave WAVE_41
	volume 120
	note NOTE_DURATION_24, G_1, 31
	audio_wait_24
	audio_end
; 0x3ba68

Sfx_Slide: ; 3ba68 (0e:7a68)
	db 1, 0
	dw Sfx_Slide_Ch1
; 0x3ba6c

Sfx_Splash_Ch1: ; 3ba6c (0e:7a6c)
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 75
	pitch_offset -50
	note NOTE_DURATION_13, C#3, 19
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
; 0x3ba87

Sfx_Splash_Ch2: ; 3ba87 (0e:7a87)
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 66
	note NOTE_DURATION_5, D_3, 31
	audio_wait_5
	wave WAVE_65
	note NOTE_DURATION_5, D_3, 24
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
; 0x3baa6

Sfx_Splash: ; 3baa6 (0e:7aa6)
	db 2, 0
	dw Sfx_Splash_Ch1
	dw Sfx_Splash_Ch2
; 0x3baac

Sfx_00e_Ch1: ; 3baac (0e:7aac)
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 94
	pitch_offset -50
	note NOTE_DURATION_13, C#2, 24
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
; 0x3bac7

Sfx_00e: ; 3bac7 (0e:7ac7)
	db 1, 0
	dw Sfx_00e_Ch1
; 0x3bacb

Sfx_00f_Ch1: ; 3bacb (0e:7acb)
	semitone_offset 0
	tempo 74
	wave WAVE_32
	volume 66
	note NOTE_DURATION_4, B_1, 24
	audio_wait_5
	note NOTE_DURATION_4
	audio_wait_5
	note NOTE_DURATION_4, C_2
	audio_wait_5
	audio_end
; 0x3badd

Sfx_00f: ; 3badd (0e:7add)
	db 1, 0
	dw Sfx_00f_Ch1
; 0x3bae1

Sfx_Land_Ch1: ; 3bae1 (0e:7ae1)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 120
	note NOTE_DURATION_1, D_2, 31
	audio_wait_3
	note 14
	audio_wait_3
	note 14
	audio_wait_3
	audio_end
; 0x3baf2

Sfx_Land: ; 3baf2 (0e:7af2)
	db 1, 0
	dw Sfx_Land_Ch1
; 0x3baf6

Sfx_011_Ch1: ; 3baf6 (0e:7af6)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 94
	note NOTE_DURATION_1, B_4, 24
	audio_wait_6
	note F#3
	audio_wait_14
	audio_end
; 0x3bb05

Sfx_011: ; 3bb05 (0e:7b05)
	db 1, 0
	dw Sfx_011_Ch1
; 0x3bb09

Sfx_Recovery_Ch1: ; 3bb09 (0e:7b09)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 113
	note NOTE_DURATION_2, C_2, 21
	audio_wait_3
	note F#2
	audio_wait_3
	note G_2
	audio_wait_3
	note D_3
	audio_wait_3
	note C_3
	audio_wait_3
	note F#3
	audio_wait_3
	note G_3
	audio_wait_3
	note D_4
	audio_wait_3
	note C_4
	audio_wait_3
	note G_4
	audio_wait_3
	note NOTE_DURATION_2, G_3, 9
	audio_wait_3
	note G_4
	audio_wait_3
	note C_4
	audio_wait_3
	note G_4
	audio_wait_3
	note NOTE_DURATION_2, G_3, 2
	audio_wait_3
	note G_4
	audio_wait_2
	audio_end
; 0x3bb38

Sfx_Recovery: ; 3bb38 (0e:7b38)
	db 1, 0
	dw Sfx_Recovery_Ch1
; 0x3bb3c

Sfx_Sting_Ch1: ; 3bb3c (0e:7b3c)
	semitone_offset 0
	tempo 74
	wave WAVE_63
	vibrato_amplitude 100
	volume 108
	pitch_offset 0
	note NOTE_DURATION_24, C_2, 27
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
	audio_end
; 0x3bb70

Sfx_Sting: ; 3bb70 (0e:7b70)
	db 1, 0
	dw Sfx_Sting_Ch1
; 0x3bb74

Sfx_014_Ch1: ; 3bb74 (0e:7b74)
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_2, C#2, 26
	audio_wait_6
	note B_2
	audio_wait_2
	audio_end
; 0x3bb83

Sfx_014: ; 3bb83 (0e:7b83)
	db 1, 0
	dw Sfx_014_Ch1
; 0x3bb87

Sfx_Grab_Ch1: ; 3bb87 (0e:7b87)
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 120
	note NOTE_DURATION_7, C_1, 26
	audio_wait_7
	audio_end
; 0x3bb94

Sfx_Grab: ; 3bb94 (0e:7b94)
	db 1, 0
	dw Sfx_Grab_Ch1
; 0x3bb98

Sfx_016_Ch1: ; 3bb98 (0e:7b98)
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 120
	note NOTE_DURATION_7, C_4, 27
	audio_wait_7
	audio_end
; 0x3bba5

Sfx_016: ; 3bba5 (0e:7ba5)
	db 1, 0
	dw Sfx_016_Ch1
; 0x3bba9

Sfx_017_Ch1: ; 3bba9 (0e:7ba9)
	semitone_offset 0
	tempo 74
	wave WAVE_45
	volume 120
	note NOTE_DURATION_6, G_3, 31
	audio_wait_6
	note NOTE_DURATION_2, G_3, 9
	audio_wait_2
	audio_end
; 0x3bbba

Sfx_017_Ch2: ; 3bbba (0e:7bba)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	note NOTE_DURATION_3, F#3, 31
	audio_wait_3
	note NOTE_DURATION_3, F#3, 12
	audio_wait_3
	note NOTE_DURATION_2, A#3, 4
	audio_wait_2
	audio_end
; 0x3bbcf

Sfx_017: ; 3bbcf (0e:7bcf)
	db 2, 0
	dw Sfx_017_Ch1
	dw Sfx_017_Ch2
; 0x3bbd5

Sfx_018_Ch1: ; 3bbd5 (0e:7bd5)
	semitone_offset 0
	tempo 74
	wave WAVE_6A
	volume 113
	note NOTE_DURATION_1, C_1, 25
	audio_wait_1
	note D_1, 23
	audio_wait_2
	note E_1, 24
	audio_wait_1
	note F_1, 25
	audio_wait_2
	note G_1, 24
	audio_wait_1
	note A_1, 23
	audio_wait_2
	note B_1, 24
	audio_wait_1
	note C_2, 25
	audio_wait_2
	note D_2
	audio_wait_1
	note NOTE_DURATION_1, E_2, 23
	audio_wait_2
	audio_end
; 0x3bbfd

Sfx_018: ; 3bbfd (0e:7bfd)
	db 1, 0
	dw Sfx_018_Ch1
; 0x3bc01

Sfx_019_Ch1: ; 3bc01 (0e:7c01)
	semitone_offset 0
	tempo 74
	wave WAVE_37
	volume 75
	note NOTE_DURATION_18, A_2, 19
	audio_wait_18
	audio_end
; 0x3bc0e

Sfx_019: ; 3bc0e (0e:7c0e)
	db 1, 0
	dw Sfx_019_Ch1
; 0x3bc12

Sfx_01a_Ch1: ; 3bc12 (0e:7c12)
	semitone_offset 0
	tempo 74
	wave WAVE_34
	volume 94
	note NOTE_DURATION_2, C_3, 24
	audio_wait_6
	note B_3
	audio_wait_6
	audio_end
; 0x3bc21

Sfx_01a: ; 3bc21 (0e:7c21)
	db 1, 0
	dw Sfx_01a_Ch1
; 0x3bc25

Sfx_01b_Ch1: ; 3bc25 (0e:7c25)
	semitone_offset 0
	tempo 74
	wave WAVE_63
	vibrato_amplitude 100
	volume 103
	pitch_offset 0
	note NOTE_DURATION_20, C_2, 24
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
	audio_end
; 0x3bc55

Sfx_01b_Ch2: ; 3bc55 (0e:7c55)
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 100
	volume 103
	pitch_offset 0
	note NOTE_DURATION_20, C_2, 24
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
	audio_end
; 0x3bc85

Sfx_01b: ; 3bc85 (0e:7c85)
	db 2, 0
	dw Sfx_01b_Ch1
	dw Sfx_01b_Ch2
; 0x3bc8b

Sfx_FlatWalk_Ch1: ; 3bc8b (0e:7c8b)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	pitch_offset 0
	note NOTE_DURATION_5, A_4, 13
	audio_wait_2
	pitch_offset -2
	audio_wait_2
	note C_1
	audio_wait_1
	pitch_offset 0
	note NOTE_DURATION_5, B_4, 13
	audio_wait_2
	pitch_offset -2
	audio_wait_2
	note C_1
	audio_wait_1
	audio_end
; 0x3bcaa

Sfx_FlatWalk: ; 3bcaa (0e:7caa)
	db 1, 0
	dw Sfx_FlatWalk_Ch1
; 0x3bcae

Sfx_01d_Ch1: ; 3bcae (0e:7cae)
	semitone_offset 0
	tempo 74
	wave WAVE_44
	volume 75
	note NOTE_DURATION_10, B_2, 19
	audio_wait_20
	audio_end
; 0x3bcbb

Sfx_01d: ; 3bcbb (0e:7cbb)
	db 1, 0
	dw Sfx_01d_Ch1
; 0x3bcbf

Sfx_01e_Ch1: ; 3bcbf (0e:7cbf)
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 113
	note NOTE_DURATION_14, F_1, 31
	audio_wait_14
	audio_end
; 0x3bccc

Sfx_01e: ; 3bccc (0e:7ccc)
	db 1, 0
	dw Sfx_01e_Ch1
; 0x3bcd0

Sfx_01f_Ch1: ; 3bcd0 (0e:7cd0)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_8, F_1, 31
	audio_wait_8
	note NOTE_DURATION_8, F_1, 24
	audio_wait_8
	audio_end
; 0x3bce1

Sfx_01f: ; 3bce1 (0e:7ce1)
	db 1, 0
	dw Sfx_01f_Ch1
; 0x3bce5

Sfx_020_Ch1: ; 3bce5 (0e:7ce5)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	vibrato_amplitude 0
	volume 94
	note NOTE_DURATION_1, G#2, 24
	audio_wait_4
	note NOTE_DURATION_1, G#2, 19
	audio_wait_4
	note NOTE_DURATION_1, G#2, 14
	audio_wait_4
	note NOTE_DURATION_1, G#2, 9
	audio_wait_4
	note NOTE_DURATION_1, G#2, 4
	audio_wait_4
	audio_end
; 0x3bd04

Sfx_020: ; 3bd04 (0e:7d04)
	db 1, 0
	dw Sfx_020_Ch1
; 0x3bd08

Sfx_HangGrab_Ch1: ; 3bd08 (0e:7d08)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 120
	note NOTE_DURATION_2, F#3, 29
	audio_wait_3
	note NOTE_DURATION_2, G_3, 29
	audio_wait_3
	note NOTE_DURATION_1, A#3, 9
	audio_wait_2
	audio_end
; 0x3bd1d

Sfx_HangGrab: ; 3bd1d (0e:7d1d)
	db 1, 0
	dw Sfx_HangGrab_Ch1
; 0x3bd21

Sfx_022_Ch1: ; 3bd21 (0e:7d21)
	semitone_offset 0
	tempo 74
	wave WAVE_3D
	volume 94
	audio_wait_56
	note NOTE_DURATION_15, C_3, 17
	audio_wait_15
	audio_end
; 0x3bd2f

Sfx_022: ; 3bd2f (0e:7d2f)
	db 1, 0
	dw Sfx_022_Ch1
; 0x3bd33

Sfx_023_Ch1: ; 3bd33 (0e:7d33)
	volume 75
	semitone_offset 0
	tempo 74
	wave WAVE_10
	pitch_offset 6
	note NOTE_DURATION_15, C_3, 19
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
	note NOTE_DURATION_15, C_3, 7
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
	audio_end
; 0x3bd60

Sfx_023: ; 3bd60 (0e:7d60)
	db 1, 0
	dw Sfx_023_Ch1
; 0x3bd64

Sfx_024_Ch1: ; 3bd64 (0e:7d64)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 120
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
	audio_wait_1
	note E_2
	audio_end
; 0x3bdcc

Sfx_024: ; 3bdcc (0e:7dcc)
	db 1, 0
	dw Sfx_024_Ch1
; 0x3bdd0

Sfx_025_Ch1: ; 3bdd0 (0e:7dd0)
	semitone_offset 0
	tempo 74
	wave WAVE_0D
	volume 75
	note NOTE_DURATION_1, C_5, 19
	audio_wait_2
	note E_5
	audio_wait_2
	note C#5
	audio_wait_6
	wave WAVE_37
	volume 103
	note NOTE_DURATION_42, C_1, 24
	audio_wait_42
	note E_2
	audio_end
; 0x3bdea

Sfx_025: ; 3bdea (0e:7dea)
	db 1, 0
	dw Sfx_025_Ch1
; 0x3bdee

Sfx_PuffRaise_Ch1: ; 3bdee (0e:7dee)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 85
	pitch_offset_mult 8
	pitch_offset 0
	note NOTE_DURATION_9, C_3, 22
	audio_wait_3
	pitch_offset 2
	audio_wait_3
	note C_5
	audio_wait_2
	note C#7
	audio_wait_2
	note G_7
	audio_wait_6
	note E_2, NOTE_DURATION_9, 11
	audio_wait_3
	pitch_offset 2
	audio_wait_3
	note C_5
	audio_wait_2
	note C#7
	audio_wait_2
	note G_7
	audio_wait_6
	audio_end
; 0x3be15

Sfx_PuffRaise: ; 3be15 (0e:7e15)
	db 1, 0
	dw Sfx_PuffRaise_Ch1
; 0x3be19

Sfx_027_Ch1: ; 3be19 (0e:7e19)
	semitone_offset 0
	tempo 74
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
; 0x3be44

Sfx_027: ; 3be44 (0e:7e44)
	db 1, 0
	dw Sfx_027_Ch1
; 0x3be48

Sfx_028_Ch1: ; 3be48 (0e:7e48)
	semitone_offset 0
	tempo 74
	wave WAVE_10
	volume 75
	note NOTE_DURATION_1, C_5, 17
	audio_wait_10
	note B_4
	audio_wait_6
	note A#4
	audio_wait_6
	note A_4
	audio_wait_3
	note G#4
	audio_wait_3
	note G_4
	audio_wait_3
	note F#4
	audio_wait_3
	note F_4
	audio_wait_3
	audio_end
; 0x3be63

Sfx_028: ; 3be63 (0e:7e63)
	db 1, 0
	dw Sfx_028_Ch1
; 0x3be67

Sfx_ZombieWalk_Ch1: ; 3be67 (0e:7e67)
	semitone_offset 0
	tempo 74
	wave WAVE_68
	volume 47
	note NOTE_DURATION_8, D_2, 14
	audio_wait_8
	wave WAVE_65
	note NOTE_DURATION_8, D_2, 17
	audio_wait_8
	note NOTE_DURATION_20, D_2, 19
	audio_wait_20
	audio_end
; 0x3be7e

Sfx_ZombieWalk: ; 3be7e (0e:7e7e)
	db 1, 0
	dw Sfx_ZombieWalk_Ch1
; 0x3be82

Sfx_02a_Ch1: ; 3be82 (0e:7e82)
	semitone_offset 0
	tempo 74
	wave WAVE_65
	volume 113
	note NOTE_DURATION_1, C#2, 29
	audio_wait_1
	note 9
	audio_wait_1
	note 4
	audio_wait_1
	note C#3, 24
	audio_wait_1
	note 9
	audio_wait_1
	note 2
	audio_wait_1
	note F#3, 19
	audio_wait_1
	note 9
	audio_wait_1
	note 2
	audio_wait_1
	note G#2, 14
	audio_wait_1
	note 9
	audio_wait_1
	note 2
	audio_wait_1
	note C#3, 12
	audio_wait_1
	note 7
	audio_wait_1
	note 2
	audio_wait_1
	audio_end
; 0x3beaf

Sfx_02a: ; 3beaf (0e:7eaf)
	db 1, 0
	dw Sfx_02a_Ch1
; 0x3beb3

Sfx_02b_Ch1: ; 3beb3 (0e:7eb3)
	semitone_offset 0
	tempo 74
	wave WAVE_0A
	vibrato_amplitude 46
	volume 120
	pitch_offset 0
	note NOTE_DURATION_12, C_1, 24
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
; 0x3bfc4

Sfx_02b: ; 3bfc4 (0e:7fc4)
	db 1, 0
	dw Sfx_02b_Ch1
; 0x3bfc8

Sfx_02c_Ch1: ; 3bfc8 (0e:7fc8)
	semitone_offset 0
	tempo 74
	wave WAVE_42
	volume 120
	note NOTE_DURATION_7, C_1, 26
	audio_wait_7
	audio_end
; 0x3bfd5

Sfx_02c: ; 3bfd5 (0e:7fd5)
	db 1, 0
	dw Sfx_02c_Ch1
; 0x3bfd9

Sfx_FullyChargedThrow_Ch1: ; 3bfd9 (0e:7fd9)
	semitone_offset 0
	tempo 74
	wave WAVE_36
	volume 75
	note NOTE_DURATION_6, C_1, 19
	audio_wait_6
	note C#1
	audio_wait_6
	note F_1
	audio_wait_6
	note F#1
	audio_wait_6
	note C_2
	audio_wait_6
	audio_end
; 0x3bfee

Sfx_FullyChargedThrow: ; 3bfee (0e:7fee)
	db 1, 0
	dw Sfx_FullyChargedThrow_Ch1
; 0x3bff2
