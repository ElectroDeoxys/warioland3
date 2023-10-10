Music_TheVastPlainDay_Ch1:
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_1A
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 75
	audio_wait_96
	audio_wait_96
	note NOTE_DURATION_3, C_3, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_16, A#2
	audio_wait_16
	note NOTE_DURATION_8, G_2
	audio_wait_8
	note NOTE_DURATION_3, C_3
	audio_wait_96
	note NOTE_DURATION_16
	audio_wait_16
	note NOTE_DURATION_8, D_3
	audio_wait_8
	note NOTE_DURATION_16, E_3
	audio_wait_16
	note NOTE_DURATION_8, G_3
	audio_wait_8
	note NOTE_DURATION_3, F_3
	audio_wait_16
	note D_3
	audio_wait_8
	note A#2
	audio_wait_16
	note G_2
	audio_wait_8
	note C_3
	audio_wait_96
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_8, C_4
	audio_wait_8
	note C_3
	audio_wait_8
	note NOTE_DURATION_3, C_4
	audio_wait_16
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_24
	audio_wait_24
	note NOTE_DURATION_16, A#3
	audio_wait_16
	note NOTE_DURATION_8, G_3
	audio_wait_8
	note NOTE_DURATION_3, C_4
	audio_wait_96
	note NOTE_DURATION_16
	audio_wait_16
	note NOTE_DURATION_8, D_4
	audio_wait_8
	note NOTE_DURATION_16, E_4
	audio_wait_16
	note NOTE_DURATION_8, G_4
	audio_wait_8
	note NOTE_DURATION_3, F_4
	audio_wait_16
	note D_4
	audio_wait_8
	note A#3
	audio_wait_16
	note G_3
	audio_wait_8
	note C_4
	audio_wait_96
	note NOTE_DURATION_16, C_4
	audio_wait_16
	note NOTE_DURATION_8, A_3
	audio_wait_8
	note NOTE_DURATION_16, F_3
	audio_wait_16
	note NOTE_DURATION_8, C_3
	audio_wait_8
	note NOTE_DURATION_3, C_4
	audio_wait_16
	note NOTE_DURATION_3
	audio_wait_32
	note NOTE_DURATION_16, B_3
	audio_wait_16
	note NOTE_DURATION_8, C_4
	audio_wait_8
	note NOTE_DURATION_16, G#3
	audio_wait_16
	note NOTE_DURATION_8, F_3
	audio_wait_8
	note NOTE_DURATION_3, C_4
	audio_wait_48
	note NOTE_DURATION_16, F#3
	audio_wait_16
	note NOTE_DURATION_8, G_3
	audio_wait_8
	note NOTE_DURATION_16, E_3
	audio_wait_16
	note NOTE_DURATION_8, C_3
	audio_wait_8
	note NOTE_DURATION_3, G_3
	audio_wait_16
	note NOTE_DURATION_3
	audio_wait_32
	note NOTE_DURATION_16, F#3
	audio_wait_16
	note NOTE_DURATION_8, G_3
	audio_wait_8
	note NOTE_DURATION_16, E_3
	audio_wait_16
	note NOTE_DURATION_8, C_3
	audio_wait_8
	note NOTE_DURATION_3, G_3
	audio_wait_48
	note NOTE_DURATION_16, B_3
	audio_wait_16
	note NOTE_DURATION_8, C_4
	audio_wait_8
	note NOTE_DURATION_16, A_3
	audio_wait_16
	note NOTE_DURATION_8, F_3
	audio_wait_8
	note NOTE_DURATION_3, C_4
	audio_wait_16
	note NOTE_DURATION_3
	audio_wait_32
	note NOTE_DURATION_16, D_3
	audio_wait_16
	note NOTE_DURATION_8, C#3
	audio_wait_8
	note NOTE_DURATION_16, D_3
	audio_wait_16
	note NOTE_DURATION_8, F#3
	audio_wait_8
	note NOTE_DURATION_16, A_3
	audio_wait_16
	note NOTE_DURATION_8, C_4
	audio_wait_8
	note NOTE_DURATION_16, B_3
	audio_wait_16
	note NOTE_DURATION_8, A_3
	audio_wait_8
	note G_3
	audio_wait_8
	note G_4
	audio_wait_8
	note G_3
	audio_wait_8
	note NOTE_DURATION_3, F_4
	audio_wait_16
	note NOTE_DURATION_8, D_4
	audio_wait_8
	note G_4
	audio_wait_16
	note NOTE_DURATION_8
	audio_wait_8
	note NOTE_DURATION_3, F_4
	audio_wait_16
	note NOTE_DURATION_8, D_4
	audio_wait_8
	note NOTE_DURATION_3, G_4
	audio_wait_96
	audio_jump .loop
.end
	audio_wait_96
	audio_wait_96
	note NOTE_DURATION_3, C_3, 19
	audio_wait_3
	audio_end

Music_TheVastPlainDay_Ch2:
	semitone_offset 0

.loop
	wave WAVE_48
	volume 75
	audio_wait_24
	note NOTE_DURATION_16, C_2, 19
	audio_wait_48
	note A#1
	audio_wait_24
.sub1
	audio_wait_24
	note NOTE_DURATION_16, C_2, 19
	audio_wait_48
	note A#1
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_wait_24
	note NOTE_DURATION_16, C_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_48
.sub2
	audio_wait_16
	note NOTE_DURATION_3, A_1, 19
	audio_wait_8
	note C_2
	audio_wait_40
	note A_1
	audio_wait_8
	note C_2
	audio_wait_24
	audio_ret

	audio_wait_16
	note G#1
	audio_wait_8
	note C_2
	audio_wait_40
	note G#1
	audio_wait_8
	note C_2
	audio_wait_24
	audio_wait_16
	note E_1
	audio_wait_8
	note G_1
	audio_wait_40
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, C_2
	audio_wait_24
	audio_wait_16
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, E_2
	audio_wait_40
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, G_2
	audio_wait_24
	audio_wait_16
	note C_2
	audio_wait_8
	note F_2
	audio_wait_40
	note C_2
	audio_wait_8
	note F_2
	audio_wait_24
	audio_call .sub2
	audio_wait_16
	note NOTE_DURATION_3, B_1, 19
	audio_wait_8
	note D_2
	audio_wait_40
	note C_2
	audio_wait_8
	note F_2
	audio_wait_24
	audio_wait_16
	note C#2
	audio_wait_8
	note F#2
	audio_wait_40
	note D_2
	audio_wait_8
	note G_2
	audio_wait_24
	audio_jump .loop
.end
	wave WAVE_10
	volume 85
	audio_wait_24
	note NOTE_DURATION_16, C_2, 19
	audio_wait_48
	note A#1
	audio_wait_16
	audio_end

Music_TheVastPlainDay_Ch3:
	semitone_offset 0

.loop
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, C_1, 22
	audio_wait_16
	note NOTE_DURATION_8, G_1
	audio_wait_8
	note NOTE_DURATION_16, E_2
	audio_wait_16
	note NOTE_DURATION_3, G_1
	audio_wait_8
	note G_0
	audio_wait_16
	note NOTE_DURATION_8, F_1
	audio_wait_8
	note NOTE_DURATION_16, D_2
	audio_wait_16
	note NOTE_DURATION_3, F_1
	audio_wait_8
.sub1
	note NOTE_DURATION_3, C_1, 22
	audio_wait_16
	note NOTE_DURATION_8, G_1
	audio_wait_8
	note NOTE_DURATION_16, E_2
	audio_wait_16
	note NOTE_DURATION_3, G_1
	audio_wait_8
	note G_0
	audio_wait_16
	note NOTE_DURATION_8, F_1
	audio_wait_8
	note NOTE_DURATION_16, D_2
	audio_wait_16
	note NOTE_DURATION_3, F_1
	audio_wait_8
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_3, C_1, 22
	audio_wait_16
	note NOTE_DURATION_8, G_1
	audio_wait_8
	note NOTE_DURATION_16, E_2
	audio_wait_16
	note NOTE_DURATION_3, G_1
	audio_wait_8
	note E_2
	audio_wait_16
	note NOTE_DURATION_8, C_1
	audio_wait_8
	note NOTE_DURATION_16, D_1
	audio_wait_16
	note NOTE_DURATION_8, E_1
	audio_wait_8
	note NOTE_DURATION_3, F_1
	audio_wait_16
	note C_2
	audio_wait_8
	note F_2
	audio_wait_16
	note C_1
	audio_wait_8
	note F_1
	audio_wait_16
	note C_2
	audio_wait_8
	note F_2
	audio_wait_16
	note C_1
	audio_wait_8
	note F_1
	audio_wait_16
	note C_2
	audio_wait_8
	note F_2
	audio_wait_16
	note C_1
	audio_wait_8
	note F_1
	audio_wait_16
	note C_2
	audio_wait_8
	note F_2
	audio_wait_16
	note F_1
	audio_wait_8
	note C_1
	audio_wait_16
	note G_1
	audio_wait_8
	note C_2
	audio_wait_16
	note G_0
	audio_wait_8
	note C_1
	audio_wait_16
	note C_2
	audio_wait_8
	note E_2
	audio_wait_16
	note G_0
	audio_wait_8
	note C_1
	audio_wait_16
	note E_2
	audio_wait_8
	note G_2
	audio_wait_16
	note G_0
	audio_wait_8
	note C_1
	audio_wait_16
	note G_2
	audio_wait_8
	note C_3
	audio_wait_16
	note C_1
	audio_wait_8
	note F_1
	audio_wait_16
	note F_2
	audio_wait_8
	note A_2
	audio_wait_16
	note C_1
	audio_wait_8
	note F_1
	audio_wait_16
	note F_2
	audio_wait_8
	note A_2
	audio_wait_16
	note F_1
	audio_wait_8
	note D_1
	audio_wait_16
	note C_2
	audio_wait_8
	note F#2
	audio_wait_16
	note A_1
	audio_wait_8
	note D_1
	audio_wait_16
	note C_2
	audio_wait_8
	note F#2
	audio_wait_16
	note D_1
	audio_wait_8
	note G_1
	audio_wait_16
	note D_2
	audio_wait_8
	note G_2
	audio_wait_16
	note G_1
	audio_wait_8
	note A_1
	audio_wait_16
	note F_2
	audio_wait_8
	note A_2
	audio_wait_16
	note A_1
	audio_wait_8
	note A#1
	audio_wait_16
	note F#2
	audio_wait_8
	note A#2
	audio_wait_16
	note A#1
	audio_wait_8
	note B_1
	audio_wait_16
	note G_2
	audio_wait_8
	note B_2
	audio_wait_16
	note G_0
	audio_wait_8
	audio_jump .loop
.end
	wave WAVE_60
	volume 108
	note NOTE_DURATION_3, C_1, 22
	audio_wait_16
	note NOTE_DURATION_8, G_1
	audio_wait_8
	note NOTE_DURATION_16, E_2
	audio_wait_16
	note NOTE_DURATION_3, G_1
	audio_wait_8
	note G_0
	audio_wait_16
	note NOTE_DURATION_8, F_1
	audio_wait_8
	note NOTE_DURATION_16, D_2
	audio_wait_16
	note NOTE_DURATION_3, F_1
	audio_wait_3
	audio_end

Music_TheVastPlainDay_Ch4:
	semitone_offset 0

.loop
	wave WAVE_28
	volume 85
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_24
	note D_0
	audio_wait_24
.sub1
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3, D_0
	audio_wait_24
	audio_ret

.sub2
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_24
	note D_0
	audio_wait_24
	audio_ret

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
	wave WAVE_28
	volume 85
	note NOTE_DURATION_3, C_0, 19
	audio_wait_24
	note D_0
	audio_wait_24
	note C_0
	audio_wait_24
	note D_0
	audio_wait_3
	audio_end

Music_TheVastPlainDay:
	db $4, $2
	dw Music_TheVastPlainDay_Ch1
	dw Music_TheVastPlainDay_Ch2
	dw Music_TheVastPlainDay_Ch3
	dw Music_TheVastPlainDay_Ch4

; unused?
	dw Music_TheVastPlainDay_Ch1.loop
	dw Music_TheVastPlainDay_Ch2.loop
	dw Music_TheVastPlainDay_Ch3.loop
	dw Music_TheVastPlainDay_Ch4.loop

	dw Music_TheVastPlainDay_Ch1.end
	dw Music_TheVastPlainDay_Ch2.end
	dw Music_TheVastPlainDay_Ch3.end
	dw Music_TheVastPlainDay_Ch4.end
