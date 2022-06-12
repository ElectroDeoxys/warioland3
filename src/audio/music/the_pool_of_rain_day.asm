Music_ThePoolOfRainDay_Ch1: ; 364e0 (0d:64e0)
	semitone_offset 0
	tempo 60
	wave WAVE_50
	volume 85
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96

.loop
.sub1
	note NOTE_DURATION_3, G_3, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F#3
	audio_wait_12
	note D_3
	audio_wait_12
	note G_3
	audio_wait_48
	audio_ret

	audio_wait_96

.sub2
	note NOTE_DURATION_6, G_3, 19
	audio_wait_6
	note A_3
	audio_wait_6
	note B_3
	audio_wait_6
	note D_4
	audio_wait_6
	note NOTE_DURATION_3, C#4
	audio_wait_12
	note A_3
	audio_wait_12
	note G_3
	audio_wait_48
	audio_ret

	audio_wait_96
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, G_4
	audio_wait_6
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note F_4
	audio_wait_12
	note D_4
	audio_wait_12
	note G_4
	audio_wait_48
	audio_wait_96
.sub3
	note NOTE_DURATION_6, G_4, 19
	audio_wait_6
	note A_4
	audio_wait_6
	note B_4
	audio_wait_6
	note D_5
	audio_wait_6
	note NOTE_DURATION_3, C#5
	audio_wait_12
	note A_4
	audio_wait_12
	note G_4
	audio_wait_48
	audio_ret

	audio_wait_96
	audio_call .sub1
	audio_wait_96
	note NOTE_DURATION_6, G_3, 19
	audio_wait_6
	note G_4
	audio_wait_6
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note G_4
	audio_wait_48
	audio_wait_96
	audio_call .sub1
	audio_wait_96
	audio_call .sub2
	audio_wait_96
	note NOTE_DURATION_3, G_4, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F#4
	audio_wait_12
	note D_4
	audio_wait_12
	note G_4
	audio_wait_48
	audio_wait_96
	audio_call .sub3
	audio_wait_96
	audio_call .sub1
	audio_wait_96
	note NOTE_DURATION_6, G_3, 19
	audio_wait_6
	note A_3
	audio_wait_6
	note B_3
	audio_wait_6
	note D_4
	audio_wait_6
	note NOTE_DURATION_3, C#4
	audio_wait_12
	note D_4
	audio_wait_12
	note G_4
	audio_wait_48
	audio_wait_96
	wave WAVE_1B
	volume 75
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note_sustain
	note G_3, 19
	audio_wait_96
	audio_wait_48
	note NOTE_DURATION_0
	audio_wait_12
	note NOTE_DURATION_6, F_3
	audio_wait_6
	note F#3
	audio_wait_6
	note G_3
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note F_3
	audio_wait_6
	note_sustain
	note G_3
	audio_wait_96
	audio_wait_96
	note NOTE_DURATION_0, NOTE_DURATION_48, G_4
	audio_wait_48
	note F#4
	audio_wait_48
	note D_4
	audio_wait_48
	note F#4
	audio_wait_48
	note_sustain
	note G_4
	audio_wait_96
	audio_wait_96
	wave WAVE_50
	vibrato_amplitude 0
	volume 85
	note NOTE_DURATION_0
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_wait_96
	audio_jump .loop
.end
	audio_end
; 0x365b5

Music_ThePoolOfRainDay_Ch2: ; 365b5 (0d:65b5)
	semitone_offset 0
	wave WAVE_47
	volume 85
	note NOTE_DURATION_3, D_1, 19
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_1
	audio_wait_24
.sub1
	note NOTE_DURATION_3, D_1, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, C_1
	audio_wait_48
	audio_ret

.sub2
	note NOTE_DURATION_3, D_1, 19
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_1
	audio_wait_24
	audio_ret

	audio_call .sub1

.loop
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
.sub3
	note NOTE_DURATION_3, D_1, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

.sub4
	note NOTE_DURATION_3, G_1, 19
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#1
	audio_wait_24
	audio_ret

.sub5
	note NOTE_DURATION_3, G_1, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F#1
	audio_wait_48
	audio_ret

	audio_call .sub4
.sub6
	note NOTE_DURATION_3, G_1, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub4
	audio_call .sub6
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x3666b

Music_ThePoolOfRainDay_Ch3: ; 3666b (0d:666b)
	semitone_offset 0
	wave WAVE_5E
	volume 108
	note NOTE_DURATION_3, G_0, 24
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#0
	audio_wait_24
.sub1
	note NOTE_DURATION_3, G_0, 24
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_0
	audio_wait_48
	audio_ret

.sub2
	note NOTE_DURATION_3, G_0, 24
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#0
	audio_wait_24
	audio_ret

	audio_call .sub1

.loop
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
.sub3
	note NOTE_DURATION_3, G_0, 24
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

.sub4
	note NOTE_DURATION_3, C_1, 24
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D#1
	audio_wait_24
	audio_ret

.sub5
	note NOTE_DURATION_3, C_1, 24
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, B_0
	audio_wait_48
	audio_ret

	audio_call .sub4
.sub6
	note NOTE_DURATION_3, C_1, 24
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
	audio_ret

	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub5
	audio_call .sub4
	audio_call .sub6
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x36721

Music_ThePoolOfRainDay_Ch4: ; 36721 (0d:6721)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_60
.sub1
	audio_wait_48
	note NOTE_DURATION_3, D_0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
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
	audio_ret

.sub2
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_60
	audio_ret

	audio_call .sub1

.loop
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x367cb

Music_ThePoolOfRainDay: ; 367cb (d:67cb)
	db $4, $2
	dw Music_ThePoolOfRainDay_Ch1
	dw Music_ThePoolOfRainDay_Ch2
	dw Music_ThePoolOfRainDay_Ch3
	dw Music_ThePoolOfRainDay_Ch4

; unused?
	dw Music_ThePoolOfRainDay_Ch1.loop
	dw Music_ThePoolOfRainDay_Ch2.loop
	dw Music_ThePoolOfRainDay_Ch3.loop
	dw Music_ThePoolOfRainDay_Ch4.loop

	dw Music_ThePoolOfRainDay_Ch1.end
	dw Music_ThePoolOfRainDay_Ch2.end
	dw Music_ThePoolOfRainDay_Ch3.end
	dw Music_ThePoolOfRainDay_Ch4.end
