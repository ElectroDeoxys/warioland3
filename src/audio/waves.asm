Waves: ; 311c4 (c:51c4)
	db WAVEFORM_SQUARE_1_2_SAWTOOTH,        0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_00
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fb, $28, $3c ; WAVE_01
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_02
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_03
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fb, $28, $3c ; WAVE_04
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_05
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_06
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fb, $28, $3c ; WAVE_07
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_08
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $f1, $13, $3c ; WAVE_09
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_0A
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fc, $18, $3c ; WAVE_0B
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_0C
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_0D
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fc, $10, $3c ; WAVE_0E
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $f0, $18, $3c ; WAVE_0F
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_10
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fc, $18, $3c ; WAVE_11
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_12
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $f1, $13, $3c ; WAVE_13
	db RECT_TRACK2 | RECTWAVE_1_8,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_14
	db RECT_TRACK2 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fc, $18, $3c ; WAVE_15
	db RECT_TRACK2 | RECTWAVE_1_8,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_16
	db RECT_TRACK2 | RECTWAVE_1_4,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_17
	db RECT_TRACK2 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fc, $18, $3c ; WAVE_18
	db RECT_TRACK2 | RECTWAVE_1_4,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_19
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_1A
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fc, $18, $3c ; WAVE_1B
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $f0, $10, $3c ; WAVE_1C
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $f1, $13, $3c ; WAVE_1D
	db WAVEFORM_SINE,                       0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_1E
	db WAVEFORM_TRIANGLE,                   0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_1F
	db WAVEFORM_SAWTOOTH,                   0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_20
	db WAVEFORM_STEP,                       0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_21
	db WAVEFORM_SQUARE_1_8,                 0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_22
	db WAVEFORM_SQUARE_2_8,                 0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_23
	db WAVEFORM_SQUARE_3_8,                 0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_24
	db WAVEFORM_SQUARE_4_8,                 0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_25
	db WAVEFORM_SQUARE_1_2_SAWTOOTH,        0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_26
	db WAVEFORM_SQUARE_1_2_SAWTOOTH,        0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_27
	db NOISE_TRACK | NOISE_POLYCOUNTER_07, 10, NO_SWEEP,                      $ff, $ff, $31 ; WAVE_28
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  0, NO_SWEEP,                      $f0, $10, $4f ; WAVE_29
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  8, NO_SWEEP,                      $ff, $ff, $3e ; WAVE_2A
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  6, NO_SWEEP,                      $ff, $ff, $41 ; WAVE_2B
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  6, NO_SWEEP,                      $ff, $ff, $4f ; WAVE_2C
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  0, NO_SWEEP,                      $fd, $0f, $3c ; WAVE_2D
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  2, NO_SWEEP,                      $ff, $ff, $4c ; WAVE_2E
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  0, NO_SWEEP,                      $fd, $0f, $3c ; WAVE_2F
	db NOISE_TRACK | NOISE_POLYCOUNTER_15, 12, NO_SWEEP,                      $ff, $ff, $4f ; WAVE_30
	db NOISE_TRACK | NOISE_POLYCOUNTER_15, 36, NO_SWEEP,                      $ff, $ff, $4f ; WAVE_31
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 5 | SWEEP_INCR | SWEEP_TIME_1, $f6, $00, $3c ; WAVE_32
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 4 | SWEEP_INCR | SWEEP_TIME_2, $ff, $ff, $3c ; WAVE_33
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 4 | SWEEP_DECR | SWEEP_TIME_3, $ff, $ff, $3c ; WAVE_34
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 4 | SWEEP_DECR | SWEEP_TIME_1, $fc, $0c, $3c ; WAVE_35
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 5 | SWEEP_INCR | SWEEP_TIME_1, $ff, $ff, $3c ; WAVE_36
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 7 | SWEEP_INCR | SWEEP_TIME_3, $ff, $ff, $3c ; WAVE_37
	db RECT_TRACK1 | RECTWAVE_1_8,          0, 5 | SWEEP_INCR | SWEEP_TIME_7, $ff, $ff, $3c ; WAVE_38
	db RECT_TRACK1 | RECTWAVE_1_8,          0, 5 | SWEEP_DECR | SWEEP_TIME_7, $ff, $ff, $3c ; WAVE_39
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 7 | SWEEP_DECR | SWEEP_TIME_3, $ff, $ff, $3c ; WAVE_3A
	db RECT_TRACK1 | RECTWAVE_1_8,          0, 5 | SWEEP_DECR | SWEEP_TIME_1, $ff, $ff, $3c ; WAVE_3B
	db RECT_TRACK1 | RECTWAVE_1_8,          0, 7 | SWEEP_INCR | SWEEP_TIME_1, $ff, $ff, $3c ; WAVE_3C
	db RECT_TRACK1 | RECTWAVE_1_4,          0, 5 | SWEEP_INCR | SWEEP_TIME_4, $ff, $ff, $3c ; WAVE_3D
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 5 | SWEEP_INCR | SWEEP_TIME_2, $ff, $ff, $3c ; WAVE_3E
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 2 | SWEEP_DECR | SWEEP_TIME_1, $ff, $ff, $3c ; WAVE_3F
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 5 | SWEEP_INCR | SWEEP_TIME_1, $fa, $4c, $3c ; WAVE_40
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 4 | SWEEP_DECR | SWEEP_TIME_6, $ff, $ff, $3c ; WAVE_41
	db RECT_TRACK1 | RECTWAVE_1_4,          0, 5 | SWEEP_INCR | SWEEP_TIME_1, $ff, $ff, $3c ; WAVE_42
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 7 | SWEEP_INCR | SWEEP_TIME_4, $ff, $ff, $3c ; WAVE_43
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 7 | SWEEP_INCR | SWEEP_TIME_2, $ff, $ff, $3c ; WAVE_44
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 5 | SWEEP_DECR | SWEEP_TIME_1, $fc, $0c, $3c ; WAVE_45
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_46
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_47
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_48
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_49
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_4A
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_4B
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_4C
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_4D
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_4E
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 4 | SWEEP_DECR | SWEEP_TIME_5, $f0, $10, $3c ; WAVE_4F
	db RECT_TRACK2 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_50
	db RECT_TRACK2 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_51
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_52
	db RECT_TRACK2 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_53
	db RECT_TRACK2 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_54
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_55
	db RECT_TRACK2 | RECTWAVE_1_8,          0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_56
	db RECT_TRACK2 | RECTWAVE_1_4,          0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_57
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_58
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 5 | SWEEP_INCR | SWEEP_TIME_4, $f0, $10, $3c ; WAVE_59
	db WAVEFORM_SAWTOOTH,                   0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_5A
	db WAVEFORM_SAWTOOTH,                   0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_5B
	db WAVEFORM_SQUARE_1_8,                 0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_5C
	db WAVEFORM_SQUARE_2_8,                 0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_5D
	db WAVEFORM_SQUARE_2_8,                 0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_5E
	db WAVEFORM_SQUARE_2_8,                 0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_5F
	db WAVEFORM_SQUARE_4_8,                 0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_60
	db WAVEFORM_SQUARE_4_8,                 0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_61
	db WAVEFORM_SQUARE_4_8,                 0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_62
	db WAVEFORM_SPIKY,                      0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_63
	db WAVEFORM_TRIANGLE,                   0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_64
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_65
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_66
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_67
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_68
	db NOISE_TRACK | NOISE_POLYCOUNTER_15,  0, NO_SWEEP,                      $e8, $18, $3c ; WAVE_69
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_6A
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  0, NO_SWEEP,                      $f6, $24, $3c ; WAVE_6B
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  0, NO_SWEEP,                      $fc, $0c, $3c ; WAVE_6C
	db NOISE_TRACK | NOISE_POLYCOUNTER_07,  0, NO_SWEEP,                      $cf, $fa, $3c ; WAVE_6D
	db RECT_TRACK1 | RECTWAVE_1_2,          0, 5 | SWEEP_DECR | SWEEP_TIME_1, $ff, $ff, $3c ; WAVE_6E
	db WAVEFORM_SQUISHED_SINE,              0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_6F
	db RECT_TRACK1 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_70
	db RECT_TRACK1 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_71
	db RECT_TRACK1 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_72
	db RECT_TRACK2 | RECTWAVE_1_8,          0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_73
	db RECT_TRACK2 | RECTWAVE_1_4,          0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_74
	db RECT_TRACK2 | RECTWAVE_1_2,          0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_75
	db WAVEFORM_SQUARE_1_8,                 0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_76
	db WAVEFORM_SQUARE_2_8,                 0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_77
	db WAVEFORM_SQUARE_4_8,                 0, NO_SWEEP,                      $fa, $6c, $3c ; WAVE_78
	db WAVEFORM_SPIKY,                      0, NO_SWEEP,                      $fa, $4c, $3c ; WAVE_79
	db WAVEFORM_SQUARE_1_8,                 0, NO_SWEEP,                      $ff, $ff, $3c ; WAVE_7A
; 0x314a6

WaveSamples: ; 314a6 (c:54a6)
; These are streams of 32 nibbles (4-bit values) used as wave patterns.
; Plot them as a line chart to see the wave's shape.
	dn  0,  0,  1,  1,  2,  3,  5,  6,  8,  9, 10, 12, 13, 14, 14, 15, 15, 15, 14, 14, 13, 12, 10,  9,  8,  6,  5,  3,  2,  1,  1,  0 ; WAVEFORM_SINE
	dn  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0 ; WAVEFORM_TRIANGLE
	dn 15, 15, 14, 14, 13, 13, 12, 12, 11, 11, 10, 10,  9,  9,  8,  8,  7,  7,  6,  6,  5,  5,  4,  4,  3,  3,  2,  2,  1,  1,  0,  0 ; WAVEFORM_SAWTOOTH
	dn 15, 14, 13, 12, 11, 10,  9,  9,  8,  8,  8,  8,  8,  8,  8,  8,  7,  7,  7,  7,  7,  7,  7,  7,  6,  6,  5,  4,  3,  2,  1,  0 ; WAVEFORM_STEP
	dn 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_1_8
	dn 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_2_8
	dn 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_3_8
	dn 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SQUARE_4_8
	dn 15, 15, 15, 15, 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0, 15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1 ; WAVEFORM_SQUARE_1_2_SAWTOOTH
	dn 15, 15, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 15, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1 ; WAVEFORM_SQUARE_1_4_SAWTOOTH
	dn  7,  7,  7,  7,  5,  1, 10,  2,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ; WAVEFORM_SPIKY
	dn  7, 10, 12, 14, 15, 15, 15,  8,  7,  9,  9,  7,  7,  7,  7,  5,  5,  6,  6,  4,  4,  4,  4,  3,  3,  2,  2,  2,  2,  1,  1,  0 ; WAVEFORM_SQUISHED_SINE
; 0x31566
