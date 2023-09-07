Music_TitleScreen_Ch1: ; 39f1f (0e:5f1f)
	semitone_offset 0
	tempo 60
	wave WAVE_51
	volume 75
	audio_wait_6
	note NOTE_DURATION_3, C_2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
.sub1
	audio_wait_6
	note NOTE_DURATION_3, C_2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.loop
	audio_call .sub1
	audio_call .sub1
.sub2
	audio_wait_6
	note NOTE_DURATION_3, D#2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3, D_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub2
.sub3
	audio_wait_6
	note NOTE_DURATION_3, F#2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub3
.sub4
	audio_wait_6
	note NOTE_DURATION_3, F_2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3, E_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub4
.sub5
	audio_wait_6
	note NOTE_DURATION_3, E_2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3, D_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub6
	audio_wait_6
	note NOTE_DURATION_3, D_2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3, C_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_wait_6
	note NOTE_DURATION_3, B_1, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub5
	audio_call .sub6
	audio_wait_6
	note NOTE_DURATION_3, C_2, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_30
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, C_2
	audio_wait_48
	audio_jump .loop
.end
	audio_end
; 0x39fe5

Music_TitleScreen_Ch2: ; 39fe5 (0e:5fe5)
	semitone_offset 0
	wave WAVE_47
	volume 75
	note NOTE_DURATION_5, G_0, 24
	audio_wait_6
	note NOTE_DURATION_3, F_1, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, D_0
	audio_wait_12
	note G_0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, D_0
	audio_wait_12
.sub1
	note NOTE_DURATION_5, G_0, 24
	audio_wait_6
	note NOTE_DURATION_3, F_1, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, D_0
	audio_wait_12
	note G_0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, D_0
	audio_wait_12
	audio_ret

.loop
	audio_call .sub1
	note NOTE_DURATION_5, G_0, 19
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, D_0
	audio_wait_12
	note G_0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note G#0
	audio_wait_6
	note A_0
	audio_wait_6
	note NOTE_DURATION_5, A#0
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, F_0
	audio_wait_12
	note A#0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, F_0
	audio_wait_12
	note A#0
	audio_wait_6
	note NOTE_DURATION_3, G#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, F_0
	audio_wait_12
	note A#0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_6, A#0
	audio_wait_6
	note B_0
	audio_wait_6
	note C_1
	audio_wait_6
	note NOTE_DURATION_5, C#1
	audio_wait_6
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G#0
	audio_wait_12
	note C#1
	audio_wait_6
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G#0
	audio_wait_12
	note C#1
	audio_wait_6
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G#0
	audio_wait_12
	note C#1
	audio_wait_6
	note NOTE_DURATION_3, B_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, C#1
	audio_wait_12
	note C_1
	audio_wait_6
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G_0
	audio_wait_12
	note C_1
	audio_wait_6
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G_0
	audio_wait_12
	note C_1
	audio_wait_6
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G_0
	audio_wait_12
	note C_1
	audio_wait_6
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, C_1
	audio_wait_12
.sub2
	note NOTE_DURATION_5, F_0, 19
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, F_0
	audio_wait_12
	note B_0
	audio_wait_6
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, B_0
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_5, E_0, 19
	audio_wait_6
	note NOTE_DURATION_3, G_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, E_0
	audio_wait_12
	note A_0
	audio_wait_6
	note NOTE_DURATION_3, G_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, A_0
	audio_wait_12
	audio_ret

	note D_0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, D_0
	audio_wait_12
	note G_0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G_0
	audio_wait_12
	note C_0
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, G_0
	audio_wait_12
	note C_0
	audio_wait_6
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, C_0
	audio_wait_12
	audio_call .sub2
	audio_call .sub3
	note NOTE_DURATION_5, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_5, D_0
	audio_wait_12
	note C#0
	audio_wait_6
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C#0
	audio_wait_12
	note G_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, G#0
	audio_wait_48
	audio_jump .loop
.end
	audio_end
; 0x3a170

Music_TitleScreen_Ch3: ; 3a170 (0e:6170)
	semitone_offset 0
	wave WAVE_63
	volume 108
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	audio_wait_96
	audio_wait_96

.loop
	note NOTE_DURATION_12, G_2, 24
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note D_2
	audio_wait_12
	note G_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note D_2
	audio_wait_12
	note G_2
	audio_wait_96
	note NOTE_DURATION_12, A#2
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, G#2
	audio_wait_12
	note F_2
	audio_wait_12
	note A#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#2
	audio_wait_12
	note F_2
	audio_wait_12
	note A#2
	audio_wait_96
	note NOTE_DURATION_12, C#3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_96
	note NOTE_DURATION_12, C_3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_12
	note C_4
	audio_wait_36
	note NOTE_DURATION_12
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, A#3
	audio_wait_12
	note G_3
	audio_wait_12
	note C_4
	audio_wait_48
	note NOTE_DURATION_18, F_2
	audio_wait_18
	note NOTE_DURATION_6, A_2
	audio_wait_6
	note NOTE_DURATION_3, C_3
	audio_wait_12
	note E_3
	audio_wait_12
	note D_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_18, E_2
	audio_wait_18
	note NOTE_DURATION_6, G_2
	audio_wait_6
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_18, D_2
	audio_wait_18
	note NOTE_DURATION_6, F_2
	audio_wait_6
	note NOTE_DURATION_3, A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note B_2
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_12, B_2
	audio_wait_12
	note NOTE_DURATION_6, A_2
	audio_wait_6
	note G#2
	audio_wait_6
	note NOTE_DURATION_72, G_2
	audio_wait_96
	note NOTE_DURATION_18, F_2
	audio_wait_18
	note NOTE_DURATION_6, A_2
	audio_wait_6
	note NOTE_DURATION_3, C_3
	audio_wait_12
	note E_3
	audio_wait_12
	note D_3
	audio_wait_12
	note A_3
	audio_wait_36
	note NOTE_DURATION_18, E_2
	audio_wait_18
	note NOTE_DURATION_6, G_2
	audio_wait_6
	note NOTE_DURATION_3, B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note C_3
	audio_wait_12
	note G_3
	audio_wait_36
	note NOTE_DURATION_12, C_3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_3, A#2
	audio_wait_12
	note G#2
	audio_wait_12
	note C_3
	audio_wait_12
	note C_4
	audio_wait_12
	note A#3
	audio_wait_12
	note G#3
	audio_wait_12
	note NOTE_DURATION_48, G_3
	audio_wait_48
	note NOTE_DURATION_6, G#3
	audio_wait_48
	audio_jump .loop
.end
	audio_end
; 0x3a24b

Music_TitleScreen_Ch4: ; 3a24b (0e:624b)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_2, F#0, 19
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2, G#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2, G#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
.sub1
	note NOTE_DURATION_2, F#0, 19
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2, G#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2, G#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	audio_ret

.loop
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_2, F#0, 19
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2, G#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2, G#0
	audio_wait_6
	note F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	audio_jump .loop
.end
	audio_end
; 0x3a2ef

Music_TitleScreen: ; 3a2ef (0e:62ef)
	db 4, 2
	dw Music_TitleScreen_Ch1
	dw Music_TitleScreen_Ch2
	dw Music_TitleScreen_Ch3
	dw Music_TitleScreen_Ch4

; unused?
	dw Music_TitleScreen_Ch1.loop
	dw Music_TitleScreen_Ch2.loop
	dw Music_TitleScreen_Ch3.loop
	dw Music_TitleScreen_Ch4.loop

	dw Music_TitleScreen_Ch1.end
	dw Music_TitleScreen_Ch2.end
	dw Music_TitleScreen_Ch3.end
	dw Music_TitleScreen_Ch4.end
; 0x3a309
