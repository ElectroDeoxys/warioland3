Music_Perfect_Ch1: ; 3ac45 (0e:6c45)
	semitone_offset 1
	tempo 60
	wave WAVE_17
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	audio_wait_96
	audio_wait_48
	note NOTE_DURATION_4, G_3, 21
	audio_wait_42
	note NOTE_DURATION_3, D_3
	audio_wait_3
	note D#3
	audio_wait_3

.loop
.sub1
	note NOTE_DURATION_4, E_3, 21
	audio_wait_12
	note G_3
	audio_wait_12
	note NOTE_DURATION_6, A_3
	audio_wait_6
	note NOTE_DURATION_4, G_3
	audio_wait_12
	note NOTE_DURATION_6, C_4
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, A_3
	audio_wait_12
	note G_3
	audio_wait_12
	note G#3
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_4, A_3, 21
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_4, C_4
	audio_wait_12
	note NOTE_DURATION_48, A_3
	audio_wait_48
	note NOTE_DURATION_3, G_3
	audio_wait_3
	note G#3
	audio_wait_3
	audio_ret

.sub3
	note NOTE_DURATION_4, A_3, 21
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_4, C_4
	audio_wait_12
	note NOTE_DURATION_6, D#4
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, D_4
	audio_wait_12
	note C_4
	audio_wait_12
	note G#3
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_4, G_3, 21
	audio_wait_12
	note NOTE_DURATION_6, G_4
	audio_wait_6
	note NOTE_DURATION_4, G_3
	audio_wait_12
	note NOTE_DURATION_6, G_4
	audio_wait_6
	note NOTE_DURATION_4, G_3
	audio_wait_12
	note NOTE_DURATION_6, G_4
	audio_wait_6
	note NOTE_DURATION_4, G_3
	audio_wait_12
	note NOTE_DURATION_6, G_4
	audio_wait_24
	note NOTE_DURATION_3, D_3
	audio_wait_3
	note D#3
	audio_wait_3
	audio_ret

	audio_call .sub1
.sub5
	note NOTE_DURATION_4, A_3, 21
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_4, C_4
	audio_wait_12
	note NOTE_DURATION_6, A_4
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, E_4
	audio_wait_12
	note D_4
	audio_wait_12
	note C_4
	audio_wait_12
	audio_ret

.sub6
	note NOTE_DURATION_4, D#4, 21
	audio_wait_6
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, D_4
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, G#3
	audio_wait_6
	note NOTE_DURATION_4, G_3
	audio_wait_18
	note NOTE_DURATION_6, D_3
	audio_wait_6
	note D#3
	audio_wait_6
	note E_3
	audio_wait_6
	note G_3
	audio_wait_6
	note E_3
	audio_wait_6
	note NOTE_DURATION_96, C_3
	audio_wait_6
	audio_ret

	audio_wait_90
	note NOTE_DURATION_3, D_3
	audio_wait_3
	note D#3
	audio_wait_3
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub1
	audio_call .sub5
	audio_call .sub6
	audio_wait_90
	wave WAVE_1A
	note NOTE_DURATION_3, G_3, 21
	audio_wait_3
	note G#3
	audio_wait_3
	note NOTE_DURATION_4, A_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_4, C_4
	audio_wait_12
	note NOTE_DURATION_6, G#3
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, C_4
	audio_wait_12
	note D_4
	audio_wait_12
	note C_4
	audio_wait_12
	note G_3
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note NOTE_DURATION_4, C_4
	audio_wait_12
	note NOTE_DURATION_6, E_4
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, D_4
	audio_wait_12
	note C_4
	audio_wait_12
	note D_4
	audio_wait_12
	note NOTE_DURATION_6, E_4
	audio_wait_6
	note D#4
	audio_wait_6
	note E_4
	audio_wait_6
	note A_4
	audio_wait_12
	note E_4
	audio_wait_6
	note C_4
	audio_wait_6
	note A_3
	audio_wait_6
	note D#4
	audio_wait_6
	note D_4
	audio_wait_6
	note D#4
	audio_wait_6
	note G#4
	audio_wait_12
	note D#4
	audio_wait_6
	note C_4
	audio_wait_6
	note G#3
	audio_wait_6
	note NOTE_DURATION_90, G_3
	audio_wait_90
	note NOTE_DURATION_3, G_4
	audio_wait_3
	note G#4
	audio_wait_3
	note NOTE_DURATION_4, A_4
	audio_wait_12
	note C_5
	audio_wait_12
	note NOTE_DURATION_6, D_5
	audio_wait_6
	note NOTE_DURATION_4, C_5
	audio_wait_12
	note NOTE_DURATION_6, D#5
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, D_5
	audio_wait_12
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note G_4
	audio_wait_12
	note C_5
	audio_wait_12
	note NOTE_DURATION_6, D_5
	audio_wait_6
	note NOTE_DURATION_4, C_5
	audio_wait_12
	note NOTE_DURATION_6, E_5
	audio_wait_12
	note NOTE_DURATION_4
	audio_wait_6
	note NOTE_DURATION_4, D_5
	audio_wait_12
	note C_5
	audio_wait_12
	note D_5
	audio_wait_12
	note NOTE_DURATION_6, E_5
	audio_wait_6
	note D#5
	audio_wait_6
	note E_5
	audio_wait_6
	note A_5
	audio_wait_12
	note E_5
	audio_wait_6
	note C_5
	audio_wait_6
	note A_4
	audio_wait_6
	note D#5
	audio_wait_6
	note G#5
	audio_wait_6
	note D#5
	audio_wait_6
	note C_5
	audio_wait_12
	note G#4
	audio_wait_12
	note NOTE_DURATION_96, G_4
	audio_wait_6
	audio_wait_90
	wave WAVE_17
	note NOTE_DURATION_3, D_3
	audio_wait_3
	note D#3
	audio_wait_3
	audio_jump .loop
.end
	audio_end
; 0x3adcd

Music_Perfect_Ch2: ; 3adcd (0e:6dcd)
	semitone_offset 1
	wave WAVE_47
	volume 75
	audio_wait_6
	note NOTE_DURATION_6, B_2, 21
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_30
	note NOTE_DURATION_6, C_3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_24
	audio_wait_6
	note NOTE_DURATION_6, C#3
	audio_wait_18
	note NOTE_DURATION_6
	audio_wait_24
	note NOTE_DURATION_6, D_3
	audio_wait_48

.loop
.sub1
	audio_wait_12
	note NOTE_DURATION_6, G_1, 21
	audio_wait_6
	note E_2
	audio_wait_12
	note G_1
	audio_wait_6
	note E_2
	audio_wait_24
	note G_1
	audio_wait_6
	note E_2
	audio_wait_12
	note G_1
	audio_wait_6
	note E_2
	audio_wait_12
	audio_ret

.sub2
	audio_wait_12
	note NOTE_DURATION_6, A_1, 21
	audio_wait_6
	note F_2
	audio_wait_12
	note A_1
	audio_wait_6
	note F_2
	audio_wait_24
	note A_1
	audio_wait_6
	note F_2
	audio_wait_12
	note A_1
	audio_wait_6
	note F_2
	audio_wait_12
	audio_ret

.sub3
	audio_wait_12
	note NOTE_DURATION_6, C_2, 21
	audio_wait_6
	note A_2
	audio_wait_12
	note C_2
	audio_wait_6
	note A_2
	audio_wait_24
	note C_2
	audio_wait_6
	note G#2
	audio_wait_12
	note C_2
	audio_wait_6
	note G#2
	audio_wait_12
	audio_ret

.sub4
	audio_wait_12
	note NOTE_DURATION_6, C_2, 21
	audio_wait_6
	note G_2
	audio_wait_12
	note C_2
	audio_wait_6
	note G_2
	audio_wait_12
	note B_1
	audio_wait_48
	audio_ret

	audio_call .sub1
.sub5
	audio_wait_12
	note NOTE_DURATION_6, A_1, 21
	audio_wait_6
	note F_2
	audio_wait_12
	note A_1
	audio_wait_6
	note F_2
	audio_wait_24
	note C_2
	audio_wait_6
	note A_2
	audio_wait_12
	note C_2
	audio_wait_6
	note A_2
	audio_wait_12
	audio_ret

.sub6
	audio_wait_12
	note NOTE_DURATION_6, C_2, 21
	audio_wait_6
	note G#2
	audio_wait_12
	note C_2
	audio_wait_6
	note G#2
	audio_wait_12
	note B_1
	audio_wait_48
	audio_ret

.sub7
	audio_wait_12
	note NOTE_DURATION_6, G_1, 21
	audio_wait_6
	note E_2
	audio_wait_12
	note G_1
	audio_wait_6
	note E_2
	audio_wait_12
	note E_1
	audio_wait_48
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub1
	audio_call .sub5
	audio_call .sub6
	audio_call .sub7
	note NOTE_DURATION_6, A_1, 21
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_1
	audio_wait_6
	note C_2
	audio_wait_6
	note G#1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note G#1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note G#1
	audio_wait_6
	note C_2
	audio_wait_6
	note G_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note G_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note G_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note G_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note D_2
	audio_wait_6
	note C_2
	audio_wait_6
	note G_1
	audio_wait_6
	note A_1
	audio_wait_6
	note C_2
	audio_wait_6
	note E_2
	audio_wait_6
	note A_1
	audio_wait_6
	note C_2
	audio_wait_6
	note E_2
	audio_wait_6
	note A_1
	audio_wait_6
	note C_2
	audio_wait_6
	note G#1
	audio_wait_6
	note C_2
	audio_wait_6
	note D#2
	audio_wait_6
	note G#1
	audio_wait_6
	note C_2
	audio_wait_6
	note D#2
	audio_wait_6
	note G#1
	audio_wait_6
	note C_2
	audio_wait_6
	note G_1
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note G_1
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note G_1
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note G_1
	audio_wait_6
	note B_1
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note D_2
	audio_wait_6
	note B_1
	audio_wait_6
	note G_1
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note G#2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note G#2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note G#2
	audio_wait_6
	note C_3
	audio_wait_6
	note G_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note G_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note G_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note G_2
	audio_wait_6
	note C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_6
	note D_3
	audio_wait_6
	note C_3
	audio_wait_6
	note G_2
	audio_wait_6
	note C_3
	audio_wait_6
	note A_2
	audio_wait_6
	note F#2
	audio_wait_6
	note C_3
	audio_wait_6
	note A_2
	audio_wait_6
	note F#2
	audio_wait_6
	note C_3
	audio_wait_6
	note A_2
	audio_wait_6
	note C_3
	audio_wait_6
	note G#2
	audio_wait_6
	note F_2
	audio_wait_6
	note C_3
	audio_wait_6
	note G#2
	audio_wait_6
	note F_2
	audio_wait_6
	note C_3
	audio_wait_6
	note G#2
	audio_wait_6
	note B_2
	audio_wait_6
	note G_2
	audio_wait_6
	note E_2
	audio_wait_6
	note B_2
	audio_wait_6
	note A#2
	audio_wait_6
	note F#2
	audio_wait_6
	note D#2
	audio_wait_6
	note A#2
	audio_wait_6
	note A_2
	audio_wait_6
	note F_2
	audio_wait_6
	note D_2
	audio_wait_6
	note A_2
	audio_wait_6
	note G_2
	audio_wait_24
	audio_jump .loop
.end
	audio_end
; 0x3af7d

Music_Perfect_Ch3: ; 3af7d (0e:6f7d)
	semitone_offset 1
	wave WAVE_5E
	volume 108
	note NOTE_DURATION_6, G_2, 24
	audio_wait_6
	note G_3
	audio_wait_12
	note G_2
	audio_wait_6
	note G_3
	audio_wait_12
	note G_2
	audio_wait_12
	note A_2
	audio_wait_6
	note G_3
	audio_wait_12
	note A_2
	audio_wait_6
	note G_3
	audio_wait_12
	note A_2
	audio_wait_12
	note A#2
	audio_wait_6
	note G_3
	audio_wait_12
	note A#2
	audio_wait_6
	note G_3
	audio_wait_12
	note A#2
	audio_wait_12
	note B_2
	audio_wait_12
	note NOTE_DURATION_4, G_0
	audio_wait_12
	note A_0
	audio_wait_12
	note B_0
	audio_wait_12

.loop
.sub1
	note NOTE_DURATION_6, C_1, 24
	audio_wait_24
	note G_0
	audio_wait_24
	note C_1
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_6, C#1
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_6, D_1, 24
	audio_wait_24
	note A_0
	audio_wait_24
	note D_1
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_6, E_1
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_6, F_1, 24
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_24
	note NOTE_DURATION_6, D#1
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_24
	audio_ret

.sub4
	note NOTE_DURATION_6, D_1, 24
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_24
	note NOTE_DURATION_4, G_2
	audio_wait_12
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note G#0
	audio_wait_6
	note A_0
	audio_wait_6
	note G#0
	audio_wait_6
	note G_0
	audio_wait_12
	audio_ret

	audio_call .sub1
.sub5
	note NOTE_DURATION_6, D_1, 24
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_6, E_1
	audio_wait_12
	note F_1
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_24
	audio_ret

.sub6
	note NOTE_DURATION_6, D#1, 24
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_24
	note NOTE_DURATION_4, G_2
	audio_wait_12
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note G#0
	audio_wait_6
	note A_0
	audio_wait_6
	note G#0
	audio_wait_6
	note G_0
	audio_wait_12
	audio_ret

	note C_1
	audio_wait_24
	note G_0
	audio_wait_24
	note NOTE_DURATION_4, C_2
	audio_wait_12
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note G#0
	audio_wait_6
	note A_0
	audio_wait_6
	note A#0
	audio_wait_6
	note B_0
	audio_wait_12
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub1
	audio_call .sub5
	audio_call .sub6
	note NOTE_DURATION_6, C_1, 24
	audio_wait_24
	note G_0
	audio_wait_24
	note NOTE_DURATION_4, C_2
	audio_wait_12
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note G#0
	audio_wait_6
	note A_0
	audio_wait_6
	note G#0
	audio_wait_6
	note G_0
	audio_wait_12
.sub7
	note NOTE_DURATION_6, F_0, 24
	audio_wait_12
	note A_0
	audio_wait_12
	note C_1
	audio_wait_12
	note D_1
	audio_wait_12
	note D#1
	audio_wait_12
	note D_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G#0
	audio_wait_12
	audio_ret

.sub8
	note NOTE_DURATION_6, E_0, 24
	audio_wait_12
	note G_0
	audio_wait_12
	note C_1
	audio_wait_12
	note D_1
	audio_wait_12
	note E_1
	audio_wait_12
	note D_1
	audio_wait_12
	note C_1
	audio_wait_12
	note G_0
	audio_wait_12
	audio_ret

	note D_0
	audio_wait_12
	note F_0
	audio_wait_12
	note A_0
	audio_wait_12
	note C_1
	audio_wait_12
	note C#0
	audio_wait_12
	note F_0
	audio_wait_12
	note G#0
	audio_wait_12
	note C_1
	audio_wait_12
	note C_0
	audio_wait_12
	note E_0
	audio_wait_12
	note G_0
	audio_wait_12
	note B_0
	audio_wait_12
	note C_1
	audio_wait_12
	note B_0
	audio_wait_12
	note G_0
	audio_wait_12
	note E_0
	audio_wait_12
	audio_call .sub7
	audio_call .sub8
	note NOTE_DURATION_6, D_0, 24
	audio_wait_12
	note F#0
	audio_wait_12
	note A_0
	audio_wait_12
	note D_1
	audio_wait_12
	note C#0
	audio_wait_12
	note F_0
	audio_wait_12
	note G#0
	audio_wait_12
	note C_1
	audio_wait_12
	note E_0
	audio_wait_12
	note B_0
	audio_wait_12
	note D#0
	audio_wait_12
	note A#0
	audio_wait_12
	note D_0
	audio_wait_12
	note A_0
	audio_wait_12
	note G_0
	audio_wait_6
	note NOTE_DURATION_6
	audio_wait_6
	note NOTE_DURATION_6, A_0
	audio_wait_6
	note B_0
	audio_wait_6
	audio_jump .loop
.end
	audio_end
; 0x3b0c1

Music_Perfect_Ch4: ; 3b0c1 (0e:70c1)
	semitone_offset 0
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, D#0, 17
	audio_wait_6
	note D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note D_0
	audio_wait_12
	note D#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note D_0
	audio_wait_12
	note D#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note D_0
	audio_wait_12
	note D#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_0
	audio_wait_12
	note D#0
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6

.loop
.sub1
	note NOTE_DURATION_3, D#0, 17
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
	note D_0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	audio_ret

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
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end
; 0x3b152

Music_Perfect: ; 3b152 (0e:7152)
	db 4, 2
	dw Music_Perfect_Ch1
	dw Music_Perfect_Ch2
	dw Music_Perfect_Ch3
	dw Music_Perfect_Ch4

; unused?
	dw Music_Perfect_Ch1.loop
	dw Music_Perfect_Ch2.loop
	dw Music_Perfect_Ch3.loop
	dw Music_Perfect_Ch4.loop

	dw Music_Perfect_Ch1.end
	dw Music_Perfect_Ch2.end
	dw Music_Perfect_Ch3.end
	dw Music_Perfect_Ch4.end
; 0x3b16c
