Music_BossBattle_Ch1: ; 38f27 (0e:4f27)
	semitone_offset 0
	tempo 75
	wave WAVE_17
	volume 75
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_3, G_3, 22
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_48
	audio_wait_72

.loop
	audio_wait_96
	audio_wait_96
.sub1
	wave WAVE_74
	note NOTE_DURATION_3, G_2, 22
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note F#2
	audio_wait_12
	note G_2
	audio_wait_24
	note NOTE_DURATION_24, A#1
	audio_wait_24
	audio_ret

	audio_call .sub1
.sub2
	note NOTE_DURATION_3, G_2, 22
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note F#2
	audio_wait_12
	note NOTE_DURATION_6, G_2
	audio_wait_6
	note A_2
	audio_wait_6
	note B_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_6
	note F_3
	audio_wait_6
	note G_3
	audio_wait_6
	audio_ret

.sub3
	note NOTE_DURATION_3, G#3, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#3
	audio_wait_12
	note G#3
	audio_wait_12
	note NOTE_DURATION_36, G_3
	audio_wait_48
	audio_ret

.sub4
	note NOTE_DURATION_3, G_3, 22
	audio_wait_12
	note C_4
	audio_wait_12
	note G_3
	audio_wait_12
	note F#3
	audio_wait_12
	note G_3
	audio_wait_24
	note NOTE_DURATION_24, A#1
	audio_wait_24
	audio_ret

	audio_call .sub4
.sub5
	note NOTE_DURATION_3, G_3, 22
	audio_wait_12
	note C_4
	audio_wait_12
	note G_3
	audio_wait_12
	note F#3
	audio_wait_12
	note NOTE_DURATION_6, G_3
	audio_wait_6
	note F_3
	audio_wait_6
	note E_3
	audio_wait_6
	note D_3
	audio_wait_6
	note C_3
	audio_wait_6
	note B_2
	audio_wait_6
	note A_2
	audio_wait_6
	note G_2
	audio_wait_6
	audio_ret

.sub6
	note NOTE_DURATION_3, A_2, 22
	audio_wait_24
	note B_2
	audio_wait_24
	note C_3
	audio_wait_48
	audio_ret

	note F_3
	audio_wait_12
	note C_4
	audio_wait_12
	note F_3
	audio_wait_12
	note C_4
	audio_wait_12
	note F_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, E_3
	audio_wait_12
	note C_4
	audio_wait_12
	note E_3
	audio_wait_12
	note C_4
	audio_wait_12
	note E_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, D_3
	audio_wait_12
	note C_4
	audio_wait_12
	note D_3
	audio_wait_12
	note C_4
	audio_wait_12
	note D_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note A_3
	audio_wait_6
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note D_4
	audio_wait_12
	note D_3
	audio_wait_12
	note D_4
	audio_wait_12
	note G_3
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G#3
	audio_wait_12
	note D#4
	audio_wait_12
	note G#3
	audio_wait_12
	note D#4
	audio_wait_12
	note G#3
	audio_wait_12
	note D#4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note E_4
	audio_wait_12
	note G_3
	audio_wait_12
	note E_4
	audio_wait_12
	note G_3
	audio_wait_12
	note E_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F#3
	audio_wait_12
	note C_4
	audio_wait_12
	note F#3
	audio_wait_12
	note C_4
	audio_wait_12
	note F#3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note D_4
	audio_wait_12
	note G_3
	audio_wait_12
	note D_4
	audio_wait_12
	note G_3
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub4
	audio_call .sub5
	audio_call .sub6
	audio_jump .loop
.end
	audio_end
; 0x39055

Music_BossBattle_Ch2: ; 39055 (0e:5055)
	volume 75
	semitone_offset 0
	wave WAVE_0D
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_3, D#3, 22
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_48
	audio_wait_72

.loop
	wave WAVE_71
	audio_wait_12
	volume 75
	note NOTE_DURATION_3, F#1, 21
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G_1
	audio_wait_12
	audio_wait_12
	note F#1
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G_1
	audio_wait_12
.sub1
	audio_wait_12
	note NOTE_DURATION_3, F#1, 21
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_24, C#1
	audio_wait_24
	audio_ret

	audio_call .sub1
.sub2
	audio_wait_12
	note NOTE_DURATION_3, F#1, 21
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_wait_12
	note NOTE_DURATION_3, G_1
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, C#1
	audio_wait_36
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, D_1, 21
	audio_wait_24
	note G_1
	audio_wait_24
	note C_2
	audio_wait_48
.sub3
	audio_wait_12
	note NOTE_DURATION_3, B_3, 21
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub3
	audio_wait_12
	note NOTE_DURATION_3, B_3, 21
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_36
.sub4
	audio_wait_12
	note NOTE_DURATION_3, C#4, 21
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_wait_12
	note NOTE_DURATION_3, D_4
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_wait_12
	note NOTE_DURATION_3, D#4
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub3
	audio_call .sub4
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_wait_12
	note NOTE_DURATION_3, G_1, 21
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_60
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, F_1, 21
	audio_wait_24
	note G_1
	audio_wait_24
	note C_2
	audio_wait_48
	audio_jump .loop
.end
	audio_end
; 0x3911e

Music_BossBattle_Ch3: ; 3911e (0e:511e)
	volume 108
	semitone_offset 0
	wave WAVE_5D
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_3, B_2, 24
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_48
	audio_wait_48
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note G#0
	audio_wait_6
	note A_0
	audio_wait_6
	note B_0
	audio_wait_6

.loop
	wave WAVE_77
	volume 108
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note G_1
	audio_wait_12
	note G_0
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C#1
	audio_wait_12
	note G#1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note G_0
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C#1
	audio_wait_12
	note G#1
	audio_wait_12
.sub1
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note G_1
	audio_wait_12
	note G_0
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_24
	note NOTE_DURATION_24, G#1
	audio_wait_24
	audio_ret

	audio_call .sub1
.sub2
	note NOTE_DURATION_3, C_1, 24
	audio_wait_12
	note G_1
	audio_wait_12
	note G_0
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_1
	audio_wait_12
	audio_ret

	note C#1
	audio_wait_12
	note G#1
	audio_wait_12
	note C#1
	audio_wait_12
	note G#1
	audio_wait_12
	note G_0
	audio_wait_12
	note D_1
	audio_wait_12
	note NOTE_DURATION_12, G_0
	audio_wait_12
	note NOTE_DURATION_6, A_0
	audio_wait_6
	note B_0
	audio_wait_6
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, A_1, 24
	audio_wait_24
	note D_2
	audio_wait_24
	note E_2
	audio_wait_48
	wave WAVE_60
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note NOTE_DURATION_24, F_1
	audio_wait_24
	note NOTE_DURATION_3, G_1
	audio_wait_12
	note A_1
	audio_wait_12
	note G_1
	audio_wait_12
	note F_1
	audio_wait_12
	note E_1
	audio_wait_12
	note F_1
	audio_wait_12
	note NOTE_DURATION_48, G_1
	audio_wait_48
	note NOTE_DURATION_3, F#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_1
	audio_wait_12
	note D_1
	audio_wait_12
	note E_1
	audio_wait_12
	note F#1
	audio_wait_12
	note D_1
	audio_wait_12
	note G_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_12, G#1
	audio_wait_12
	note NOTE_DURATION_6, A#1
	audio_wait_6
	note G#1
	audio_wait_6
	note NOTE_DURATION_24, G_1
	audio_wait_48
	note NOTE_DURATION_3, G#1
	audio_wait_12
	note D#1
	audio_wait_12
	note G#1
	audio_wait_12
	note A#1
	audio_wait_12
	note NOTE_DURATION_24, C_2
	audio_wait_24
	note NOTE_DURATION_6, D_2
	audio_wait_6
	note C_2
	audio_wait_6
	note B_1
	audio_wait_6
	note A_1
	audio_wait_6
	note NOTE_DURATION_3, G_1
	audio_wait_12
	note E_1
	audio_wait_12
	note G_1
	audio_wait_12
	note C_2
	audio_wait_12
	note NOTE_DURATION_24, E_2
	audio_wait_24
	note NOTE_DURATION_6, C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note C_2
	audio_wait_6
	note NOTE_DURATION_3, D_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_2
	audio_wait_12
	note F#2
	audio_wait_12
	note D_2
	audio_wait_12
	note E_2
	audio_wait_12
	note F#2
	audio_wait_12
	note NOTE_DURATION_48, G_2
	audio_wait_60
	wave WAVE_77
	note NOTE_DURATION_3, G_0
	audio_wait_12
	note A_0
	audio_wait_12
	note B_0
	audio_wait_12
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, C#1, 24
	audio_wait_12
	note G#1
	audio_wait_12
	note C#1
	audio_wait_12
	note G#1
	audio_wait_12
	note G_1
	audio_wait_12
	note G_0
	audio_wait_12
	note NOTE_DURATION_6, G_1
	audio_wait_6
	note F_1
	audio_wait_6
	note E_1
	audio_wait_6
	note D_1
	audio_wait_6
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_3, C_2, 24
	audio_wait_24
	note D_2
	audio_wait_24
	note E_2
	audio_wait_48
	audio_jump .loop
.end
	audio_end
; 0x3926d

Music_BossBattle_Ch4: ; 3926d (0e:526d)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, F#0, 19
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6

.loop
.sub1
	note NOTE_DURATION_3, D_0, 19
	audio_wait_12
	note D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
.sub2
	note NOTE_DURATION_3, D_0, 19
	audio_wait_12
	note D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note D#0
	audio_wait_12
	note D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub2
	audio_jump .loop
.end
	audio_end
; 0x39308

Music_BossBattle: ; 39308 (0e:5308)
	db 4, 2
	dw Music_BossBattle_Ch1
	dw Music_BossBattle_Ch2
	dw Music_BossBattle_Ch3
	dw Music_BossBattle_Ch4

; unused?
	dw Music_BossBattle_Ch1.loop
	dw Music_BossBattle_Ch2.loop
	dw Music_BossBattle_Ch3.loop
	dw Music_BossBattle_Ch4.loop

	dw Music_BossBattle_Ch1.end
	dw Music_BossBattle_Ch2.end
	dw Music_BossBattle_Ch3.end
	dw Music_BossBattle_Ch4.end
; 0x39322
